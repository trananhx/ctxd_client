using System.Collections.Generic;
using System.Threading;
using Cysharp.Threading.Tasks;
using DG.Tweening;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Luzart;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;

namespace Ctxd.UI
{
    /// <summary>Payload for the battle HUD: the stance-choice callback (wired to the server-driven director).</summary>
    public sealed class BattleHudData
    {
        // (stance, awaken, cast) — RE: cast = người chơi bấm thả 战法 thủ công (nút GIÁC), stance = 3 thế trận.
        public System.Action<Stance, bool, bool> OnStance;
    }

    /// <summary>
    /// Battle HUD: hai cụm tướng (khung avatar + chân dung rip + máu/số quân + sao nộ + dãy buff),
    /// banner ribbon giữa, pop tên chiến pháp, và stance wheel (Đột Kích / Tấn Công / Phòng Thủ + GIÁC).
    /// All child references are SERIALIZED and wired by the Editor forge. The director pushes state via
    /// <see cref="SetActiveGenerals"/> / <see cref="SyncSideEffects"/> / <see cref="ShowBanner"/> /
    /// <see cref="ShowSkillName"/> on the instance ShowAsync returns — no Find.
    /// </summary>
    public sealed class BattleHudUI : UIBase<BattleHudData>
    {
        [Header("Generals")]
        [SerializeField] private TMP_Text _offName;
        [SerializeField] private TMP_Text _defName;
        [SerializeField] private Image _offHp;
        [SerializeField] private Image _defHp;
        [SerializeField] private Image _offMorale;   // legacy (không wire từ đợt reskin — sao nộ thay thế)
        [SerializeField] private Image _defMorale;

        [Header("Reskin — avatar/sao nộ/buff")]
        [SerializeField] private Image _offPortrait;
        [SerializeField] private Image _defPortrait;
        [SerializeField] private TMP_Text _offTroops;
        [SerializeField] private TMP_Text _defTroops;

        [Header("Thanh máu ĐỐT (càng nhiều quân càng nhiều đốt)")]
        [SerializeField] private RectTransform _offSegRow;
        [SerializeField] private RectTransform _defSegRow;
        [SerializeField] private GameObject _segTemplate;        // con inactive của _offSegRow
        [SerializeField] private int _troopsPerSegment = 2000;   // 1 đốt = bao nhiêu quân (Inspector chỉnh được)
        [SerializeField] private float _segGap = 2f;
        [SerializeField] private Image[] _offStars = new Image[6];
        [SerializeField] private Image[] _defStars = new Image[6];
        [SerializeField] private RectTransform _offBuffRow;
        [SerializeField] private RectTransform _defBuffRow;
        [SerializeField] private GameObject _buffTemplate;   // con inactive của _offBuffRow

        [Header("Banner")]
        [SerializeField] private TMP_Text _banner;
        [SerializeField] private CanvasGroup _bannerGroup;

        [Header("Reskin — skill pop")]
        [SerializeField] private CanvasGroup _skillPopGroup;
        [SerializeField] private Image _skillPopImage;
        [SerializeField] private TMP_Text _skillPopText;

        [Header("Stance wheel")]
        [SerializeField] private Button _dotKich;
        [SerializeField] private Button _tanCong;
        [SerializeField] private Button _phongThu;
        [SerializeField] private Button _giac;

        private float _bannerTimer;
        private string _offPortraitId, _defPortraitId;   // tránh tra art lại mỗi snapshot
        private bool _giacWasOn;
        private Tween _skillPopTween;
        private bool _stanceLocked;                       // [theo lượt] đã gửi lệnh — chờ hết turn mới mở
        private bool _lastCanCast;                        // trạng thái nộ gần nhất (kết hợp với khoá lượt cho GIÁC)

        public override UniTask OnCreateAsync(UIContext ctx, CancellationToken ct)
        {
            Wire(_dotKich, Stance.DotKich, false);
            Wire(_tanCong, Stance.TanCong, false);
            Wire(_phongThu, Stance.PhongThu, false);
            // GIÁC = thả chiến pháp nộ (cast=true) + giác tỉnh (awaken=true). Chỉ bật khi CanCast (xem SetActiveGenerals).
            if (_giac != null) _giac.onClick.AddListener(() => Data?.OnStance?.Invoke(Stance.DotKich, true, true));
            if (_giac != null) _giac.interactable = false;   // mờ tới khi nộ đủ
            if (_bannerGroup != null) _bannerGroup.alpha = 0f;
            if (_skillPopGroup != null) _skillPopGroup.alpha = 0f;
            return UniTask.CompletedTask;
        }

        private void Wire(Button b, Stance s, bool awaken)
        {
            if (b != null) b.onClick.AddListener(() => Data?.OnStance?.Invoke(s, awaken, false));   // 3 thế trận: cast=false
        }

        public void SetActiveGenerals(CombatantSnapshot off, CombatantSnapshot def)
        {
            if (off != null)
            {
                // FiveStar → tên nhuộm vàng (KHÔNG dùng ký tự ★ — font Saira thiếu glyph, hiện tofu).
                if (_offName) { _offName.text = off.DisplayName; if (off.FiveStar) _offName.color = CtxdPalette.TxtTitle; }
                if (_offHp) _offHp.fillAmount = Ratio(off.Troops, off.MaxTroops);   // legacy fill (bản đốt không wire)
                if (_offMorale) _offMorale.fillAmount = Mathf.Clamp01(off.Morale / (float)Mathf.Max(1, off.MoraleFull));
                if (_offTroops) _offTroops.text = CtxdArt.FormatTroops(off.Troops, off.MaxTroops);
                SetSegmentBar(_offSegRow, off.Troops, off.MaxTroops, CtxdPalette.HpAlly);
                SetPortrait(_offPortrait, off.DefId, ref _offPortraitId);
                SetStars(_offStars, off.Morale, off.MoraleFull);
                SetGiac(off.CanCast);
            }
            if (def != null)
            {
                if (_defName) { _defName.text = def.DisplayName; if (def.FiveStar) _defName.color = CtxdPalette.TxtTitle; }
                if (_defHp) _defHp.fillAmount = Ratio(def.Troops, def.MaxTroops);   // legacy fill (bản đốt không wire)
                if (_defMorale) _defMorale.fillAmount = Mathf.Clamp01(def.Morale / (float)Mathf.Max(1, def.MoraleFull));
                if (_defTroops) _defTroops.text = CtxdArt.FormatTroops(def.Troops, def.MaxTroops);
                SetSegmentBar(_defSegRow, def.Troops, def.MaxTroops, CtxdPalette.HpEnemy);
                SetPortrait(_defPortrait, def.DefId, ref _defPortraitId);
                SetStars(_defStars, def.Morale, def.MoraleFull);
            }
        }

        /// <summary>
        /// Thanh máu ĐỐT kiểu game gốc: số đốt = MaxTroops/_troopsPerSegment (clamp 3..14) — tướng càng đông quân
        /// càng nhiều đốt; đốt biên tụt dần bằng fillAmount (tổng các đốt luôn = MaxTroops). Rebuild chỉ khi số đốt đổi.
        /// </summary>
        private void SetSegmentBar(RectTransform row, int troops, int max, Color color)
        {
            if (row == null || _segTemplate == null || max <= 0) return;
            int segCount = Mathf.Clamp(Mathf.CeilToInt(max / (float)Mathf.Max(1, _troopsPerSegment)), 3, 14);

            int liveSegs = 0;
            for (int i = 0; i < row.childCount; i++) if (row.GetChild(i).gameObject != _segTemplate) liveSegs++;
            if (liveSegs != segCount)
            {
                for (int i = row.childCount - 1; i >= 0; i--)
                {
                    var c = row.GetChild(i).gameObject;
                    if (c != _segTemplate) Destroy(c);
                }
                float rowW = row.rect.width > 1f ? row.rect.width : 236f;   // canvas chưa layout frame đầu → fallback
                float w = (rowW - _segGap * (segCount - 1)) / segCount;
                for (int i = 0; i < segCount; i++)
                {
                    var go = Instantiate(_segTemplate, row);
                    go.SetActive(true);
                    var rt = (RectTransform)go.transform;
                    rt.anchorMin = new Vector2(0, 0); rt.anchorMax = new Vector2(0, 1); rt.pivot = new Vector2(0, 0.5f);
                    rt.anchoredPosition = new Vector2(i * (w + _segGap), 0);
                    rt.sizeDelta = new Vector2(w, 0);
                }
            }

            float perSeg = max / (float)segCount;
            int idx = 0;
            for (int i = 0; i < row.childCount; i++)
            {
                var c = row.GetChild(i).gameObject;
                if (c == _segTemplate) continue;
                var img = c.GetComponent<Image>();
                if (img != null)
                {
                    img.color = color;
                    img.fillAmount = Mathf.Clamp01((troops - idx * perSeg) / perSeg);
                }
                idx++;
            }
        }

        private static void SetPortrait(Image img, string generalId, ref string cachedId)
        {
            if (img == null || generalId == cachedId) return;
            cachedId = generalId;
            var sp = CtxdArt.Portrait(generalId);
            img.sprite = sp;
            img.enabled = sp != null;      // không có chân dung → để trống khung (placeholder là nền khung)
            img.preserveAspect = true;
        }

        private static void SetStars(Image[] stars, int morale, int full)
        {
            if (stars == null) return;
            float ratio = full > 0 ? Mathf.Clamp01(morale / (float)full) : 0f;
            int lit = Mathf.FloorToInt(ratio * stars.Length + 0.0001f);
            for (int i = 0; i < stars.Length; i++)
            {
                if (stars[i] == null) continue;
                var sp = CtxdArt.AngerStar(i + 1);
                if (sp != null && stars[i].sprite != sp) { stars[i].sprite = sp; stars[i].enabled = true; }
                bool on = i < lit;
                var c = stars[i].color; c.a = on ? 1f : 0.28f; stars[i].color = c;
            }
        }

        /// <summary>
        /// [Theo lượt] Khoá/mở cụm nút thế trận: bấm là KHOÁ tới khi lượt diễn xong (Director mở lại khi
        /// snapshot cuối lượt được áp). GIÁC chỉ mở khi vừa hết khoá vừa đủ nộ.
        /// </summary>
        public void SetStanceLocked(bool locked)
        {
            _stanceLocked = locked;
            if (_dotKich != null) _dotKich.interactable = !locked;
            if (_tanCong != null) _tanCong.interactable = !locked;
            if (_phongThu != null) _phongThu.interactable = !locked;
            if (_giac != null) _giac.interactable = !locked && _lastCanCast;
        }

        /// <summary>GIÁC bật/tắt + punch scale khi vừa đầy nộ; sao cuối phe ta nhấp nháy chờ thả chiến pháp.</summary>
        private void SetGiac(bool canCast)
        {
            _lastCanCast = canCast;
            if (_giac != null)
            {
                _giac.interactable = canCast && !_stanceLocked;
                if (canCast && !_giacWasOn)
                    ((RectTransform)_giac.transform).DOPunchScale(Vector3.one * 0.12f, 0.35f, 6, 0.7f);
            }
            var last = (_offStars != null && _offStars.Length > 0) ? _offStars[_offStars.Length - 1] : null;
            if (last != null)
            {
                if (canCast && !_giacWasOn)
                    last.DOFade(0.45f, 0.5f).SetLoops(-1, LoopType.Yoyo);
                else if (!canCast && _giacWasOn)
                {
                    last.DOKill();
                    var c = last.color; c.a = 1f; last.color = c;   // SetStars sẽ chỉnh lại theo nộ ngay sau
                }
            }
            _giacWasOn = canCast;
        }

        /// <summary>[FX] Dãy icon buff bền theo phe (từ SideSnapshot.Effects — rebuild nhẹ, ≤5 icon).</summary>
        public void SyncSideEffects(SideSnapshot off, SideSnapshot def)
        {
            FillBuffRow(_offBuffRow, off?.Effects);
            FillBuffRow(_defBuffRow, def?.Effects);
        }

        private void FillBuffRow(RectTransform row, List<ActiveEffectSnapshot> fx)
        {
            if (row == null || _buffTemplate == null) return;
            for (int i = row.childCount - 1; i >= 0; i--)
            {
                var c = row.GetChild(i).gameObject;
                if (c != _buffTemplate) Destroy(c);
            }
            if (fx == null) return;
            foreach (var e in fx)
            {
                var go = Instantiate(_buffTemplate, row);
                go.SetActive(true);
                var img = go.GetComponent<Image>();
                if (img != null) img.sprite = CtxdArt.BuffIcon(e.FxId);
                var badge = go.GetComponentInChildren<TMP_Text>(true);
                if (badge != null) badge.text = e.RemainingRounds >= 0 ? e.RemainingRounds.ToString() : "";
            }
        }

        /// <summary>Pop tên chiến pháp giữa màn: ảnh thư pháp rip nếu map được, không thì text thư pháp (TacticName server gửi).</summary>
        public void ShowSkillName(string skillId, string skillName)
        {
            if (_skillPopGroup == null) return;
            var pic = CtxdArt.SkillNamePic(skillId);
            if (_skillPopImage != null)
            {
                _skillPopImage.sprite = pic;
                _skillPopImage.enabled = pic != null;
                _skillPopImage.preserveAspect = true;
            }
            if (_skillPopText != null) _skillPopText.gameObject.SetActive(pic == null);
            if (pic == null)
            {
                if (_skillPopText == null || string.IsNullOrEmpty(skillName)) return;
                _skillPopText.text = skillName;
            }
            _skillPopTween?.Kill();
            var rt = (RectTransform)_skillPopGroup.transform;
            _skillPopGroup.alpha = 0f;
            rt.localScale = Vector3.one * 1.6f;
            _skillPopTween = DOTween.Sequence()
                .Append(_skillPopGroup.DOFade(1f, 0.15f))
                .Join(rt.DOScale(1f, 0.25f).SetEase(Ease.OutBack))
                .AppendInterval(1.1f)
                .Append(_skillPopGroup.DOFade(0f, 0.3f));
        }

        public void ShowBanner(string text, float dur)
        {
            if (_banner == null) return;
            _banner.text = text;
            _bannerTimer = dur;
            if (_bannerGroup != null) _bannerGroup.alpha = 1f;
        }

        private void Update()
        {
            if (_bannerTimer > 0f)
            {
                _bannerTimer -= Time.deltaTime;
                if (_bannerTimer <= 0f && _bannerGroup != null) _bannerGroup.alpha = 0f;
            }
        }

        private static float Ratio(int v, int max) => max > 0 ? Mathf.Clamp01((float)v / max) : 0f;
    }
}
