using System.Collections.Generic;
using DG.DOTweenEditor;
using DG.Tweening;
using TMPro;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;

namespace Luzart.Tweener.EditorTools
{
    /// <summary>
    /// Adds ▶ Preview / ■ Stop buttons to every TweenAnimation / SequenceTweenAnimation inspector,
    /// playing the timeline in EDIT MODE via DOTweenEditorPreview. Target state (transform, rect,
    /// CanvasGroup alpha, TMP text) is snapshotted before preview and restored on stop; all designer
    /// UnityEvents are suppressed via TweenTimeline.SuppressUserEvents for the whole preview.
    /// Limitation: the rare "DelayStart + infinite loop + pre/after loop delay" gate tween is not
    /// simulated (the loop plays immediately, without its initial delay).
    /// </summary>
    [CustomEditor(typeof(TweenAnimationBase), true)]
    [CanEditMultipleObjects]
    public class TweenAnimationPreviewEditor : Editor
    {
        private struct Snapshot
        {
            public Transform Transform;
            public Vector3 LocalPosition;
            public Quaternion LocalRotation;
            public Vector3 LocalScale;

            public RectTransform Rect;
            public Vector3 AnchoredPosition3D;
            public Vector2 SizeDelta;
            public Vector2 AnchorMin;
            public Vector2 AnchorMax;

            public CanvasGroup CanvasGroup;
            public float Alpha;

            public TMP_Text Text;
            public string TextValue;
            public int MaxVisibleCharacters;
        }

        private static readonly List<Snapshot> Snapshots = new List<Snapshot>();
        private static TweenAnimationBase s_previewOwner;
        private static Tween s_previewTween;
        private static bool s_hooked;

        private static bool PreviewActive => Snapshots.Count > 0 || !ReferenceEquals(s_previewOwner, null);

        public override void OnInspectorGUI()
        {
            DrawDefaultInspector();

            if (targets.Length > 1 || Application.isPlaying || EditorApplication.isPlayingOrWillChangePlaymode)
            {
                return;
            }

            var anim = (TweenAnimationBase)target;
            GUILayout.Space(6);

            if (s_previewOwner == anim && !ReferenceEquals(s_previewOwner, null))
            {
                if (GUILayout.Button("■ Stop Preview", GUILayout.Height(24)))
                {
                    StopPreview();
                }
            }
            else
            {
                using (new EditorGUI.DisabledScope(PreviewActive))
                {
                    if (GUILayout.Button("▶ Preview", GUILayout.Height(24)))
                    {
                        StartPreview(anim);
                    }
                }
                if (PreviewActive && s_previewOwner != null)
                {
                    EditorGUILayout.HelpBox($"Another preview is running on '{s_previewOwner.name}'.", MessageType.Info);
                }
            }
        }

        private void OnDestroy()
        {
            if (!PreviewActive)
            {
                return;
            }
            // Stop when this inspector belonged to the preview owner, or when the owner was
            // destroyed mid-preview (fake-null) — never leave an edit-mode tween running.
            if (s_previewOwner == null || (TweenAnimationBase)target == s_previewOwner)
            {
                StopPreview();
            }
        }

        private static void StartPreview(TweenAnimationBase anim)
        {
            StopPreview();

            TweenTimeline.SuppressUserEvents = true;
            CaptureTargets(anim, new HashSet<TweenAnimationBase>());

            Tween tween = null;
            try
            {
                tween = anim.Show();
            }
            catch (System.Exception e)
            {
                Debug.LogException(e, anim);
            }
            if (tween == null)
            {
                TweenTimeline.SuppressUserEvents = false;
                RestoreSnapshots();
                return;
            }

            s_previewOwner = anim;
            s_previewTween = tween;
            // clearCallbacks also strips root OnComplete; user events are additionally gated
            // by SuppressUserEvents, which covers sequenced callbacks clearCallbacks cannot reach.
            DOTweenEditorPreview.PrepareTweenForPreview(tween, true, true, true);
            DOTweenEditorPreview.Start(OnPreviewUpdated);

            if (!s_hooked)
            {
                s_hooked = true;
                EditorApplication.playModeStateChanged += OnPlayModeStateChanged;
                AssemblyReloadEvents.beforeAssemblyReload += StopPreview;
                EditorSceneManager.sceneSaving += OnSceneSaving;
            }
        }

        private static void StopPreview()
        {
            if (!PreviewActive)
            {
                TweenTimeline.SuppressUserEvents = false;
                return;
            }

            // resetTweenTargets: true — DOTween rewinds every prepared tween to its start values
            // before we additionally restore from snapshots (double safety for the reset-to-origin).
            DOTweenEditorPreview.Stop(true);
            if (s_previewTween != null && s_previewTween.IsActive())
            {
                s_previewTween.Kill();
            }
            s_previewTween = null;
            if (s_previewOwner != null) // Unity-null safe: skips a destroyed owner
            {
                s_previewOwner.Stop();
            }
            s_previewOwner = null;

            RestoreSnapshots();
            TweenTimeline.SuppressUserEvents = false;

            // Render the restored state immediately — restoring alpha/position without a
            // player-loop update leaves the Game view frozen on the pre-restore frame,
            // which reads as "Stop didn't reset anything".
            EditorApplication.QueuePlayerLoopUpdate();
            UnityEditorInternal.InternalEditorUtility.RepaintAllViews();
        }

        private static void OnPreviewUpdated()
        {
            // Edit mode has no running player loop: QueuePlayerLoopUpdate re-runs UI/canvas
            // systems, and RepaintAllViews redraws EVERY view (Game view included — SceneView
            // alone leaves UI fades invisible) while also defeating the editor's idle
            // throttling (Interaction Mode), which is what makes the motion choppy.
            EditorApplication.QueuePlayerLoopUpdate();
            UnityEditorInternal.InternalEditorUtility.RepaintAllViews();

            // Auto-stop once the timeline finishes so the targets snap back to their original
            // state and the next ▶ Preview always starts from the beginning. Deferred via
            // delayCall — never stop the preview from inside its own update callback.
            // (Infinite loops never complete — the user stops those manually.)
            if (s_previewTween != null && s_previewTween.IsActive() && s_previewTween.IsComplete())
            {
                EditorApplication.delayCall += StopPreview; // StopPreview is idempotent
            }
        }

        private static void OnPlayModeStateChanged(PlayModeStateChange state)
        {
            if (state == PlayModeStateChange.ExitingEditMode)
            {
                StopPreview();
            }
        }

        private static void OnSceneSaving(UnityEngine.SceneManagement.Scene scene, string path)
        {
            StopPreview();
        }

        private static void CaptureTargets(TweenAnimationBase node, HashSet<TweenAnimationBase> visited)
        {
            if (node == null || !visited.Add(node))
            {
                return;
            }

            if (node is SequenceTweenAnimation sequence)
            {
                foreach (TweenAnimationBase child in sequence.GetChildren())
                {
                    CaptureTargets(child, visited);
                }
                return;
            }

            if (node is TweenAnimation tween)
            {
                // Show() may write Settings.General.Target (defaults it to gameObject) — make it undoable.
                Undo.RegisterCompleteObjectUndo(tween, "Tween Preview");

                Object source = tween.Settings?.General?.Target;
                GameObject go = source as GameObject;
                if (go == null && source is Component comp)
                {
                    go = comp.gameObject;
                }
                // Mirrors the worker: it only auto-adds a CanvasGroup when the Target resolves to a
                // GameObject/Component, or is null (Show defaults it to the component's own GO).
                // A garbage Target (Sprite/Material/...) makes the worker abort — no add here either.
                bool workerWouldAutoAdd = go != null || source == null;
                if (go == null)
                {
                    go = tween.gameObject;
                }

                // Fade auto-adds a CanvasGroup during Show — add it undoably BEFORE the snapshot
                // so the alpha gets captured and the component addition can be reverted.
                if (workerWouldAutoAdd &&
                    tween.TypeAnimation == EAnimation.FadeByCanvasGroup &&
                    !go.TryGetComponent(out CanvasGroup _))
                {
                    Undo.AddComponent<CanvasGroup>(go);
                }

                Capture(go);
            }
        }

        private static void Capture(GameObject go)
        {
            var snapshot = new Snapshot
            {
                Transform = go.transform,
                LocalPosition = go.transform.localPosition,
                LocalRotation = go.transform.localRotation,
                LocalScale = go.transform.localScale,
            };

            Undo.RegisterCompleteObjectUndo(go.transform, "Tween Preview");

            if (go.transform is RectTransform rect)
            {
                snapshot.Rect = rect;
                snapshot.AnchoredPosition3D = rect.anchoredPosition3D;
                snapshot.SizeDelta = rect.sizeDelta;
                snapshot.AnchorMin = rect.anchorMin;
                snapshot.AnchorMax = rect.anchorMax;
            }
            if (go.TryGetComponent(out CanvasGroup canvasGroup))
            {
                snapshot.CanvasGroup = canvasGroup;
                snapshot.Alpha = canvasGroup.alpha;
                Undo.RegisterCompleteObjectUndo(canvasGroup, "Tween Preview");
            }
            if (go.TryGetComponent(out TMP_Text text))
            {
                snapshot.Text = text;
                snapshot.TextValue = text.text;
                snapshot.MaxVisibleCharacters = text.maxVisibleCharacters;
                Undo.RegisterCompleteObjectUndo(text, "Tween Preview");
            }

            Snapshots.Add(snapshot);
        }

        private static void RestoreSnapshots()
        {
            for (int i = Snapshots.Count - 1; i >= 0; i--)
            {
                Snapshot s = Snapshots[i];
                if (s.Transform != null)
                {
                    s.Transform.localPosition = s.LocalPosition;
                    s.Transform.localRotation = s.LocalRotation;
                    s.Transform.localScale = s.LocalScale;
                }
                if (s.Rect != null)
                {
                    s.Rect.anchoredPosition3D = s.AnchoredPosition3D;
                    s.Rect.sizeDelta = s.SizeDelta;
                    s.Rect.anchorMin = s.AnchorMin;
                    s.Rect.anchorMax = s.AnchorMax;
                }
                if (s.CanvasGroup != null)
                {
                    s.CanvasGroup.alpha = s.Alpha;
                }
                if (s.Text != null)
                {
                    s.Text.text = s.TextValue;
                    s.Text.maxVisibleCharacters = s.MaxVisibleCharacters;
                }
            }
            Snapshots.Clear();
        }
    }
}
