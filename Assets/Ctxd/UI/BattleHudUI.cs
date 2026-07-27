using System.Threading;
using Cysharp.Threading.Tasks;
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
    /// Battle HUD: two general name+HP+morale corners, a center banner, and the stance wheel (Đột Kích / Tấn Công /
    /// Phòng Thủ + GIÁC). All child references are SERIALIZED and wired by the Editor forge. The director pushes
    /// state via <see cref="SetActiveGenerals"/> / <see cref="ShowBanner"/> on the instance ShowAsync returns — no Find.
    /// </summary>
    public sealed class BattleHudUI : UIBase<BattleHudData>
    {
        [Header("Generals")]
        [SerializeField] private TMP_Text _offName;
        [SerializeField] private TMP_Text _defName;
        [SerializeField] private Image _offHp;
        [SerializeField] private Image _defHp;
        [SerializeField] private Image _offMorale;
        [SerializeField] private Image _defMorale;

        [Header("Banner")]
        [SerializeField] private TMP_Text _banner;
        [SerializeField] private CanvasGroup _bannerGroup;

        [Header("Stance wheel")]
        [SerializeField] private Button _dotKich;
        [SerializeField] private Button _tanCong;
        [SerializeField] private Button _phongThu;
        [SerializeField] private Button _giac;

        private float _bannerTimer;

        public override UniTask OnCreateAsync(UIContext ctx, CancellationToken ct)
        {
            Wire(_dotKich, Stance.DotKich, false);
            Wire(_tanCong, Stance.TanCong, false);
            Wire(_phongThu, Stance.PhongThu, false);
            // GIÁC = thả chiến pháp nộ (cast=true) + giác tỉnh (awaken=true). Chỉ bật khi CanCast (xem SetActiveGenerals).
            if (_giac != null) _giac.onClick.AddListener(() => Data?.OnStance?.Invoke(Stance.DotKich, true, true));
            if (_giac != null) _giac.interactable = false;   // mờ tới khi nộ đủ
            if (_bannerGroup != null) _bannerGroup.alpha = 0f;
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
                if (_offName) _offName.text = off.DisplayName;
                if (_offHp) _offHp.fillAmount = Ratio(off.Troops, off.MaxTroops);
                if (_offMorale) _offMorale.fillAmount = Mathf.Clamp01(off.Morale / (float)Mathf.Max(1, off.MoraleFull));
                if (_giac != null) _giac.interactable = off.CanCast;   // RE: nút thả 战法 chỉ bật khi useAble (server-gate)
            }
            if (def != null)
            {
                if (_defName) _defName.text = def.DisplayName;
                if (_defHp) _defHp.fillAmount = Ratio(def.Troops, def.MaxTroops);
                if (_defMorale) _defMorale.fillAmount = Mathf.Clamp01(def.Morale / (float)Mathf.Max(1, def.MoraleFull));
            }
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
