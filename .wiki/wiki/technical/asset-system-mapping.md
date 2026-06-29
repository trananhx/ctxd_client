---
title: Ánh xạ Asset Unity ↔ Hệ thống game
category: technical
tags: [asset, sprite, battle-presentation, mapping, unity]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

Trang này ánh xạ từng thư mục sprite trong `Assets/Resources/sprite/` của dự án `ctxd_client` sang hệ thống gameplay tương ứng, dựa trên cấu trúc thư mục thực tế và kích thước (dimension) đọc từ file `.meta`. Mục tiêu: khi dựng lại code, biết ngay mỗi thư mục asset phục vụ màn hình/cơ chế nào, frame nào ghép thành animation gì, và chỗ nào còn phải mở prefab/scene mới chốt được layout.

> [!info] Quy ước tổng quát của bộ asset (đã xác nhận bằng ảnh gameplay)
> Ảnh trận thật ([[sources/screenshot-somo-battle-2026-06-27]]) xác nhận: chiến trường là **góc nhìn isometric chéo**, phe **Công (tấn công)** ở dưới-trái, phe **Thủ (phòng thủ)** ở trên-phải; mỗi phe là đội hình **lưới các tốp lính**.
> - Hậu tố `att` = phe **Công** (attacker), `def` = phe **Thủ** (defender) — đúng như nhãn "Công"/"Thủ" hiện trên 2 chân dung tướng trong game.
> - `top`/`down` = vị trí phe **trên/dưới** trên trục chéo.
> - Cặp `att/def` + `top/down` lặp lại nhất quán trong nhiều thư mục `eff/`. Số hàng/cột chính xác mỗi phe vẫn cần đối chiếu thêm ảnh + prefab. Xem [[systems/battle-system]] và [[technical/asset-pipeline]].

## Bảng ánh xạ tổng

| Thư mục asset | Kích thước / số lượng (đã xác minh từ .meta) | Hệ thống game | Trang liên quan |
|---|---|---|---|
| `warBG/` | nền JPG **1280x774**, `spriteMode: 2`; ~18 nền + `images/` + `silkMap` | Nền màn trận đánh | [[systems/battle-system]] |
| `warvsicon/` | PNG nhỏ (vd 22x23), **7 biến thể** (0,1,2,3,4,5,7) | Icon "VS" lúc khai chiến | [[systems/battle-system]] |
| `army/att/` & `army/def/` | **8 ID quân** mỗi bên, mỗi ID có **5 thư mục action** (1..5) | Sprite lính tấn/thủ theo ID quân | [[systems/troop-types]] |
| `skill/att/` & `skill/def/` | mỗi skill ~**32 frame** (vd `skill_01`) | Animation chiến pháp (战法) | [[systems/tactics-and-rage]] |
| `eff/Arrow/` | `attackMc1` & `attackMc2`, mỗi cái **28 frame** | Đạn/tên của quân tầm xa | [[systems/troop-types]] |
| `warFeatAnger/` | **6 frame** (featAnger1..6) | Hiệu ứng nộ khí/sĩ khí | [[systems/tactics-and-rage]] |
| `warSkillName/` | atlas, **145 file**; sub-rect 47x78 & 63x46 | Banner tên chiến pháp | [[systems/tactics-and-rage]] |
| `warBuff/` | **88 icon** | Icon buff/debuff trên đơn vị | [[systems/battle-system]] |
| `warState/` | **3 file**: `bw` / `cw` / `fs` | Trạng thái đơn vị (đoán) | [[systems/battle-system]] |
| `tacticalGeneralPicMax/` | **358 chân dung** lớn | Splash tướng + màn tướng/trang bị | [[entities/generals]] |
| `eff/formation/` | `att`/`def`/`doc`; `att`,`def` có `top`/`down`, mỗi cái **6 biến thể** | Hiệu ứng trận pháp (阵法) | [[systems/formation-system]] |
| `eff/WuShenFuTi/` | **21 file** (+ tip) | Giác tỉnh Quan Vũ (武神附体) | [[entities/generals]] |
| `eff/wujiangjuexing/` | **28 file** (+ tip) | Giác tỉnh tướng chung (武将觉醒) | [[entities/generals]] |
| `windowBG/` | 1 file khung cửa sổ | Nền chung các cửa sổ UI | [[technical/asset-pipeline]] |

## Chi tiết từng nhóm

### Nền trận & marker khai chiến — `warBG`, `warvsicon`
`warBG/` chứa các nền toàn màn **1280x774** (xác minh: `width: 1280 / height: 774`, `spriteMode: 2`). Đây là kích thước canvas chuẩn của màn [[systems/battle-system]]; mọi sprite quân và hiệu ứng phải neo trong khung này. Thư mục con `warBG/images/` (đánh số) nhiều khả năng là các mảnh bản đồ/đất hoặc nền phụ; `silkMap_*.jpg` gợi ý nền **bản đồ lụa** của [[world/world-map-and-campaign]].

`warvsicon/` có **7 biến thể** (số 0,1,2,3,4,5,7 — thiếu 6). Đây là icon "VS" hiện lúc hai phe đối đầu.

> [!question] 7 biến thể warvsicon nghĩa là gì? Có thể ứng với loại trận (PvE công thành / PvP / boss / world-boss) hoặc với trạng thái phe/kết quả. Chưa nguồn nào xác nhận; cần xem prefab/scene để biết biến thể nào gọi ở context nào.

### Sprite quân — `army/att`, `army/def`
Mỗi bên có **8 ID quân** (vd `att_10`, `att_1001`, `att_102`, `att_2`, `att_31`, `att_33`, `att_43`, `att_67`; phía `def_` đối xứng cùng ID). Mỗi ID chứa **5 thư mục action** đánh số `1..5`. Số frame mỗi action khác nhau rõ rệt (đo trên `att_10`):

| action | số frame | suy đoán vai trò |
|---|---|---|
| `1` | 1 | tư thế đứng/idle (1 frame tĩnh) |
| `2` | 6 | chuyển động ngắn (di chuyển/chuẩn bị) |
| `3` | 12 | đòn đánh thường |
| `4` | 4 | trúng đòn/hồi |
| `5` | 14 | đòn lớn/tử trận |

`def_10` có cùng phân bố frame (1/6/12/4/14) — khẳng định `att` và `def` chỉ là hai biến thể hướng/vai của **cùng một bộ quân**, không phải hai bộ quân khác nhau. Việc map ID quân (10, 1001, 102…) sang binh chủng 步兵/骑兵/弓兵 phải đối chiếu với [[systems/troop-types]].

> [!warning] Ý nghĩa con số action (1..5) là **suy đoán** từ số frame, chưa có config/animator xác nhận. Tên state thật (idle/walk/attack/hurt/die) nằm trong code hoặc prefab, không có trong thư mục sprite.

### Animation chiến pháp — `skill/att`, `skill/def`
Mỗi chiến pháp là một chuỗi frame riêng (vd `skill/att/skill_01` = **32 frame**). Hiện có vài skill (`skill_01`, `skill_07`, `skill_50` ở phía `att`). Đây là animation phát khi tướng tung **chiến pháp (战法)** lúc nộ khí đầy — xem [[systems/tactics-and-rage]]. Phía `def` là biến thể cho đạo quân phòng thủ (top/down).

### Đạn tầm xa — `eff/Arrow`
`attackMc1` và `attackMc2`, **mỗi cái 28 frame**. Là hiệu ứng tên/đạn bay của quân tầm xa (cung 弓兵). Hai biến thể có thể là hai hướng bắn (trên→dưới và dưới→trên) hoặc hai loại đạn. Liên quan [[systems/troop-types]].

### Nộ khí & banner tên chiến pháp — `warFeatAnger`, `warSkillName`
`warFeatAnger/` có **6 frame** (`featAnger1..6`) — hiệu ứng bùng nộ khí/sĩ khí (怒气) khi thanh nộ đầy. `warSkillName/` là **atlas 145 file** banner tên chiến pháp; meta `1001` cho thấy mỗi file là atlas đóng gói nhiều sub-rect (vd `47x78` và `63x46`, `spriteMode: 1`) — tức một file gói nhiều chữ/cụm ghép thành tên. Cả hai phục vụ pha cast trong [[systems/tactics-and-rage]].

> [!info] Hệ nộ khí thực tế là **lai nộ khí + hồi chiêu** (tactic ~mỗi 3 đòn, giảm cooldown khi bị đánh), không phải "đầy thanh là tự tung". `warFeatAnger`/`warSkillName` là nghệ thuật trình diễn của pha này; bản thân asset không web-verify được nhưng khớp mô tả nguồn.

### Buff/debuff & trạng thái — `warBuff`, `warState`
`warBuff/` có **88 icon** trạng thái nổi trên đơn vị (tăng/giảm chỉ số, khống chế…). `warState/` chỉ **3 file**: `bw`, `cw`, `fs`.

> [!info] `bw` / `cw` / `fs` — nhiều khả năng là **vòng tròn sáng dưới chân** đơn vị
> Đặc tả khách ([[sources/customer-battle-ui-spec-2026-06-27]]) mô tả mỗi đạo quân có **vòng tròn sáng dưới chân (xanh/vàng)** để phân biệt **phe**, trạng thái **nhận buff (Cổ vũ)**, hoặc **đang chọn chiến thuật**. `warState` (3 file bw/cw/fs) rất có thể là 3 loại vòng tròn này. Vẫn cần mở prefab/animator để chốt ánh xạ chính xác từng tên file.

### Chân dung tướng — `tacticalGeneralPicMax`
**358 chân dung lớn**. Dùng cho: (a) splash tướng khi cast chiến pháp/giác tỉnh trong trận, và (b) màn tướng/trang bị tĩnh (tướng bên trái, thuộc tính + 6 ô trang bị + 1 bảo vật bên phải). Xem [[entities/generals]] và [[systems/equipment-and-gear]].

> [!question] Cùng một chân dung dùng cho splash in-battle hay cho màn tĩnh, hay cả hai? Khả năng cả hai nhưng điều kiện trigger chưa xác nhận — cần xem scene.

### Hiệu ứng trận pháp — `eff/formation`
Ba nhánh: `att/`, `def/` (mỗi nhánh có `top/` và `down/`, mỗi cái **6 biến thể** đánh số `1..6`) và `doc/`. Sáu biến thể khớp số trận pháp/cấp trận pháp của [[systems/formation-system]] (4 trận xác nhận: 锋矢阵 kỵ, 雁形阵 cung, 方圆阵 bộ, 云垂阵 cao cấp; có thể dôi biến thể cho cấp/hiệu ứng). `doc/` chứa các cụm tên có tiền tố `break_`, `bz_`, `tactical_` (1..6) — nhiều khả năng là **chữ/nhãn trận pháp** (vd phá trận / bố trận) ghép vào hiệu ứng.

> [!tip] Khi dựng lại: đối chiếu chỉ số `1..6` của `eff/formation` với danh sách trận trong [[systems/formation-system]] để map đúng biến thể nào ứng với trận nào trước khi nối animator.

### Giác tỉnh — `eff/WuShenFuTi`, `eff/wujiangjuexing`
`eff/WuShenFuTi/` (**21 frame** + `tip.png`) là hiệu ứng giác tỉnh **Quan Vũ — 武神附体** (giác tỉnh thành 武神降临, ép 3 hàng đầu địch còn 1 máu). `eff/wujiangjuexing/` (**28 frame** + tip) là hiệu ứng **giác tỉnh tướng chung (武将觉醒)**. Cả hai gắn với cơ chế giác tỉnh trong [[entities/generals]].

### Thư mục `eff/` phụ chưa nằm trong brief
Cấu trúc thực tế còn có: `eff/Recruit/` (chuỗi frame — đoán hiệu ứng **chiêu mộ/tuyển quân**), `eff/gjjl/` (chuỗi frame — tên viết tắt chưa rõ, có thể "công kích kết liễu/激励"), `eff/Strategy_fla/` (các `Timeline_24/26/42` — gợi ý **export từ Flash timeline**, di sản pipeline gốc).

> [!warning] `eff/Recruit`, `eff/gjjl`, `eff/Strategy_fla` **không có trong mô tả nhiệm vụ** nhưng tồn tại trong repo. Ý nghĩa là suy đoán; cần xem prefab/scene gọi chúng. `Strategy_fla` đặc biệt cho thấy nguồn gốc Flash (.fla) của bản webgame — xem [[technical/asset-pipeline]].

## Những chỗ cần prefab/scene mới chốt được
- Vị trí pixel/anchor của HUD trong trận: thanh nộ khí, chỗ đặt icon VS, chỗ chồng icon buff trên đơn vị. Không có trong sprite — cần scene/prefab.
- Map ID quân (`10`, `1001`, `102`…) → binh chủng cụ thể: cần config quân hoặc prefab.
- Ý nghĩa `warState` `bw/cw/fs` và biến thể `warvsicon` (7) → cần animator/code.
- Frame rate / timing playback của mọi animation `army`, `skill`, `eff` → nằm ở code/config, không ở thư mục sprite.

## Nguồn
- https://baike.baidu.com/item/%E6%94%BB%E5%9F%8E%E6%8E%A0%E5%9C%B0/8917010
- https://www.gameres.com/249586.html
- https://www.9game.cn/news/9965370.html
- https://jingyan.baidu.com/article/ce09321b84f6d72bff858fb1.html
- https://m.f166.com/yxzx06/181936.html

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]] và khảo sát trực tiếp `Assets/Resources/sprite/` (kích thước/đếm frame đọc từ file `.meta`).

## Backlinks
- [[overview]]
- [[technical/asset-pipeline]]
- [[systems/battle-system]]
- [[systems/tactics-and-rage]]
- [[systems/formation-system]]
- [[systems/troop-types]]
- [[entities/generals]]
