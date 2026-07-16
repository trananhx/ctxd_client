---
title: Index
category: index
created: 2026-06-27
updated: 2026-06-27
---

# ctxd_client — Wiki Index

Master catalog. Read first to find relevant pages. Project = recreation of **Công Thành Xưng Đế / 攻城掠地** (Three Kingdoms turn-based SLG). See [[decisions/game-version-scope]] for the 3-game disambiguation.

**Entry format**: `category/page — description`

## Overview
- [[GDD]] — **Game Design Document tổng hợp** (tài liệu master, đọc trước)
- [[overview]] — Dự án, định danh game, vòng lặp cốt lõi, danh mục hệ thống

## Systems
- [[systems/battle-system]] — Chiến đấu theo lượt; hàng đợi 5 tướng; 3 thế trận 突击/攻击/防御 khắc chế; hình học chiến trường (cờ đỏ renderer)
- [[systems/tactics-and-rage]] — Chiến pháp (战法); sĩ khí/nộ khí (士气/怒气) 50→100 → kỹ năng 2; 混乱/抵挡; 武神附体
- [[systems/troop-types]] — Binh chủng (兵种); phân biệt 4 (webgame) vs 5 (mobile) vs 6 (乱世曹操传)
- [[systems/general-system]] — Hệ tướng (武将); chiêu mộ, phẩm chất, giác tỉnh (觉醒 lv120/121), Đào Viên
- [[systems/formation-system]] — Trận pháp (阵法); 3 trận cơ bản + 云垂阵; binh thư (兵书)
- [[systems/city-conquest]] — Công thành chiếm đất PvE (打天下); 5 độ khó; quân ảo 幻影; mở khóa tướng
- [[systems/economy-and-internal-affairs]] — 4 tài nguyên; công trình; khoa học kỹ thuật (科技)
- [[systems/equipment-and-gear]] — Trang bị 6 ô; bộ thần thú; bảo vật (宝物); thần binh (神兵); chiến mã
- [[systems/multiplayer-and-endgame]] — Quốc chiến (国战); liên server; thế giới BOSS (讨伐董卓)
- [[systems/progression-and-vip]] — Cấp Chủ Công; VIP累计充值; 元宝/KNB; không có thanh thể lực

## Entities
- [[entities/generals]] — Danh sách tướng tiêu biểu (Quan Vũ, Lữ Bố, Triệu Vân, Gia Cát Lượng…) với chiêu gốc/giác tỉnh

## World
- [[world/world-map-and-campaign]] — Bản đồ 247 thành + 3 thành Man (魏蜀吴); chiến dịch sử thi (Khăn Vàng→Quan Độ→Xích Bích)

## Technical
- [[technical/ctxd-architecture]] — **Kiến trúc client CTXD (SPEC + Trạng thái hiện thực)**: battle slice ĐÃ CHƠI ĐƯỢC (menu→trận→kết quả, HUD+bánh xe thế trận, VFX) ⭐
- [[technical/client-server-architecture]] — **Kiến trúc Client/Server & phân việc** (server-authoritative)
- [[technical/client-architecture-patterns]] — **Blueprint client**: Luzart + SO Architecture + design patterns + battle slice
- [[technical/luzart-framework]] — **Hub** framework Luzart (catalog + trỏ 9 trang chi tiết per-folder)
- [[technical/luzart-di-core]] — Luzart `Content/DI`+`Universe`: Domain, EventBus, lifecycle, Bag/Manager (bootstrap)
- [[technical/luzart-view]] — Luzart `Content/View`: `ViewT<T>`/`ViewChilding` = SO→prefab→spawn ⭐
- [[technical/luzart-saveable]] — Luzart `Content/Saveable`: ISaveable/SaveItem/SaveService
- [[technical/luzart-reactivevalues]] — Luzart `ReactiveValues`: INumber/IBool/IString + Runtime* (bind UI)
- [[technical/luzart-ui]] — Luzart `UIFramework/LuzartUI`: UIManager/UIBase<T>/UIRegistrySO (async, lane)
- [[technical/luzart-tween]] — Luzart `TweenAnimationPackage`: animation data-driven trên DOTween
- [[technical/luzart-select]] — Luzart `NewBaseSelect`: Switch/Toggle đổi visual prefab bằng int/bool
- [[technical/luzart-authoring]] — Luzart `Attributes`+`Editor`: attribute Inspector author SO ([ShowIf]/[Dropdown]/[Button])
- [[technical/luzart-assetmodifier]] — Luzart `AssetModifier`: EditorWindow làm hàng loạt SO
- [[technical/asset-pipeline]] — Bố cục `Assets/Resources/` & toolchain 2D
- [[technical/asset-system-mapping]] — Ánh xạ thư mục asset ↔ hệ thống game

## Decisions
- [[decisions/game-version-scope]] — Phiên bản nào để dựng lại (đề xuất: webgame 2013)
- [[decisions/unity-downgrade-6000.2.8-2026-07-15]] — Hạ Unity xuống 6000.2.8f1 (đã verify biên dịch)

## Meta / Provenance
- [[claims]] — 18 luận điểm có trích nguồn
- [[contradictions]] — 7 mâu thuẫn chưa giải
- [[open-questions]] — 12 câu hỏi mở
- [[sources/ctxd-web-research-2026-06-27]] — Đợt nghiên cứu web nguồn
- [[sources/screenshot-somo-battle-2026-06-27]] — Ảnh gameplay gốc (xác nhận game + hình học isometric)

## Bugs
<!-- chưa có -->

## Analysis
<!-- chưa có -->
