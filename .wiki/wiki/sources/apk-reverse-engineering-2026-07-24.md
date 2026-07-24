---
title: Dịch ngược APK client 攻城掠地 (Xưng Đế Công Thành v8.9.0.6)
category: sources
tags: [reverse-engineering, primary-source, cocos2d-lua, client-code, ground-truth]
source_path: raw/references/apk-reverse-engineering-gcld-2026-07-24.md
source_type: reference
date: 2026-07-24
authors: [reverse-engineered by Claude Code from APK]
created: 2026-07-24
ingested: 2026-07-24
updated: 2026-07-24
---

# Dịch ngược APK client 攻城掠地 (Xưng Đế Công Thành v8.9.0.6)

## Abstract

Nguồn **sơ cấp hạng cao nhất từ trước tới nay**: toàn bộ mã client của **chính game mà `ctxd_client` đang làm lại** (攻城掠地 / Công Thành Lược Địa), dịch ngược từ APK `Xưng Đế Công Thành_1.apk`. Game dùng **Cocos2d-x + LuaJIT**; 1115 file bytecode LuaJIT stripped đã decompile **thành công 100%**, tên file (băm `md5(path.lua)`) đã khôi phục thành cây source có tên (`lua/game/battle/*`…). Phát hiện kiến trúc **server-authoritative**: server tính toàn bộ trận rồi stream một "báo cáo trận" gồm ~47 loại sự kiện đánh số; client chỉ **replay** (`reportHandler/<n>.lua`). Nguồn này **xác nhận trực tiếp** nhiều claim trước đây chỉ có từ research web, và **giải quyết nhiều mâu thuẫn phiên bản**. Lưu ý: **con số cân bằng cốt lõi (sát thương, chỉ số gốc, giá) nằm ở server**, không có trong client — GDD này mạnh về *cấu trúc/luật/enum*, yếu về *định lượng*.

> Phương pháp tái lập đầy đủ ở §1 của nguồn. Bối cảnh version: **game 8.9.0.6 / client 5.4.1.0** (build 2018), package `com.gpstore.xdctslg`, NPH Aoshitang/Ujoy. Đây là bản **mobile** đời sau, khác bản webgame 2013 — hữu ích cho tranh luận version drift ([[decisions/game-version-scope]]).

## Key claims

- [[claims#c-20260724-07]] — Kiến trúc server-authoritative: server tính trận → stream report đánh số; client replay
- [[claims#c-20260724-08]] — `BATTLE_ROW_NUM = 12`; z-order = 12−row; chết-theo-hàng xác nhận (reportHandler 30/46)
- [[claims#c-20260724-09]] — Mã ID chiến pháp 7 chữ số (loại×địa hình); nộ cast server-gate + tap thủ công
- [[claims#c-20260724-10]] — 4 hệ khắc chế Bộ/Kỵ/Cung + Khí giới (`hasCar`); troopType hiển thị 1–9
- [[claims#c-20260724-11]] — 6 phẩm chất Trắng<Lam<Lục<Vàng<Đỏ<Tím (color.lua)
- [[claims#c-20260724-12]] — Chỉ số nền client = leader(Thống)+strength(Dũng)+att+def+fMax(HP)+forces; KHÔNG có 武力
- [[claims#c-20260724-13]] — Thức tỉnh (觉醒) là trục tiến hoá: evoke 0/1/2; 4 kỹ năng nhỏ + 1 đại (max 5)
- [[claims#c-20260724-14]] — Hệ nô lệ/tù nhân: bắt tướng địch vào lao dịch, cải tạo công trình (Lỗ Ban)
- [[claims#c-20260724-15]] — `feud` = Phong Địa (fief) sản xuất, KHÔNG phải bang hội; cộng đồng = Quốc gia + Quân Đoàn
- [[claims#c-20260724-16]] — Viễn chinh cross-server: Cao Ly/Nhật/Lưu Cầu/Nam Chiếu/Việt Nam (Giao Chỉ)

## Pages updated from this source

- [[systems/battle-system]] — server-replay, 12 hàng, ~47 event type, phantom, Surround
- [[systems/tactics-and-rage]] — mã ID chiến pháp, biến thể địa hình, nộ = server-gate + tap
- [[systems/troop-types]] — 4 hệ khắc chế Bộ/Kỵ/Cung/Khí; troopType enum
- [[systems/general-system]] — Thống/Dũng, 6 phẩm chất, Thức tỉnh, trang bị 8 loại, chiêu mộ
- [[systems/unit-entity-model]] — xác nhận tướng=phương trận, binh lực=HP, chết-theo-hàng
- [[systems/economy-and-internal-affairs]] — 4 tài nguyên + nô lệ, 6 khu thành, cây công nghệ
- [[systems/equipment-and-gear]] — vũ khí/thần binh Lv220, đá quý khe, bộ trang bị
- [[systems/multiplayer-and-endgame]] — Hội chiến, Quân Đoàn, cross-server kf*
- [[systems/formation-system]] — troopPattern 3×3, 12 hàng
- [[systems/city-conquest]] — kịch bản/juben, viễn chinh, phantom
- [[world/world-map-and-campaign]] — 30 loại ô, sương mù, bản đồ ngoại quốc
- [[entities/generals]] — roster ~24 tướng (id→tên) + kỹ năng ký danh

## Open questions raised

- Nhãn "LV4/cấp4" trên panel binh chủng = bậc SAO hay CẤP ĐỘ? (client dùng troopType số + icon 1–9, không lộ hệ sao) — xem [[open-questions]]
- Bảng quy đổi đuôi ID chiến pháp (31/33/32…) → mã địa hình khắc chế: chỉ ở server
- Danh sách `troopType` 16–60 → tên binh chủng: không có bảng tên trong client

## Notes

- **Ranh giới client/server rất quan trọng**: mọi công thức (sát thương, né/bạo kích, targeting, tích nộ, hệ số khắc chế/địa hình, giá, sản lượng, đường cong cấp) **ở server**. Client chỉ chứa UI + enum + trình replay report. Đừng suy ra con số cân bằng từ nguồn này.
- Bản này là **mobile v8.9.0.6 (2018)** — giàu hệ thống hơn webgame 2013 (nhiều hoạt động, cross-server). Khi đối chiếu claim webgame, coi đây là **build đời sau**, không phủ nhận claim 2013.
- Toàn văn (618 dòng) + bằng chứng `file:dòng` ở nguồn bất biến `raw/references/apk-reverse-engineering-gcld-2026-07-24.md`.
- Cây source đã decompile nằm ở scratchpad phiên làm việc (tạm thời) — nếu cần tra cứu lại phải chạy lại pipeline dịch ngược (§1 của nguồn).

---
## Backlinks
- [[claims]] — c-20260724-07…16 trích từ nguồn này
- [[contradictions]] — nguồn giải quyết x-20260627-01 (binh chủng), x-20260627-05 (phẩm chất)
- [[index]] — mục Sources
