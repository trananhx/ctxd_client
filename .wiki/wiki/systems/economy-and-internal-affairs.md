---
title: Tài nguyên & Nội chính (内政)
category: systems
tags: [resources, internal-affairs, tech-tree, city-building, economy]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Tài nguyên & Nội chính (内政)

Toàn bộ nền kinh tế của **攻城掠地 / Công Thành Xưng Đế** (bản webgame 傲世堂 2013 — bản khớp với asset dự án) chạy trên bốn loại tài nguyên cốt lõi, mỗi loại do MỘT công trình chuyên dụng trong khu tài nguyên (资源区) sản xuất và có một điểm tiêu hao (sink) riêng biệt. Nội chính (内政) là vòng lặp nâng cấp công trình, bổ nhiệm Thái thú (太守) và nghiên cứu Khoa học kỹ thuật (科技) để gia tăng sản lượng và mở khóa các buff vĩnh viễn. Kinh tế chính là cái van điều tiết tốc độ phát triển: cấp độ và việc hạ NPC mở khóa công trình/công nghệ, còn trần sản lượng tài nguyên giới hạn tốc độ ra quân, nâng binh khí và lên tech.

## Bốn tài nguyên cốt lõi

Bản đồ tài nguyên → công trình sản xuất → điểm tiêu hao (đều **confirmed** từ nhiều nguồn độc lập):

| Tài nguyên | Hán/Việt | Công trình sản xuất | Điểm tiêu hao chính |
|---|---|---|---|
| **Bạc** | 银币 (Bạc) | 民居 (Dân Cư / nhà ở) | Mua đồ, chiêu mộ tướng, nâng cấp công trình, nạp nghiên cứu tech, đổi ở Hắc Thị (黑市) |
| **Gỗ** | 木材 (Gỗ) | 木场 (Mộc Trường / xưởng gỗ) | Nâng cấp công trình, luyện tướng (强化训练 / 地狱训练) |
| **Lương thực** | 粮食 (Lương thực) | 农田 (Nông Điền / ruộng) | Mộ binh (募兵), đẩy phó bản, di chuyển trên bản đồ thế giới, duy trì chiến đấu |
| **Sắt** | 镔铁 (Sắt — tân thiết) | 矿场 (Khoáng Trường / mỏ) | Hầu như chỉ dùng nâng cấp binh khí (兵器升级) |

> [!info] Bản Việt hóa (download.com.vn) độc lập xác nhận đúng bốn tài nguyên với tên Bạc / Gỗ / Lương thực / Sắt — cơ chế lõi giữ nguyên so với bản Trung.

Ngoài sản xuất thụ động từ công trình, tài nguyên còn rơi ra từ: sự kiện chính vụ (政务事件), tế tự (祭祀), chợ/Hắc Thị, phó bản và nhiệm vụ quốc gia. Riêng Sắt còn lấy từ tế tự và từ việc chiếm thành **Tương Dương (襄阳)** — xem [[systems/city-conquest]].

> [!warning] **Trần kho (storage cap).** Khi thanh tài nguyên đầy (báo "đỏ"), sản lượng KHÔNG còn tích lũy nữa, kể cả khi mọi công trình đã max ("资源红了是不会再涨的了…也是白搭"). Cần tiêu thường xuyên để tránh phí sản lượng. Số liệu trần kho cụ thể từng cấp — chưa có nguồn.

## Công trình nội chính

Bộ công trình lõi (đều **confirmed**):

- **民居 (Dân Cư)** — sản Bạc; **木场 (Mộc Trường)** — sản Gỗ; **农田 (Nông Điền)** — sản Lương thực; **矿场 (Khoáng Trường)** — sản Sắt.
- **兵营 (Doanh Trại / barracks)** — đào tạo lính. Điểm mấu chốt thiết kế: **lính chính là "máu" (HP pool) của tướng** trong chiến đấu — lính là "武将战斗的基础". Lính chết sẽ chuyển thành EXP cho tướng. Nâng cấp Doanh Trại làm tăng tốc độ mộ binh (nhiều lính/phút hơn). Liên hệ trực tiếp với [[systems/battle-system]] và [[entities/generals]].
- **皇城 (Hoàng Thành / Imperial Palace)** — mở khóa **quanh cấp 26**, cho tranh quan tước (官职), nhận bổng lộc (俸禄) Bạc hàng ngày và buff sản lượng tài nguyên. Gắn với hệ thống thăng tiến — xem [[systems/progression-and-vip]].

> [!tip] **Thứ tự nâng cấp khuyến nghị** (confirmed từ nguồn chính thức 傲世堂 + 936u): ưu tiên **兵营 (Doanh Trại) và 农田 (Nông Điền) trước** để giữ dòng lính và lương dồi dào; người chơi mạnh nên mở **sản lượng gấp 3 (3倍产量)** cho hai công trình này. Sau **cấp 50** chuyển sang ưu tiên **矿场 (Khoáng Trường)** để có Sắt nâng binh khí.

> [!tip] Nâng cấp công trình có thể hoàn thành tức thì bằng vật phẩm **búa (小锤子 / 小金锤)**. Đây là điểm cần mô phỏng trong hệ thống hàng đợi xây dựng khi dựng lại.

## Mộ binh (募兵) & các van điều tiết

- Mộ binh tiêu **Lương thực**, chi phí tỉ lệ theo cấp binh chủng — xem [[systems/troop-types]].
- Bị giới hạn nhịp bởi **lệnh mộ binh (募兵令)**: có hạn ngạch phát hàng ngày; có thể mua thêm hoặc nhặt từ rương chiến lợi phẩm của địch.
- Có thể tăng tốc mộ binh bằng lệnh mộ binh, vàng, hoặc tiệc tùng (宴会); tốc độ mộ binh còn được nâng nhờ nghiên cứu tech.

> [!warning] Chi phí Lương thực cụ thể cho từng cấp binh chủng và hạn ngạch 募兵令 phát mỗi ngày — **chưa xác nhận** được con số chính xác.

## Nâng cấp binh khí (兵器升级)

Tiêu **Sắt (镔铁)**; theo GameRes có khoảng **~20 giai đoạn (stage) mỗi cấp binh khí** với chi phí tài nguyên tăng theo cấp số nhân, kèm cơ chế **bạo kích (暴击 / crit)** có thể đẩy nhanh một lần nâng cấp. Nâng binh khí làm tăng **công, thủ và quân số (số lính)** cho TẤT CẢ các tướng. Chi tiết trang bị — xem [[systems/equipment-and-gear]].

> [!warning] Mức tăng chỉ số cụ thể mỗi giai đoạn nâng binh khí và số giai đoạn chính xác — **chưa kiểm chứng** (trang chi tiết 07073 trả về mã hóa lỗi). Độ tin: partially-confirmed.

## Khoa học kỹ thuật (科技)

Hệ thống nghiên cứu công nghệ là cột sống nội chính, gắn chặt với tiến độ PvE:

- **Điều kiện mở khóa (confirmed):** đạt **cấp 20 VÀ đánh bại NPC 宋宪 (Tống Hiến)** ("等级达到20级并击败NPC宋宪开启科技系统"). Các nhánh tech mới sau đó mở khóa bằng cách hạ những NPC cụ thể trong phó bản — xem [[world/world-map-and-campaign]].
- **Cơ chế "thắp sao" (confirmed):** mỗi công nghệ có số "sao (星星)" khác nhau; mỗi lần nạp tài nguyên (注资) thành công thắp một sao; **chỉ khi đủ sao mới chạy được nghiên cứu** ("只有星星都亮了才能进行研究"). Nghiên cứu sau đó cần **chờ một khoảng thời gian** rồi buff thụ động mới có hiệu lực.
- **Phân nhánh:** tech chia thành các nhánh tài nguyên / tướng / chiến đấu / trang bị / chức năng.

Ví dụ công nghệ cụ thể (confirmed):

| Tech | Hiệu quả |
|---|---|
| **点兵 (Điểm Binh)** | +1 cột quân (带兵列数) cho mọi tướng |
| **历练 (Lịch Luyện)** | +10% EXP chiến đấu cho tướng |
| **香烛祭祀 (Hương Chúc Tế Tự)** | +100% hiệu quả của tế tự bằng vàng |
| **谏言 (Gián Ngôn)** | Xác suất kích hoạt sự kiện chính vụ khi nâng cấp công trình tài nguyên |

> [!warning] Toàn bộ cây tech (mọi nhánh, mọi tên công nghệ, chi phí sao/tài nguyên và thời gian nghiên cứu) **chưa được liệt kê đầy đủ** — chỉ có vài tech mẫu được xác nhận.

## Thái thú (太守) & vòng lặp nội chính

Nội chính bao gồm việc **bổ nhiệm Thái thú (太守)** — các tướng có thuộc tính thiên về nội chính — vào phong địa (封地). Việc này làm tăng sản lượng và mở khóa các tech nội chính như **thuế (税收)**, **dân tâm (民心)** và tăng tốc xây dựng (build acceleration). Tướng dùng làm Thái thú — xem [[entities/generals]].

> [!warning] Mức tăng cụ thể từ thuộc tính nội chính của Thái thú lên sản lượng, và con số buff của tech thuế/民心 — **chưa xác nhận** (độ tin: partially-confirmed, nguồn fan/aggregator).

## Nguồn phụ trợ & quy đổi tài nguyên

- **黑市 (Hắc Thị / Black Market):** dùng Bạc để đổi loại tài nguyên này lấy loại khác.
- **政务事件 (Sự kiện chính vụ):** nguồn tài nguyên thứ cấp, kích hoạt khi nâng cấp công trình tài nguyên (mở quanh cấp 20).
- **祭祀 (Tế tự)** và chợ: nguồn bổ sung ngoài sản xuất thụ động.

> [!question] Cấp độ mở khóa lần đầu của từng công trình tài nguyên và 兵营/矿场 (ngoài 皇城 ~cấp 26 và 政务事件/科技 ở cấp 20) chưa được xác định rõ.

> [!question] Bản Việt hóa (Công Thành Xưng Đế) có đổi tên hay tái cân bằng công trình/tech nào so với bản Trung gốc hay không — chưa kiểm chứng được từ nguồn VN hiện có.

## Nguồn

- 《攻城掠地》四大资源获得途径和建筑升级技巧 — 936u: https://www.936u.com/app/112/2090.html
- 四大资源获得途径和建筑升级技巧 — 傲世堂 (官方): https://gc.aoshitang.com/news/gonglue/812013022216045016030.html
- 《攻城掠地》各核心系统 — GameRes 游资网: https://www.gameres.com/249586.html
- 攻城掠地 科技系统 — 逗游网: https://www.doyo.cn/article/136244
- 攻城掠地科技研究图文攻略 — 3DM 页游: https://yeyou.3dmgame.com/gl/12443.html
- 《攻城掠地》新手 FAQ — XY 助手: https://www.xyzs.com/news/19765.html
- 攻城掠地 32 条新手必备常识 — 游民星空: https://www.gamersky.com/handbook/201405/359124.shtml
- Công Thành Xưng Đế — Download.com.vn: https://download.com.vn/cong-thanh-xung-de-128816

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]]

## Backlinks

- [[overview]]
- [[systems/city-conquest]]
- [[systems/troop-types]]
- [[systems/equipment-and-gear]]
- [[systems/progression-and-vip]]
- [[systems/battle-system]]
- [[entities/generals]]
