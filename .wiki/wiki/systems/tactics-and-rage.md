---
title: Chiến pháp & Nộ khí/Sĩ khí (战法/怒气/士气)
category: systems
tags: [chien-phap, no-khi, si-khi, chien-dau, ky-nang-tuong]
sources: []
created: 2026-06-27
updated: 2026-07-24
---

# Chiến pháp & Nộ khí/Sĩ khí (战法/怒气/士气)

Trang này mô tả lớp **kỹ năng tướng (战法 — chiến pháp)** chồng lên trên lớp thế trận thời gian thực, cùng cơ chế tích lũy năng lượng (**士气 — sĩ khí** / **怒气 — nộ khí**) quyết định thời điểm xả chiến pháp. Đây là phần tinh túy nhất của chiến đấu trong **攻城掠地 (Công Thành Xưng Đế, bản webgame 傲世堂 2013)** — nơi người chơi giỏi tách biệt khỏi auto-battle. Xem lớp nền chiến đấu ở [[systems/battle-system]], hệ tướng & thuộc tính ở [[systems/general-system]], danh sách tướng cụ thể ở [[entities/generals]].

> [!info] Xác thực từ dịch ngược client (2026-07-24) — [[sources/apk-reverse-engineering-2026-07-24]]
> **Mã ID chiến pháp 7 chữ số**: chữ đầu = loại (1 Đột kích / 2 Phòng thủ / 3 Công kích), chữ 2-3 = địa hình (11 bình nguyên / 12 sơn địa / 13 thuỷ vực / 14 thành trì); "jiacheng" = biến thể khớp địa hình (bonus, có hiệu ứng "thắng đặc biệt"). Trước mỗi hiệp server đẩy **report 27** mở bảng 3 chiến pháp theo địa hình + gợi ý (`recommend`). **Nộ**: nút chỉ hiện khi server đẩy `strategy.useAble > 0`; người chơi **bấm** → `battleUserStrategy` = **cast thủ công** (khớp V5; client dùng tên `strategy`, KHÔNG đặt 士气/怒气 → thuật ngữ vẫn mở). `beHold` (0-3) điều khiển **phản/giữ** chiến pháp; `nextTacticId` = chiến pháp **chuỗi kế**; buff `luanwu` (Loạn Vũ) tăng sát thương chiến pháp. Kỹ năng tướng ký danh (Tư Mã Ý Phản Đàn, Gia Cát Bát Quái, Chu Du Xích Diệm Mê Trận, Lữ Bố Tự Bạo, Tào Tháo Hào Lệnh Thiên Hạ…) trong `uiConstant.lua`. Con số (ngưỡng nộ, % sát thương, hệ số địa hình) ở server. Xem [[claims#c-20260724-09]].

## 1. Sĩ khí (士气) — đính chính so với "nộ khí cổ điển"

Trong nghiên cứu trước có nghi vấn liệu có một thanh "nộ khí" kiểu tích-đầy-rồi-xả hay không. Nay đã có tài liệu rõ về **mô hình sĩ khí (士气 / morale)** vận hành như sau:

- Mỗi đơn vị **vào trận với 50 sĩ khí**.
- Sĩ khí **tăng khi tấn công, khi bị đánh, và khi giết lính** đối phương.
- Khi sĩ khí **đầy 100**, đơn vị **xả KỸ NĂNG 2 (战法 — chiến pháp chính)**.
- Lính **5★ vào trận đã sẵn 100 sĩ khí** → xả chiến pháp ngay lượt đầu.

> [!info] Suy ra cấu trúc 2 kỹ năng của tướng
> Từ mô hình trên có thể suy luận tướng có hai mức kỹ năng: **kỹ-năng-1** (kích hoạt khi sĩ khí thấp / điều kiện thường) và **kỹ-năng-2** tức 战法 chính (kích hoạt khi sĩ khí đầy 100). Đây là suy luận thiết kế, chưa có nguồn nêu thẳng cấu trúc "2 slot kỹ năng" cho mọi tướng.

> [!warning] Thuật ngữ 士气 (sĩ khí) vs 怒气 (nộ khí) — CHƯA CHỐT, đừng khẳng định
> ⚠️ **Chưa xác định được tên chính thức của thanh tích năng lượng.** Trang official mô tả cơ chế "bấm hình tướng khi thanh đầy để thả 战法" **KHÔNG dùng từ 士气 lẫn 怒气** (chỉ mô tả hành vi, không đặt tên tài nguyên); nguồn gamersky thì dùng **怒气 (nộ khí)**. Vì official không dùng từ nào, **KHÔNG được khẳng định thanh này tên "怒气" là sai**, cũng chưa được chốt là "士气". Tài liệu webgame gốc thường dùng **怒气 (nộ khí)** cho thanh tích để xả 战法, còn mô tả "vào trận 50, đầy 100 thì xả kỹ năng 2" dùng **士气 (sĩ khí)** — hai từ **rất có thể là một cơ chế được gọi bằng hai tên** (asset Unity local có `warFeatAnger` = hiệu ứng nộ khí), nhưng đây vẫn là **suy đoán chưa chốt**. Nguồn xác minh cho thấy đây là **hệ lai nộ-khí + hồi chiêu** chứ không thuần "đầy bar = tự xả": có nguồn VN mô tả chiến pháp ra **sau mỗi ~3 đòn đánh**, và hồi chiêu giảm khi tướng bị đánh (bị 1 đòn = -1, 2 đòn = -2). Coi quan hệ chính xác giữa con số 50/100 và nhịp "3 đòn" là **partially-confirmed**. NGUỒN official (không đặt tên tài nguyên): https://gc.aoshitang.com/news/ziliao/152012121118262077467.html

Một cải tiến liên quan là **Nộ Diễm (怒焰)** (đột phá mốc +8): cho phép **hồi nộ khí nhanh sau khi giết lính**, để xả 战法 liên tục — củng cố rằng đây là tài nguyên có thể tăng tốc, không phải hằng số.

## 2. Điều kiện kích hoạt 战法 (chiến pháp)

战法 vừa **tự động / theo điều kiện**, vừa **có thể xả THỦ CÔNG** khi thanh năng lượng đầy. Các kiểu trigger đã xác nhận (confirmed):

- **Xả THỦ CÔNG (bấm hình tướng) — CHỐT (official):** khi thanh đầy, người chơi **BẤM vào hình/chân dung tướng ở giữa để thả 战法** — official逐字: "点击中间武将头像就会释放该武将的战法". Đây là hành động chủ động của người chơi, không thuần auto. NGUỒN: https://gc.aoshitang.com/news/ziliao/152012121118262077467.html

- **Lên trận có xác suất (上阵触发):** vừa ra trận có cơ hội kích hoạt (ví dụ 武神降临 của Quan Vũ "có几率 trigger khi lên trận"). Nguồn ghi "几率" mà không nêu phần trăm cụ thể.
- **Khi giết một hàng / một tướng:** sau khi diệt một hàng lính địch, hàng kế tiếp tự xả 战法 ở lượt sau; Lữ Bố xả đòn tiếp mỗi lần giết một hàng.
- **Mốc HP (HP thresholds):** kinh điển là Triệu Vân **七进七出 (Thất Tiến Thất Xuất)** kích hoạt khi máu xuống dưới **80% / 50% / 20%**, mỗi lần đánh 2 hàng.

Ngoài các trigger *theo điều kiện* ở trên, mô hình dựng lại còn cần một chế độ **castMode = "dùng N LẦN mỗi lượt ra trận"** (số charge cố định, xả bất kể điều kiện) — tách bạch với nhóm trigger điều kiện (on-deploy %, on-kill-row, mốc self-HP). Nói cách khác **castMode = { N-lần | theo-điều-kiện }**: cùng một 战法 có thể vừa có số lần xả tối đa, vừa gắn điều kiện kích hoạt.

> [!info] castMode N-lần được củng cố bởi 太史慈 "4 排 + phát 2 lần" (nguồn thứ cấp, medium)
> Xác minh qua web cho thấy một 战法 có thể có **số lần phát (次数)** riêng: ví dụ **太史慈 (Thái Sử Từ) 乘胜追击** đánh **4 排 và phát 2 lần**. Đây củng cố concept **castMode = N-lần** (số charge cố định trên mỗi 战法), tách bạch với số hàng đánh. Độ tin **medium** (nguồn thứ cấp): https://www.shiyouhome.com/gcld/wjfx/1995.html

> [!question] Code gap — điều kiện kích hoạt hiện thực còn thiếu nhiều (FIX-4)
> Đây là **khoảng trống code**, KHÔNG phải thứ đã có sẵn. Sim hiện chỉ hiện thực **một** đường: **morale-gate của Skill2** — `bool moraleReady = actor.Morale >= _cfg.MoraleFull && actor.Skill2 != null;` (`Assets/Ctxd/Battle/Sim/BattleRunner.cs:106`), xả khi sĩ khí đầy và không bị Hỗn Loạn. Còn **THIẾU**: (1) bộ đếm **castMode N-lần** (không có charge counter), (2) trigger **on-kill-row** (giết một hàng → hàng sau xả), (3) điều kiện **self-HP threshold** (kiểu 七进七出), (4) **Skill1** (kỹ năng sĩ khí thấp) — `Combatant.Skill1` được load nhưng **không bao giờ được xả**, là **dead field ❓** cho tới khi chốt điều kiện trigger. Xem mô hình đơn vị & các slot kỹ năng ở [[systems/unit-entity-model]]. Lớp skill data-driven mới (rule-engine) được author trong `scenario.json` qua **TacticDto.Program** (commit `cbe1297`, đọc bởi `TacticProgram`/`RuleEffect`) là bước tiến để về sau biểu diễn các castMode/trigger này bằng data thay vì hard-code.

> [!info] Vì sao thứ tự tướng quan trọng
> Vì mỗi tướng có 战法 khác nhau và điều kiện trigger khác nhau, người chơi **đổi thứ tự tướng trước trận** để dây chuyền kích hoạt tối ưu. Xem [[systems/battle-system]] và [[systems/formation-system]].

> [!warning] Khóa 战法 theo bối cảnh
> Khi đang bị **vây thành (围城)**, người chơi nước bị vây **không thể xả 战法**. Đây là cơ chế khóa kỹ năng theo bối cảnh, độ tin medium. Xem [[systems/city-conquest]].

## 3. Phân loại hiệu ứng 战法

Các nhóm hiệu ứng quan sát được (confirmed qua danh sách tướng giác tỉnh):

| Nhóm | Mô tả | Ví dụ tướng |
|---|---|---|
| Sát thương đơn/đa hàng | Đánh 1 đến nhiều hàng | nền tảng nhiều tướng |
| AoE diện rộng | 3-5 hàng cùng lúc | Triệu Vân 龙枪傲世 (5 hàng mỗi lần giết), Cam Ninh 绞龙巨浪 (5 hàng, tối đa 5x) |
| Khống chế (混乱 Hỗn Loạn) | Trúng đòn khiến địch **không xả được 战法** | Chu Du 赤焰迷阵 (4 hàng + 混乱) |
| Tức sát (về 1 HP) | Ép các hàng trước địch còn **1 HP** | Quan Vũ 武神降临 (3 hàng trước về 1 HP) |
| Đẩy lùi (pushback) | Đẩy lùi quân hậu phương địch | Trương Phi 灭世咆哮 (3 hàng + đẩy lùi) |
| Buff / né | Tăng công/né đòn | Lữ Bố 战神无双 (4 hàng + có cơ hội né 战法), Gia Cát Lượng 逢凶化吉 (né sát thương theo xác suất) |

**混乱 (Hỗn Loạn)** là hiệu ứng khống chế chủ đạo: khiến địch **cấm xả 战法** trong thời gian trúng hiệu ứng — đòn bẩy chiến thuật then chốt.

> [!info] Số hàng (排 2–5) là thuộc tính RIÊNG của MỖI 战法 — CHỐT (official 武将大全)
> **Đã xác minh qua web (official):** số hàng bị đánh (排) là một **thuộc tính riêng gắn trên từng 战法**, dao động **2–5 hàng**, không phải hằng số toàn cục. Danh sách官方 từ 傲世堂 武将大全:
> | Tướng | 战法 | Số hàng |
> |---|---|---|
> | 庞德 (Bàng Đức) | 冲锋 | **3 排** |
> | 甘宁 (Cam Ninh) | 固守 | **4 排** |
> | 夏侯惇 (Hạ Hầu Đôn) | 飞羽 | **穿 4 排** (xuyên 4 hàng) |
> | 徐晃 (Từ Hoảng) | 背水 | **3 排** |
> | 吕蒙 (Lữ Mông) | 入侵 | **2 排** |
> | 祝融 (Chúc Dung) | 突击 | **3 排** |
> NGUỒN: https://gc.aoshitang.com/news/gonglue/772013041123252111032.html (武将大全 - Aoshitang chính thức).
> (太史慈 "4排+2 lần", 赵云 "5&2排" là nguồn THỨ CẤP → độ tin medium: https://www.shiyouhome.com/gcld/wjfx/1995.html , https://www.9game.cn/news/9767095.html )
>
> Theo ý đồ, **số hàng bị đánh** nên là **một hiệu ứng/thuộc tính** gắn trên 战法 (khớp đọc-từ-ảnh 🎨: UNIT A "Công thành chiếm đất **(4 hàng)**", UNIT C "Sư/Thiết Kỵ Vô Song **(5 hàng)**").
> **Nhưng code hiện là `RowsHit` CỨNG**: sát thương nhân theo `double rowFactor = 1.0 + 0.35 * (Math.Max(1, tactic.RowsHit) - 1);` (`Assets/Ctxd/Battle/Sim/CombatOps.cs:248`), với `RowsHit` là một `int` cố định trên `TacticSpec` (`TacticSpec.cs:12`). Đây đúng là mô hình "số hàng per-战法" mà web xác nhận, nhưng chưa hỗ trợ buff cộng dồn.
> **FIX-4 (code gap ❓):** một buff kiểu `ExtraRowsHit` (cộng thêm số hàng đánh, xếp chồng với buff khác) mới chỉ là **đề xuất data-model, CHƯA có trong code**. Đừng coi đây là canon.

> [!question] Đơn vị CÓ THỂ không có chiến pháp — tương quan, không nhân-quả (FIX-2)
> UNIT B (**Nhục Bác Tứ Sĩ / 肉搏死士**, khả dĩ **Chu Thái 周泰**) đọc-từ-ảnh 🎨 có ô **chiến pháp TRỐNG** (không hiển thị 战法 nào) và chỉ số **Dũng 62 rất thấp**. Khớp mô tả Chu Thái "không có 战法". **Lưu ý FIX-2:** "Dũng thấp → không có chiến pháp" chỉ là **TƯƠNG QUAN**, KHÔNG phải bằng chứng nhân-quả; ánh xạ Thống(统)/Dũng(勇) sang thuộc tính code (NormalAtk/TacticAtk) vẫn là suy diễn chưa chốt — xem [[contradictions]]. Dù vậy, mô hình dựng lại **phải cho phép** một đơn vị hợp lệ mà **Skill2 = null** (đúng như guard `actor.Skill2 != null` ở `BattleRunner.cs:106`).

## 4. Kháng (抵挡) và lớp ưu tiên của 战法

- **Kháng (抵挡)** là khả năng phòng thủ **vô hiệu hóa một 战法** của địch.
- **战法 đứng TRÊN lớp thế trận:** GameRes ghi rõ 战法 "克制一切战术" (khắc chế mọi chiến thuật) — khi 战法 kích hoạt, nó **bỏ qua tam giác thế trận** 突击/攻击/防守. Xem chi tiết tam giác thế trận ở [[systems/battle-system]].
- **Chiến pháp giác tỉnh (觉醒) KHÔNG THỂ bị kháng:** 战法 觉醒 "永远不会被抵挡" (vĩnh viễn không bị kháng), **sát thương cố định, tất trúng (必中)**, vô hiệu phản đòn của Tư Mã Ý, không bị phản kích.

> [!tip] Lưu ý khi dựng lại
> Cần mô hình hóa rõ hai cờ trên đơn vị: `canBeResisted` (战法 thường) và `unblockable` (战法 giác tỉnh). Đơn vị giác tỉnh đồng thời **mất khả năng kháng** của chính nó. Thứ tự giải quyết: trigger → kiểm 混乱 (nếu bị Hỗn Loạn thì hủy xả) → kiểm 抵挡 (nếu không phải giác tỉnh) → áp sát thương.

## 5. Thuộc tính chi phối sức mạnh 战法

Tướng có **5 thuộc tính chiến đấu** (partially-confirmed — xem cảnh báo dưới):

- **统 (Thống / command)** → chi phối **普通攻击 / 普通防御** (công/thủ thường). Quy đổi ~**1 điểm = 10 công/thủ**.
- **勇 (Dũng / valor)** → chi phối **战法攻击 / 战法防御** (công/thủ chiến pháp). Cũng ~**1 điểm = 10**.
- **计策 (Kế sách / stratagem)** → thuộc tính thứ 5, hệ kế sách layered cùng 战法.

> [!warning] Thuộc tính 英勇 (+10% sát thương 战法) chưa xác minh
> Việc một thuộc tính tên **英勇** cho **+10% sát thương 战法** **không tìm được nguồn** (likely-inaccurate). Các nguồn chỉ thấy buff chung/địa hình ~10%-16%, là cơ chế khác. Năm thuộc tính và ánh xạ 统/勇 (1 điểm = 10) thì **đã xác nhận**.

> [!question] Vai trò chính xác của 计策 (Kế sách)
> Nguồn nêu 计策 là thuộc tính thứ 5 nhưng **không định nghĩa công thức**: liệu nó chi phối tỉ lệ trúng khống chế/debuff và kháng, hay là một dòng kỹ năng kế sách riêng? Cần xác minh thêm.

> [!warning] 战力 (Lực chiến) ≠ sát thương — CHỐT (củng cố FIX-1)
> **Đã xác minh qua web:** **战力 (战斗力 / Lực chiến)** là **chỉ số TỔNG HỢP thực lực** của tướng/đội hình, **KHÔNG phải** con số sát thương gây ra mỗi đòn. Do đó buff dạng "**+X% 战力 / 战斗力**" là **hệ số NHÂN** `(1 + 加成)` trong công thức tính lực, **không phải** cộng thẳng vào sát thương. Đừng nhầm 战力 với damage output khi dựng lại công thức. NGUỒN: http://www.07073.com/gcld/gonglue/1145296.html

### Hệ số sát thương (damage modifiers)

- **Bạo kích (暴击 / critical): 200%** sát thương.
- **Loạn vũ (乱舞): 150%** sát thương.
- **Độ bền / Nhẫn tính (韧性):** **giảm một nửa sát thương 战法** nhận vào.

> [!tip] Khi dựng lại
> Mô hình sát thương 战法 nên gồm: `base = 战法攻击 - 战法防御 (đối phương)`, rồi nhân hệ số bạo kích/loạn vũ, rồi áp 韧性 (giảm 1/2) nếu đối phương có. 战法 giác tỉnh bỏ qua bước trừ phòng thủ (sát thương cố định, tất trúng).

## 6. Vũ Thần Phụ Thể (武神附体) → Vũ Thần Giáng Lâm (武神降临)

Đây là chuỗi chiến pháp tiêu biểu của **Quan Vũ (关羽)** và là ví dụ chuẩn cho cơ chế giác tỉnh:

- **武神附体 (Vũ Thần Phụ Thể):** 战法 nền của Quan Vũ — **kháng chiến thuật + đánh đồng thời 3 hàng** lính địch.
- Sau **Giác tỉnh (觉醒)** → nâng cấp thành **武神降临 (Vũ Thần Giáng Lâm):** lên trận có xác suất kích hoạt, ép **3 hàng trước của địch còn đúng 1 HP**, **không thể bị kháng, sát thương cố định, tất trúng**, vô hiệu phản đòn Tư Mã Ý, không bị phản kích.

Asset Unity local khớp: `eff/WuShenFuTi` (hiệu ứng 武神附体, ~20 frame + tip.png) và `eff/wujiangjuexing` (hiệu ứng 武将觉醒 — tướng giác tỉnh, 27 frame). Xem ánh xạ ở [[technical/asset-system-mapping]].

## 7. Trình diễn khi xả 战法 (battle presentation)

Khi một 战法 kích hoạt, UI trận đấu tạo chuỗi trình diễn (đã đối chiếu asset local):

- **Banner tên chiến pháp:** `warSkillName` (atlas 145 sprite) bật lên hiển thị tên 战法.
- **Hiệu ứng nộ khí:** `warFeatAnger` (6 frame) — flourish khi thanh nộ/sĩ khí đầy.
- **Splash chân dung tướng giác tỉnh:** `tacticalGeneralPicMax` (358 chân dung) cho đòn lớn của tướng giác tỉnh.
- **Animation đòn:** `skill/att` & `skill/def` (mỗi chuỗi ~30 frame).
- **Icon buff/trạng thái:** `warBuff` (88 icon) và `warState` (3 marker bw/cw/fs) hiện trên đơn vị.

> [!question] Vị trí HUD và xác suất trigger
> Vị trí pixel thanh nộ khí, nơi banner bật, cách icon buff xếp chồng — chưa có tài liệu, cần screenshot/prefab Unity. Phần trăm xác suất "几率" của 上阵触发 cũng chưa rõ con số. Chi tiết trình diễn ở [[technical/asset-pipeline]].

## Chiến thuật (tactic-slot) — icon trên đơn vị

Trên panel "Tướng lĩnh" (bản MOBILE 攻城掠地 — xem FIX-3, [[decisions/game-version-scope]]) mỗi đơn vị có một hàng **icon chiến thuật** nhỏ, TÁCH biệt với 3 **thế trận (Stance)** 突击/攻击/防守 diễn ra trong trận. Đọc-từ-ảnh 🎨:

| Đơn vị | Icon chiến thuật (🎨) |
|---|---|
| UNIT A (Công Thành Xa / 攻城车) | **[▲ xanh] [❌ đỏ]** |
| UNIT B (Nhục Bác Tứ Sĩ / 肉搏死士) | **[▲ ×2] [tím ×2] [❌ ×2]** |
| UNIT C (H.kim chiến kỳ / 黄金战骑) | **[▲ ×1]** |

> [!question] Ý nghĩa từng icon chiến thuật + giả thuyết "×N = số charge"
> ❓ Chưa rõ nghĩa từng icon (▲ xanh / ❌ đỏ / dấu tím) và vì sao lặp lại **×N** lần. **Giả thuyết:** "×N có thể = số **charge** của chiến pháp" — nối với **castMode = N-lần** ở §2 (một đơn vị được xả 战法 tối đa N lần/lượt ra trận). Cần lưu ý phân biệt: đây KHÔNG phải 3 thế trận (Stance) tam-giác trong trận. Ghi câu hỏi mở tại [[open-questions]] (q-20260724-01). Nguồn ảnh: [[sources/ingame-general-panel-2026-07-24]].

## Nguồn
- https://baike.baidu.com/item/%E6%94%BB%E5%9F%8E%E6%8E%A0%E5%9C%B0/8917010 (攻城掠地 - Baidu Baike)
- https://baike.baidu.com/item/%E6%94%BB%E5%9F%8E%E6%8E%A0%E5%9C%B0%E8%A7%89%E9%86%92%E5%85%B3%E7%BE%BD/19271941 (Giác tỉnh Quan Vũ)
- https://www.gameres.com/249586.html (各核心系统 - GameRes)
- https://gc.aoshitang.com/news/zixun/322013031413222593632.html (武将五种攻防属性 - Aoshitang chính thức)
- https://www.hly.com/zixun/z-55319.html (10 觉醒将 - Hoan Lạc Viên)
- https://stzb.163.com/m/strategy/gcld/2018/04/19/21008_679971.html (怒焰 / hồi nộ khí)
- https://thanhnien.vn/cong-thanh-chien-he-lo-quotsieu-doi-hinhquot-giai-doan-dau-game-1851124087.htm (nhịp xả chiến pháp VN)
- https://gc.aoshitang.com/news/gonglue/772013041123252111032.html (武将大全 — số hàng 排 per-战法; official) [V3]
- https://www.shiyouhome.com/gcld/wjfx/1995.html (太史慈 4排+2 lần; 赵云 5&2排 — nguồn thứ cấp, medium) [V3/V4]
- https://www.9game.cn/news/9767095.html (赵云 số hàng — nguồn thứ cấp) [V3]
- https://gc.aoshitang.com/news/ziliao/152012121118262077467.html (bấm hình tướng xả 战法; official không đặt tên tài nguyên) [V5]
- http://www.07073.com/gcld/gonglue/1145296.html (战力 = chỉ số tổng hợp ≠ sát thương) [V6]

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]] và [[sources/ctxd-web-verify-2026-07-24]]

## Backlinks
- [[overview]]
- [[systems/battle-system]]
- [[systems/general-system]]
- [[entities/generals]]
- [[systems/formation-system]]
- [[systems/unit-entity-model]]
- [[sources/ingame-general-panel-2026-07-24]]
- [[sources/ctxd-web-verify-2026-07-24]]
- [[sources/apk-reverse-engineering-2026-07-24]] — xác thực từ dịch ngược client (2026-07-24)
