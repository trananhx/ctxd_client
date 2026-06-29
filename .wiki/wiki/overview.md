---
title: Tổng quan dự án
category: overview
tags: [unity, 2d, war-game, three-kingdoms, cong-thanh-xung-de]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# ctxd_client — Tổng quan

`ctxd_client` là dự án **Unity 6.5** nhằm **dựng lại game Công Thành Xưng Đế** — bản Việt hóa của webgame chiến thuật Tam Quốc Trung Quốc **攻城掠地** (Gōngchéng lüèdì, "công thành lược địa"). Tên dự án chính là viết tắt **C**ông **T**hành **X**ưng **Đ**ế.

- **Game gốc**: 攻城掠地 — NPH/NSX 傲世堂 (Aoshitang / Shanghai Game Reign), TQ公测 15/04/2013.
- **Bản Việt**: Công Thành Xưng Đế — ra mắt ~31/10/2013 (NPH gốc Trí Tuệ Việt / TTV); về sau xuất hiện dưới VinixCorp (somo.vn), SohaGame, và bản mobile VGP.
- **Thể loại**: SLG/chiến thuật Tam Quốc **theo lượt** — tướng (武将), binh chủng (兵种), trận pháp (阵法), chiến pháp & nộ khí (战法/怒气), công thành chiếm đất PvE (打天下), nội chính (内政), quốc chiến (国战).
- **Engine**: Unity 6000.5.1f1, URP 17.5, bộ công cụ 2D (Aseprite/PSD/SpriteShape/Tilemap), Input System mới.

> [!warning] Phân biệt 3 game cùng tên — đọc trước khi dùng dữ liệu
> Có **ba** game dễ bị nhầm: (1) **攻城掠地** webgame 2013 — *mục tiêu chính, asset dự án khớp bản này*; (2) **Công Thành Xưng Đế Mobile** (2019, VGP) — game mobile khác; (3) **乱世曹操传** — game anh em cùng NPH. Nhiều dữ kiện trên mạng thuộc bản (2)/(3). Chi tiết & đề xuất phạm vi: [[decisions/game-version-scope]].

## Tình trạng dự án
Hiện **thiên về asset**: codebase mới chỉ có script ví dụ TextMesh Pro; toàn bộ nghệ thuật trận đánh (quân/tướng/kỹ năng/hiệu ứng/UI) nằm trong `Assets/Resources/`. Luật chơi chưa được thể hiện trong code. Wiki này phục dựng luật chơi từ nghiên cứu game gốc (xem [[sources/ctxd-web-research-2026-06-27]]).

## Vòng lặp cốt lõi (game gốc)
Chinh phục phó bản/quốc chiến → EXP + lương + mảnh tướng + tướng + đồ → đội quân mạnh hơn → mở khóa tech/công trình/tướng theo cấp & NPC → chinh phục mục tiêu khó hơn.

## Các hệ thống
- [[systems/battle-system]] — Chiến đấu theo lượt, hàng đợi 5 tướng, 3 thế trận khắc chế
- [[systems/tactics-and-rage]] — Chiến pháp (战法) & sĩ khí/nộ khí (士气/怒气)
- [[systems/troop-types]] — Binh chủng (兵种) & khắc chế
- [[systems/general-system]] — Hệ tướng (武将): chiêu mộ, phẩm chất, giác tỉnh (觉醒)
- [[systems/formation-system]] — Trận pháp (阵法) & binh thư
- [[systems/city-conquest]] — Công thành chiếm đất PvE (打天下)
- [[systems/economy-and-internal-affairs]] — Tài nguyên, công trình, khoa học kỹ thuật (内政/科技)
- [[systems/equipment-and-gear]] — Trang bị, bộ đồ, bảo vật, thần binh, chiến mã
- [[systems/multiplayer-and-endgame]] — Quốc chiến, liên server, thế giới BOSS
- [[systems/progression-and-vip]] — Cấp Chủ Công, VIP, thương mại hóa

## Thực thể & thế giới
- [[entities/generals]] — Danh sách tướng tiêu biểu (Quan Vũ, Lữ Bố, Triệu Vân…)
- [[world/world-map-and-campaign]] — Bản đồ 247 thành (Ngụy/Thục/Ngô) & chiến dịch sử thi

## Kỹ thuật
- [[technical/asset-pipeline]] — Bố cục `Assets/Resources/` & toolchain 2D
- [[technical/asset-system-mapping]] — Ánh xạ thư mục asset ↔ hệ thống game

## Câu hỏi mở lớn
- [[open-questions]] — công thức sát thương, hình học chiến trường (5 hàng?), bảng VIP, số liệu nội chính, tên Việt hóa nội bộ, và **phiên bản nào để dựng lại** ([[decisions/game-version-scope]]).

---
## Backlinks
- [[index]] — mục lục
