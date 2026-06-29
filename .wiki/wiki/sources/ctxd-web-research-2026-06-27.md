---
title: Nghiên cứu web — Công Thành Xưng Đế / 攻城掠地 (2026-06-27)
category: sources
tags: [research, web, three-kingdoms]
source_path: raw/references/web-research-2026-06-27
source_type: reference
date: 2026-06-27
authors: [multi-agent web research]
created: 2026-06-27
ingested: 2026-06-27
updated: 2026-06-27
---

# Nghiên cứu web — Công Thành Xưng Đế / 攻城掠地

## Abstract
Tổng hợp từ một đợt nghiên cứu đa tác tử (12 hệ thống × tra cứu nguồn Việt + Trung + kiểm chứng chéo độc lập) nhằm phục dựng tri thức về game gốc cho dự án Unity `ctxd_client`. Game đã được xác định chắc chắn là **攻城掠地** (webgame chiến thuật Tam Quốc theo lượt của 傲世堂/Shanghai Game Reign, công bố TQ 15/04/2013), bản Việt hóa **Công Thành Xưng Đế** ra mắt ~31/10/2013 (NPH gốc Trí Tuệ Việt / TTV). Không có file gốc trong `raw/`; nguồn là web (Baidu Baike, trang chính chủ 傲世堂, GameRes, các trang công lược TQ, và báo/wiki game VN).

> [!warning] Phân biệt 3 game cùng tên
> Khâu kiểm chứng phát hiện **ba** game khác nhau dễ bị trộn dữ liệu: (1) **攻城掠地** webgame 2013 — mục tiêu chính, asset dự án khớp bản này; (2) **Công Thành Xưng Đế Mobile** (2019, NPH VGP) — game mobile khác; (3) **乱世曹操传** — game anh em cùng NPH. Xem [[decisions/game-version-scope]].

## Key claims (xem [[claims]])
- [[claims#c-20260627-03]] — Định danh & lịch sử game
- [[claims#c-20260627-05]] — Tam giác thế trận 突击/攻击/防御
- [[claims#c-20260627-07]] — Mô hình sĩ khí (士气) 50→100 → kỹ năng 2
- [[claims#c-20260627-11]] — Bản đồ 247 thành + 3 thành Man

## Pages updated from this source
- [[overview]]
- [[systems/battle-system]], [[systems/tactics-and-rage]], [[systems/troop-types]], [[systems/general-system]], [[systems/formation-system]], [[systems/city-conquest]], [[systems/economy-and-internal-affairs]], [[systems/equipment-and-gear]], [[systems/multiplayer-and-endgame]], [[systems/progression-and-vip]]
- [[entities/generals]], [[world/world-map-and-campaign]], [[technical/asset-system-mapping]]
- [[decisions/game-version-scope]]

## Open questions raised
- Xem [[open-questions]] — công thức sát thương, hình học chiến trường, bảng VIP, số liệu công trình, tên Việt hóa nội bộ.

## Nguồn chính (độ tin cao)
- 攻城掠地 — Baidu Baike: https://baike.baidu.com/item/%E6%94%BB%E5%9F%8E%E6%8E%A0%E5%9C%B0/8917010
- 国战系统 — trang dữ liệu chính chủ 傲世堂: https://gc.aoshitang.com/news/ziliao/612012121118034329969.html
- 武将五种攻防属性 — 傲世堂: https://gc.aoshitang.com/news/zixun/322013031413222593632.html
- VIP特权 — 傲世堂: https://gc.aoshitang.com/news/ziliao/492013022813493640830.html
- 各核心系统 — GameRes: https://www.gameres.com/249586.html
- 32条新手必备常识 — Gamersky: https://www.gamersky.com/handbook/201405/359124.shtml
- 阵法系统/兵书 — Baidu Jingyan: https://jingyan.baidu.com/article/ce09321b84f6d72bff858fb1.html
- 觉醒关羽 — Baidu Baike: https://baike.baidu.com/item/%E6%94%BB%E5%9F%8E%E6%8E%A0%E5%9C%B0%E8%A7%89%E9%86%92%E5%85%B3%E7%BE%BD/19271941
- Công Thành Xưng Đế — Thanh Niên: https://thanhnien.vn/games/cong-thanh-xung-de-6247.htm
- Công Thành Xưng Đế — Download.com.vn: https://download.com.vn/cong-thanh-xung-de-128816
- Điểm nhấn Công Thành Xưng Đế — Việt Giải Trí: https://vietgiaitri.com/nhung-diem-nhan-thu-vi-cua-cong-thanh-xung-de-20131101i1019299/

## Notes
- Báo cáo đầy đủ (raw JSON) lưu ở task output `w95p3c383`; bản tách theo hệ thống ở scratchpad `research/`.
- Phần lớn nguồn TQ dẫn lại Baidu Baike — đã cố tìm nguồn độc lập khi kiểm chứng (forum/官方/GameRes).
- Một số trang VN chặn WebFetch; nhiều trang VN tìm được là server lậu (kinh tế bị thổi phồng) — KHÔNG dùng cho số liệu nạp/tỉ giá.
