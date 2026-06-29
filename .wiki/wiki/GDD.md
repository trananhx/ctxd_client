---
title: GDD — Công Thành Xưng Đế (bản dựng lại)
category: overview
tags: [gdd, design-document, master, cong-thanh-xung-de]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# GAME DESIGN DOCUMENT — Công Thành Xưng Đế (ctxd_client)

> **Tài liệu tổng hợp (reverse-engineered GDD).** Game gốc: **攻城掠地** (Gōngchéng lüèdì) của 傲世堂 / Shanghai Game Reign; bản Việt **Công Thành Xưng Đế**. Tài liệu này là bản dựng lại từ nghiên cứu web (VN+TQ, đã kiểm chứng chéo) + ảnh gameplay gốc (somo.vn & bản CN). Mỗi mục dẫn tới trang wiki chi tiết để tra cứu sâu.

| | |
|---|---|
| **Phiên bản tài liệu** | 0.1 (2026-06-27) |
| **Engine** | Unity 6000.5.1f1 (6.5), URP 17.5, bộ công cụ 2D |
| **Trạng thái dự án** | Thiên về asset; chưa có code gameplay |
| **Phạm vi dựng lại** | Đề xuất: **bản "somo-era"** (có mưu sĩ + chiến xa), khớp asset & ảnh — chờ chốt ([[decisions/game-version-scope]]) |

### Quy ước độ tin cậy (dùng xuyên suốt)
- ✅ **Xác nhận** — nhiều nguồn / bằng chứng ảnh gốc.
- ⚠️ **Tranh cãi / lệch phiên bản** — nguồn mâu thuẫn hoặc thuộc bản khác; xem [[contradictions]].
- ❓ **Còn mở** — chưa có số liệu/nguồn; xem [[open-questions]].
- 🎨 **Bằng chứng ảnh** — quan sát trực tiếp từ ảnh gameplay ([[sources/screenshot-somo-battle-2026-06-27]]).
- 📋 **Đặc tả khách** — yêu cầu do khách hàng cung cấp ([[sources/customer-battle-ui-spec-2026-06-27]]); ưu tiên cao khi dựng.

---

## 1. Tổng quan & Tầm nhìn

### 1.1 Định danh
`ctxd_client` dựng lại **攻城掠地 / Công Thành Xưng Đế** — webgame **chiến thuật Tam Quốc theo lượt** (SLG), NSX 傲世堂, TQ công测 15/04/2013, bản VN ra mắt ~31/10/2013. ✅ Xác nhận bằng URL `xungde.somo.vn` trong ảnh + bằng chứng asset (chân dung tướng, công/thủ, nộ khí). Chi tiết: [[overview]].

> ⚠️ **Phân biệt 3 game cùng tên**: (1) webgame 攻城掠地 — mục tiêu; (2) Công Thành Xưng Đế Mobile 2019 (VGP) — game khác; (3) 乱世曹操传 — game anh em. Nhiều "số liệu đẹp" trên mạng thuộc (2)/(3). Xem [[decisions/game-version-scope]].

### 1.2 Thể loại & nền tảng
- **Thể loại**: SLG Tam Quốc theo lượt — đấu tướng + công thành + quản lý/nội chính + quốc chiến tập thể.
- **Nền tảng gốc**: webgame (Flash); bản dựng lại trên Unity 2D.
- **Đối tượng**: người chơi chiến thuật, cày tập thể, F2P-thân thiện (theo review VN).

### 1.3 Trụ cột thiết kế (Design Pillars)
1. **Chiến đấu chiều sâu, ít thao tác**: đoán & chọn 1 trong 3 thế trận mỗi lượt; canh thời điểm chiến pháp/giác tỉnh.
2. **Tướng là trục tiến trình**: sưu tầm → nuôi → giác tỉnh → liên hợp.
3. **Công thành chiếm đất**: PvE chiến dịch sử thi + PvP quốc chiến trên bản đồ chung.
4. **Sandbox tập thể cuối game**: 3 nước tranh đoạt 247 thành theo nhịp ngày/mùa.
5. **F2P-thân thiện**: tiến trình chủ yếu qua cày + tham gia tập thể; nạp để rút ngắn.

### 1.4 Phạm vi phiên bản (QUYẾT ĐỊNH CẦN CHỐT)
Asset dự án + ảnh somo.vn (2016) cho thấy game thật có **≥5 binh chủng** (gồm 谋士 mưu sĩ + 战车 chiến xa) — tức **bản về sau**, không phải bản trần 2013 (4 binh chủng). **Đề xuất: dựng theo bản somo-era.** Cần chủ dự án xác nhận. [[decisions/game-version-scope]].

---

## 2. Vòng lặp cốt lõi (Core Loop)

```
Đánh phó bản / Quốc chiến  →  EXP + Lương + Mảnh tướng + Tướng + Trang bị
        ↑                                         ↓
Mở khóa tech/công trình/tướng  ←  Nuôi quân + tướng mạnh hơn  →  Mục tiêu khó hơn
   (theo cấp & NPC)                                              (thành/giải/BOSS)
```

- **Nhịp ngắn**: vào trận → chọn thế trận từng lượt → tung chiến pháp/giác tỉnh → thắng → thưởng.
- **Nhịp ngày**: 3 khung Quốc chiến, 3 phó bản thế giới, nhiệm vụ quốc gia, thế giới BOSS.
- **Nhịp dài**: nâng cấp tướng/trang bị/nội chính, giác tỉnh, leo cấp Chủ Công, sự kiện liên server.
- **Điều tiết**: KHÔNG có thanh thể lực — giới hạn bằng **Lương thực** + **trần lượt/ngày** + **hồi chiêu** + ngân sách **quân ảo 幻影**. ✅

---

## 3. HỆ CHIẾN ĐẤU (lõi của game) — [[systems/battle-system]]

### 3.1 Cấu trúc trận đánh (hình học ĐÃ CHỐT theo đặc tả khách 📋)
- **Theo lượt (回合)**, **isometric chéo**: phe **Công** dưới-trái, phe **Thủ** trên-phải.
- **Hàng đợi tối đa 5 tướng/phe (一–五)**, đánh **LẦN LƯỢT**; một vị trí có thể là **cặp ghép** (vd 周瑜●诸葛亮). Tại 1 thời điểm có **1 tướng/phe** đang giao tranh (HP/sĩ khí/avatar ghim 2 góc trên).
- **Mỗi tướng = ≥4 hàng quân** (sàn 4; 5排兵/6 hàng Đào Viên là mở rộng), các hàng **vào trận tuần tự**.
- **Mỗi hàng = 3 nhóm**; **mỗi nhóm = N lính** (mặc định **6** → 18/hàng), **N là biến số** theo nâng cấp.
- **Cây render**: `Phe → 5 Tướng(hàng đợi) → ≥4 Hàng(tuần tự) → 3 Nhóm → N lính(default 6)`. **Tiếp viện (借兵) → nối cuối hàng đợi.** Chi tiết: [[systems/battle-system]] · [[sources/customer-battle-ui-spec-2026-06-27]].

### 3.2 Ba thế trận + nút Giác (bánh xe) 🎨
Mỗi lượt hiện **bánh xe** + đồng hồ **~3–4 giây**:
- **Đột Kích (突击)** — trên ▲
- **Phòng Thủ (防守)** — trái-dưới 🛡
- **Tấn Công (攻击)** — phải-dưới ⚔
- **Trung tâm: GIÁC (觉醒)** — phát động **giác tỉnh/đại chiêu ngay trong trận** (武神附体).
- Hết giờ → **Auto** quyết định (có nút Hủy Auto).

**Vòng khắc chế thế trận** (kéo-búa-bao) ✅:
> **Đột Kích › Tấn Công › Phòng Thủ › Đột Kích**
Chọn đúng thế khắc thế đối thủ = **lợi thế lớn** → trận đánh là trò **đoán ý**.
- ❓ Hệ số % khi thắng thế chưa có nguồn.
- ❓ Luật thứ tự ra đòn (bên thắng thế đánh trước? hay theo tốc độ?) chưa rõ.

### 3.3 Phân lớp khắc chế (thứ tự áp dụng cho resolver)
1. **Chiến pháp (战法)** — ĐỨNG TRÊN tất cả ("克制一切战术"), bỏ qua vòng thế trận khi kích hoạt. ⚠️ mức tin medium.
2. **Ba thế trận (突击/攻击/防御)** — lớp người chơi điều khiển từng lượt. ✅
3. **Binh chủng + Trận pháp + Địa hình** — lớp phụ trợ, cộng/trừ sát thương.

### 3.4 Chiến pháp & Nộ khí/Sĩ khí — [[systems/tactics-and-rage]]
- Mỗi tướng có **chiến pháp (战法)** riêng, đánh theo **số hàng** (2–5 hàng tùy tướng).
- **Mô hình sĩ khí (士气)** ✅: vào trận **50 sĩ khí**, tăng khi đánh/bị đánh/giết lính; đầy **100 → xả KỸ NĂNG 2 (战法)**. Lính **5★ vào trận sẵn 100** → tung kỹ năng 2 ngay lượt đầu. ⇒ tướng có **kỹ năng 1 (sĩ khí thấp)** và **kỹ năng 2 (đầy)**.
- Kích hoạt 战法: lên trận có xác suất (上阵), khi giết một hàng/tướng, mốc HP (Triệu Vân 80/50/20%). ✅
- Loại hiệu ứng: sát thương đơn/đa hàng, AoE, **Hỗn Loạn (混乱 — cấm địch xả 战法)**, tức sát (về 1 HP), đẩy lùi, buff. **Kháng (抵挡)**: chiến pháp **giác tỉnh không thể bị kháng**. ✅

### 3.5 Thuộc tính giải đòn ✅
Tướng có **5 thuộc tính**: 普通攻击 / 普通防御 / 战法攻击 / 战法防御 / 计策.
- **统 (Thống)** → công/thủ thường; **勇 (Dũng)** → công/thủ chiến pháp; quy đổi ~**1 điểm = 10**.
- Hệ số: **Bạo kích 200%**, **Loạn vũ 150%** (xác suất bạo kích chiến pháp), **Độ bền (韧性) giảm ½** sát thương chiến pháp nhận. ✅
- ❓ **Công thức sát thương end-to-end** nằm trong forum 傲世堂 (cần đăng nhập) — chưa lấy được. Đây là lỗ hổng lớn nhất để cân bằng. [[open-questions#q-20260627-04]]

### 3.6 Khác
- **Thắng/thua**: diệt sạch quân/tướng phe địch (PvE: diệt thành/đơn vị phòng thủ). ✅
- **Banner sự kiện** 🎨: thông điệp diễn biến hiện giữa màn (vd "đội quân bỏ chạy khỏi thành").
- **Tự động chiến thuật (自动战术)**: mở ~lv59; bản gốc đề cao điều khiển thủ công.
- **Menu lệnh quốc chiến** 🎨: Soái Kỳ (帅旗), Mượn Binh (借兵), Lừa Địch (诱敌), Đột Tiến (突进), Rút Lui, Chiêu Lệnh (诏令).

---

## 4. HỆ TƯỚNG (武将) — [[systems/general-system]] · [[entities/generals]]

### 4.1 Đội hình & chiêu mộ
- **200+ tướng**, mỗi tướng gắn 1 binh chủng.
- **Phẩm chất** ⚠️: bản TQ **紫(tím) > 红(đỏ) > 黄(vàng)**; bản VN có nguồn ghi thứ tự ngược + thêm Cam/Unique/Thiên Mệnh.
- **Chiêu mộ Hồng tướng (红将)** tại **Tửu Quán (酒馆)** theo mốc cấp + sau khi thắng NPC cùng tên. Khóa (锁) để không bị refresh. ✅
- **Sức chứa quân (带兵量)** tăng theo trang bị + **binh khí (兵器)** (mở lv50/80).
- **Lên cấp**: EXP tự động; **Quốc chiến (国战) +50% XP** là nguồn chính sau lv40. ✅

### 4.2 Giác tỉnh (觉醒) & Liên hợp
- **Giác tỉnh**: tech mở khi **Chủ tướng lv121 + thắng 张颌 ở 五丈原**; tướng cần **lv120**. Nguyên liệu **觉醒丹 (~10% từ 觉醒试炼)** + **武魂 (~5% từ 国战/世界BOSS)**; xác suất/lần **~0.2%** (1 nguồn). ✅/❓
- Chiến pháp giác tỉnh mạnh hơn hẳn + thường +25% địa hình.
- **Liên hợp giác tỉnh — Đào Viên Chi Thệ (桃园之誓)**: gộp **Lưu Bị + Quan Vũ + Trương Phi**, **mở rộng đội hình lên 6 hàng**; yêu cầu Chu Du & Gia Cát đã giác tỉnh trước.
- **Tướng ghép đôi** 🎨: vd **周瑜●诸葛亮** chiếm chung 1 slot (cơ chế liên hợp khác Đào Viên — cần xác nhận luật).

### 4.3 Tướng tiêu biểu (trích)
| Tướng | Binh chủng | Chiến pháp gốc → giác tỉnh | Ghi chú |
|---|---|---|---|
| Quan Vũ 关羽 | — | 武神附体 → **武神降临** (3 hàng đầu về 1 HP) | Ưu tiên giác tỉnh #1; +25% đồng bằng |
| Lữ Bố 吕布 | (kỵ?) | → **战神无双** (4 hàng, truy kích) | **+35% đồng bằng**; giác tỉnh sau Gia Cát |
| Triệu Vân 赵云 | — | → 龙枪傲世 / 七进七出 | +25% mọi địa hình |
| Trương Phi 张飞 | — | → 灭世咆哮 (3 hàng, đẩy lùi) | +25% núi; Đào Viên |
| Gia Cát Lượng 诸葛亮 | **谋士** 🎨 | → 逢凶化吉 (né/bói) | Mở khóa giác tỉnh Lữ Bố |
| Chu Du 周瑜 | **谋士** 🎨 | → 赤焰迷阵 (4 hàng + hỗn loạn) | +25% núi |
| Mã Siêu 马超 | **骑兵** 🎨 | 铁骑无敌 (⚠️ chưa kiểm chứng) | "Tử tướng đầu" lv77 |
| Hoàng Trung 黄忠 | **弓兵** 🎨 | — | — |
| Chu Thái 周泰 | **枪兵** 🎨 | (không có 战法) | Không bị bao vây |
| Hoàng Nguyệt Anh 黄月英 | **战车** 🎨 | — | Liên quan 破甲战车/云垂阵 |
| Cam Ninh 甘宁 | — | 固守 → 绞龙巨浪 (5 hàng) | lv66; +25% nước |

(Binh khí, mốc hồng tướng, asset chân dung… xem [[entities/generals]].)

---

## 5. BINH CHỦNG (兵种) — [[systems/troop-types]]

> ⚠️ **Điểm gây nhầm nhất.** Bản launch 2013 (Baidu): **4 binh chủng** 骑兵/枪兵/弓兵/攻城, "兵种互不相克" (binh chủng KHÔNG tự khắc chế). Nhưng **ảnh game thật cho thấy ≥5 loại** 🎨 gồm **谋士 (mưu sĩ)** + **战车 (chiến xa)** → bản về sau đã thêm binh chủng. **Dựng theo bản somo-era ⇒ dùng ≥5 binh chủng.**

| Binh chủng | Vai trò | Tướng ví dụ (🎨) |
|---|---|---|
| Kỵ binh 骑兵 | Cơ động, đột kích | Mã Siêu |
| Thương binh 枪兵 | Tuyến đầu, chống đỡ | Chu Thái |
| Cung binh 弓兵 | Tầm xa | Hoàng Trung |
| Chiến xa 战车 / Công thành 攻城 | Phá tường/thành, AoE | Hoàng Nguyệt Anh |
| Mưu sĩ 谋士 | Khống chế/pháp thuật tuyến sau | Chu Du, Gia Cát Lượng |

- **Khắc chế nằm ở THẾ TRẬN** (突/攻/防), KHÔNG ở binh chủng (bản 2013). ⚠️ Bản về sau có thể bổ sung khắc chế binh chủng — cần xác nhận.
- **Địa hình** ưu tiên binh chủng: đồng bằng↔kỵ, núi rừng↔bộ/thương, sông nước↔tầm xa. ❓ hệ số % chưa rõ.
- **Tướng gắn cứng 1 binh chủng** (icon hiển thị ngay trong màn đấu 🎨).
- ⚠️ Hệ **nâng sao + 战录 + 兵种天赋 +25%** thuộc **乱世曹操传**, KHÔNG mặc định cho bản này.

---

## 6. TRẬN PHÁP & ĐỘI HÌNH (阵法) — [[systems/formation-system]]
> 📋 **Hệ đội hình thực tế PHONG PHÚ & data-driven** (chủ dự án): không chỉ 3–4 trận cố định mà **nhiều kiểu đội hình**, mỗi kiểu **đặc điểm gameplay khác nhau**; **gắn theo tướng** (vd xếp dọc 2 bên đường); **hình dạng hàng đổi theo tình huống** (hàng đầu giáp địch → cánh cung). Mô hình `FormationLayout` (ScriptableObject) + `Row.shape`. Danh mục đầy đủ cần liệt kê dần ([[open-questions#q-20260627-13]]). Phần dưới là tầng "trận pháp tech/buff" từ nguồn web (có thể là một lát của hệ này):
- ❓ Mở ở **lv210** (sau phó bản Hạ Hầu Đôn) — mâu thuẫn với dữ kiện "kích hoạt ở cấp 20"; cần kiểm.
- **3 trận cơ bản** gắn binh chủng: 锋矢阵 (Phong Thỉ, kỵ), 雁形阵 (Nhạn Hành, cung), 方圆阵 (Phương Viên, bộ); **trận cao cấp 云垂阵 (Vân Thùy)** yêu cầu giác tỉnh 黄月英+魏延 + 破甲战车 + 8888 vàng, có 变阵 ngẫu nhiên.
- Nâng trận bằng **Binh thư (兵书)** 3 màu: đỏ=công, lam=chiến pháp, lục=thủ; **cấp trận = tổng cấp binh thư**. Mở vị trí 150 vàng/trận (450 cho 3). ✅

---

## 7. PvE: CÔNG THÀNH CHIẾM ĐẤT (打天下) — [[systems/city-conquest]]
- Chiến dịch kịch bản đơn (剧本/副本) tái hiện sử Tam Quốc; **5 độ khó**: 简单/普通/困难/地狱/战神 (Dễ→Chiến Thần=5 sao). ✅
- Dễ/Thường → **lương thực**; Khó+ → **EXP lớn**. Giới hạn **~3 lượt/ngày** (thành mất/thua → refresh không tính lượt). ✅
- **Quân ảo 幻影 (phantom)**: tích từ Binh Khí Tác Phường (兵器作坊) — lv3 trần 60, lv5 ~120/ngày; phó bản khó tốn ~8–35. ✅
- Thắng NPC phó bản → **mở khóa tướng** (chiêu ở Tửu Quán) + **mảnh tướng (武将碎片)** + **đồ bộ** (朱雀/玄武/青龙). ✅

---

## 8. THẾ GIỚI & CHIẾN DỊCH — [[world/world-map-and-campaign]]
- **Bản đồ quốc chiến**: **247 thành + 3 thành Man**, chia **Ngụy/Thục/Ngô (魏蜀吴)** (marketing "300+"). ✅ (Bằng chứng địa điểm "Bạch Đế Bắc" 🎨.)
- **Thành đặc biệt**: 庐江 (giảm CD shop + x2 EXP luyện), 陈留 (黑市), 白帝 (x2 giao dịch), 襄阳 (thưởng có sắt). Sương mù (迷雾).
- **Dòng thời gian**: Khởi nghĩa Khăn Vàng (黄巾, 184) → Quan Độ (官渡) → Xích Bích → … (vd 跃马檀溪 4 thành, 白衣渡江 5 thành).

---

## 9. NỘI CHÍNH & KINH TẾ (内政) — [[systems/economy-and-internal-affairs]]
- **4 tài nguyên**: 银 **Bạc** (民居), 木 **Gỗ** (木场), 粮 **Lương** (农田), 镔铁 **Sắt** (矿场). ✅
  - Bạc: đồ/chiêu tướng/nâng cấp/黑市 · Gỗ: xây/luyện tướng · Lương: mộ binh/đẩy phó bản/di chuyển · Sắt: nâng binh khí.
- **Công trình**: 兵营 (Doanh trại — lính = "máu" tướng), 皇城 (Hoàng Thành ~lv26: quan tước/bổng lộc).
- **Khoa học kỹ thuật (科技)**: mở **lv20 sau khi thắng 宋宪**; nạp tài nguyên "thắp sao" → chờ nghiên cứu. Ví dụ: 点兵 (+1 cột quân), 历练 (+10% EXP), 香烛祭祀 (+100%). ✅
- ❓ Số liệu sản lượng/chi phí/thời gian từng cấp công trình **chưa có**.

---

## 10. TRANG BỊ & TRANG SỨC — [[systems/equipment-and-gear]]
- **Trang bị 6 ô** (vũ khí/giáp/binh phù/ngựa/áo choàng/cờ), **6 phẩm chất** 白蓝绿黄红紫, mở sau khi thắng 郭汜; từ vàng có **kỹ năng (技能 Lv1-5)**. ✅
- **Cường hóa/Tinh luyện** (trần Lv20) + Tẩy luyện; bậc đá kỹ năng: thường Lv5 → tiến giai Lv40 → thần thạch Lv60.
- **8 bộ thần thú** (青龙/白虎/朱雀/玄武/烛龙/驱虎/鲮鲤/霸下) → bộ "chân" ghép đôi ở lv110; đỉnh **极套装**.
- **Bảo vật (宝物)** 1/tướng (统+勇); lò **炼宝炉** lv170. **Thần binh (神兵)**: tech 天铸神兵 lv130 → ghép 七杀剑/贪狼甲/破军印, cường bằng 百炼钢.
- **Chiến mã (坐骑)**: phẩm lam→vàng, tối đa 4 ô, **thuộc tính chia sẻ cho mọi tướng ra trận**; triệu hồi bằng 铃铛 (10=đỏ, 50=vàng).

---

## 11. NHIỀU NGƯỜI & CUỐI GAME — [[systems/multiplayer-and-endgame]]
- **Quốc chiến (国战)**: mở **lv30 + 1 vũ khí lục**; nhiệm vụ quốc gia **3 lần/ngày** (10–11:30, 15–16:30, 20–21:30), 6 loại. Luật: **bị vây không xả được 战法**; **Đột Tiến (突进)** khi đông >3x. ✅
- **Tổ chức**: Quân đoàn (军团) → Liên minh (联盟); Quốc gia thí luyện (国家试炼).
- **Bảng công thành ngày (每日攻城榜)** (lv75): 攻城+5/助攻+2/助阵+1 → mốc 30/60/100/150/200 = 6/8/10/14/18 rương.
- **Giải đấu tướng Võ Đấu Hội (武斗会 8进4 / 武将对决)** 🎨: PvP loại trực tiếp, đấu theo địa hình (平原战), **đánh trống cổ vũ (击鼓支持)** + số người ủng hộ.
- **Thế giới BOSS — Thảo phạt Đổng Trác (讨伐董卓)**: roi (鞭子 ≤20/ngày), tích 狂怒值 → thưởng đôi + 国宝.
- **Liên server**: 跨服争霸赛 (16→4), 跨服城战 (6 ngày, 10đ/đội NPC, 20đ/đội người chơi).

---

## 12. TIẾN TRÌNH, VIP & THƯƠNG MẠI HÓA — [[systems/progression-and-vip]]
- **Một cấp Chủ Công (主公)** liên tục; cổng cấp: bản đồ ~lv28, ngọc lv90, Viễn Chinh (远征) lv170.
- **Không thanh thể lực** — điều tiết bằng Lương + trần ngày + hồi chiêu. ✅
- **Tiền nạp**: 元宝 (VN: **KNB/Vàng**), tỉ lệ 1 RMB = 10 元宝.
- **VIP 累计充值** (bản về sau VIP1-14), mỗi bậc đặc quyền cụ thể (VIP1 tự nâng công trình sau lv30; VIP3 mượn binh; VIP4 giảm nửa CD; VIP5 phó bản EXP khủng; VIP6 3 đồ tím 3 sao; VIP7 集团军). ⚠️ bảng ngưỡng nạp mâu thuẫn → chọn 1 bản chuẩn.
- F2P-thân thiện (review VN); phản biện TQ: cấp rất cao cần nạp.

---

## 13. UI/UX & TRÌNH BÀY — [[technical/asset-system-mapping]]
- **Màn chờ (📋 trước trận)**: 2 phe Công(trái)/Thủ(phải), bảng "Võ Tướng Đối Đấu", **đổi thứ tự tướng 一–五**, mỗi ô = avatar+Lv+tên+lực chiến/binh lực, đồng hồ đếm ngược.
- **Màn chiến đấu** (🎨📋): 2 chân dung tướng đang đánh ghim **2 góc trên** (HP+sĩ khí); vùng isometric; **bánh xe 3 thế trận + Giác** + đồng hồ trên đầu đạo quân; menu lệnh phải; **cutscene kỹ năng** (chân dung+tên chiêu+cháy nổ); **vòng tròn dưới chân** (phe/buff/đang-chọn); banner sự kiện; số thưởng/sát thương nổi.
- **Màn đội hình/đấu tướng** (🎨): 5 vị trí 一-五, icon binh chủng + chiến lực + cấp.
- **Màn khác**: nội chính/chủ thành (công trình), tướng/trang bị (6 ô + 1 bảo vật), bản đồ thế giới.

---

## 14. KỸ THUẬT & ASSET — [[technical/asset-pipeline]] · [[technical/asset-system-mapping]]
- **Kiến trúc client**: ScriptableObject Architecture + nhiều design pattern, dựng trên framework **Luzart** (`Assets/Luzart`). Catalog: [[technical/luzart-framework]]; blueprint + ánh xạ pattern + battle slice: [[technical/client-architecture-patterns]]. Client/Server (server-authoritative): [[technical/client-server-architecture]].
- Unity 6.5 + URP 2D; art nạp từ `Assets/Resources/`.
- **Quy ước asset (🎨 xác nhận)**: `att`=Công(attacker) / `def`=Thủ(defender); `top/down`=phe trên/dưới trục chéo isometric.
- Thư mục chính: `army/att|def/<id>` (5 action/đơn vị), `skill/att|def` (animation 战法), `eff/Arrow` (đạn), `warSkillName` (banner tên chiêu), `warFeatAnger` (nộ khí), `warBuff/warState` (trạng thái), `tacticalGeneralPicMax` (358 chân dung), `eff/WuShenFuTi` + `eff/wujiangjuexing` (giác tỉnh), `eff/formation` (trận pháp).
- ❓ Cần mở **prefab/scene** để chốt: layout HUD, map ID quân→binh chủng, ý nghĩa `warState bw/cw/fs`, frame-rate animation.

---

## 15. QUYẾT ĐỊNH MỞ & CÂU HỎI CẦN CHỐT
Xem đầy đủ: [[decisions/game-version-scope]], [[contradictions]], [[open-questions]].

| # | Vấn đề | Hiện trạng | Cần |
|---|---|---|---|
| D1 | **Phiên bản dựng lại** | Đề xuất somo-era (5-6 binh chủng) | Chủ dự án chốt |
| O1 | **Công thức sát thương** | Có hệ số crit/loạn vũ/độ bền; thiếu equation | Forum 傲世堂 / footage |
| O2 | **Hàng/cột lính trong 1 tốp** | Isometric + 5 tướng/phe đã rõ; nội bộ tốp chưa | Ảnh cận / prefab |
| O3 | **Số binh chủng & luật khắc chế bản somo** | ≥5 (có 谋士/战车) | Ảnh màn chọn binh / footage |
| O4 | **Bảng VIP & tỉ giá KNB VN** | Mâu thuẫn nguồn | Client/nguồn chuẩn |
| O5 | **Số liệu nội chính** (sản lượng/chi phí/timer) | Trống | Nguồn thời kỳ |
| O6 | **Tên Việt hóa in-client** | Suy luận Hán-Việt | Ảnh client VN |

---

## 16. ĐỀ XUẤT LỘ TRÌNH DỰNG LẠI (gợi ý)
1. **Vertical slice — 1 trận đánh**: dữ liệu Tướng/Binh chủng (ScriptableObject) → **battle resolver** (5 vị trí, 3 thế trận + Giác, sĩ khí/skill-1/skill-2) → render isometric + animation từ asset.
2. **Hệ tướng & trang bị**: chiêu mộ, lên cấp, giác tỉnh, 6 ô trang bị.
3. **PvE chiến dịch**: phó bản + 5 độ khó + quân ảo + mở khóa tướng.
4. **Nội chính & kinh tế**: 4 tài nguyên + công trình + 科技.
5. **Bản đồ & Quốc chiến**: 247 thành + nhịp ngày.
6. **Cuối game**: giải đấu, BOSS, liên server.

> 🎯 **Khuyến nghị**: bắt đầu từ **battle resolver** vì nó là lõi + asset đã có sẵn; mọi hệ khác cắm vào sau. Cần chốt **D1 (phiên bản)** và làm rõ **O2 (hình học tốp lính)** trước khi code renderer.

---

## Phụ lục — Bản đồ wiki
- Hệ thống: [[systems/battle-system]] · [[systems/tactics-and-rage]] · [[systems/troop-types]] · [[systems/general-system]] · [[systems/formation-system]] · [[systems/city-conquest]] · [[systems/economy-and-internal-affairs]] · [[systems/equipment-and-gear]] · [[systems/multiplayer-and-endgame]] · [[systems/progression-and-vip]]
- Thực thể/Thế giới: [[entities/generals]] · [[world/world-map-and-campaign]]
- Kỹ thuật: [[technical/asset-pipeline]] · [[technical/asset-system-mapping]]
- Provenance: [[claims]] · [[contradictions]] · [[open-questions]] · [[sources/ctxd-web-research-2026-06-27]] · [[sources/screenshot-somo-battle-2026-06-27]]

---
## Backlinks
- [[index]] — mục lục
- [[overview]] — tổng quan ngắn
