---
title: Kiến trúc Client / Server & phân việc
category: technical
tags: [architecture, client, server, networking, anti-cheat, authoritative]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Kiến trúc Client / Server & phân việc

Tài liệu phân tích ranh giới Client ↔ Server cho bản dựng lại **Công Thành Xưng Đế** (`ctxd_client`) và chia việc cụ thể cho hai phía. Bám theo thiết kế game ở [[GDD]] và [[overview]].

## 1. Nguyên tắc kiến trúc (đọc trước)

> [!warning] NGUYÊN TẮC SỐNG CÒN: Server-authoritative (máy chủ uy quyền tuyệt đối)
> Đây là game **PvP + có nạp tiền** (元宝/KNB, VIP, đua top, quốc chiến). **Client KHÔNG bao giờ được tự quyết kết quả.** Mọi sát thương, RNG, phần thưởng, trừ tài nguyên, lên cấp, giác tỉnh... đều do **Server tính và xác nhận**. Client chỉ **gửi ý định** và **trình diễn kết quả** server trả về. Nếu để logic ăn thua/tiền tệ ở client → gian lận tức thì, sập kinh tế game.

5 nguyên tắc:
1. **Server là nguồn sự thật duy nhất** (single source of truth) cho mọi trạng thái & kết quả.
2. **Client = trình diễn + nhập liệu** (render, animation, UI, input, dự đoán/optimistic UI).
3. **Chiến đấu giải đòn trên Server** — RNG gieo hạt (seeded) ở server; client phát lại animation.
4. **Server kiểm tra mọi input** — hồi chiêu, chi phí, cổng cấp, thời điểm bấm trong đồng hồ, rate-limit. Không tin client.
5. **Server giữ DB**; client chỉ giữ **cache/snapshot** + **bảng cấu hình tĩnh để hiển thị**.

## 2. Mô hình tổng thể

```
 ┌─────────────── CLIENT (Unity 6.5) ───────────────┐        ┌──────────────── SERVER ────────────────┐
 │  Input → UI → Network layer                       │  REST  │  Gateway/Auth → Game Services → DB      │
 │  Presentation: isometric battle, animation,       │◄──────►│  (Battle, Player, City, World/国战,     │
 │  HUD (bánh xe thế trận), bản đồ, shop...          │ Socket │   PvE, Tournament, Social, Event)       │
 │  Local cache + Config (ScriptableObject)          │◄──────►│  Cache (Redis) + DB (SQL) + Logs        │
 └───────────────────────────────────────────────────┘        └─────────────────────────────────────────┘
```

- **Shard ("máy chủ" S136…)**: mỗi server là một thế giới riêng (bản đồ 247 thành + dân số riêng). Dịch vụ **liên server (跨服)** bắc cầu giữa các shard cho giải đấu/thành chiến liên server.
- Khớp với thực tế game gốc: webgame chạy gần như **toàn bộ logic ở server**, client (Flash) chỉ render. Bản Unity nên giữ tinh thần này.

## 3. Giao thức & kết nối

| Kênh | Dùng cho | Công nghệ gợi ý |
|---|---|---|
| **REST/HTTP** (request-response) | Đăng nhập, tải roster, trang bị, shop, mail, nội chính, hầu hết thao tác "menu" | `UnityWebRequest` (đã có trong manifest) + JSON/Protobuf |
| **Socket bền** (push 2 chiều) | **Chiến đấu theo lượt** (trao đổi thế trận), **bản đồ quốc chiến thời gian thực** (di chuyển quân, sương mù, ai ở đâu), chat, thông báo đẩy | WebSocket / TCP (vd thư viện socket cho Unity) + Protobuf |

> [!tip] Game gốc dùng HTTP polling. Với Unity nên dùng **socket bền cho trận đánh & bản đồ quốc chiến** (độ trễ thấp, push trạng thái), còn lại REST cho đơn giản.

## 4. Luồng chiến đấu (quan trọng nhất)

Đây là phần dễ làm sai nhất. Chiến đấu **theo lượt, có đồng hồ ~3–4s** ([[systems/battle-system]]) → mô hình **tương tác từng lượt, server giải đòn**:

```
1. Vào trận: Client gửi "bắt đầu trận (đội hình A vs B, địa điểm)".
2. SERVER tạo phiên trận: gieo RNG (seed), nạp đội hình/trận pháp/binh chủng/sĩ khí.
3. SERVER → Client: init trận (đội hình, địa hình, sĩ khí khởi điểm).
4. Mỗi LƯỢT:
   a. SERVER mở cửa sổ quyết định (~4s) → "chọn thế trận lượt N".
   b. Client gửi thế trận (Đột/Công/Thủ) HOẶC Giác(觉醒)/lệnh, TRƯỚC khi hết giờ.
      → Hết giờ/không gửi: SERVER dùng Auto.
   c. SERVER giải đòn lượt: khắc chế thế trận → khắc chế binh chủng/địa hình
      → kích hoạt 战法 theo sĩ khí/điều kiện → tính sát thương (công thức + crit/độ bền)
      → cập nhật máu/sĩ khí/chết.
   d. SERVER → Client: kết quả lượt (chuỗi sự kiện: ai đánh ai, sát thương, chiêu nổ, chết, sĩ khí).
   e. Client PHÁT LẠI animation từ sự kiện (sprite army/skill/eff). KHÔNG tự tính số.
5. Lặp tới khi thắng/thua → SERVER chốt kết quả, cộng thưởng (EXP/đồ/bạc) & LƯU. → báo Client.
```

> [!warning] Client tuyệt đối KHÔNG tính sát thương. Nó chỉ gửi "thế trận đã chọn" + phát lại sự kiện server gửi. Server kiểm tra: thế trận hợp lệ? gửi trong thời hạn? hồi chiêu/sĩ khí đủ để Giác?
>
> **PvE tự động (Auto):** server có thể giải toàn bộ trận tức thì và gửi **replay** (chuỗi sự kiện) để client phát lại — vẫn server-authoritative.

## 5. Bảng phân chia trách nhiệm theo hệ thống

| Hệ thống | SERVER (uy quyền) | CLIENT (trình diễn + nhập) |
|---|---|---|
| **Tài khoản/Đăng nhập** | Xác thực, phiên, token, chống đa đăng nhập | Màn login, lưu token, reconnect |
| **Chiến đấu** ([[systems/battle-system]]) | Giải đòn toàn bộ: RNG, khắc chế thế trận, sĩ khí, 战法, công thức sát thương, thắng/thua | Render isometric, animation, **bánh xe thế trận**, đồng hồ, gửi lựa chọn, phát lại sự kiện |
| **Chiến pháp/Nộ khí** ([[systems/tactics-and-rage]]) | Tính sĩ khí, điều kiện/ xác suất kích hoạt 战法, kết quả giác tỉnh | Hiệu ứng `warSkillName`/`warFeatAnger`, splash giác tỉnh |
| **Tướng** ([[systems/general-system]]) | Chiêu mộ (cổng cấp, thắng NPC), lên cấp, **giác tỉnh (RNG ~0.2%)**, chỉ số | Màn tướng, danh sách, chân dung, nút thao tác |
| **Binh chủng** ([[systems/troop-types]]) | Định nghĩa binh chủng, khắc chế, ưu tiên địa hình (số liệu thật) | Hiển thị icon binh chủng, lọc/sắp |
| **Trận pháp** ([[systems/formation-system]]) | Mở khóa, cấp trận (= tổng binh thư), hiệu ứng cộng chỉ số | Màn xếp trận, kéo-thả vị trí (gửi lên server) |
| **Trang bị/Rèn** ([[systems/equipment-and-gear]]) | Mọi RNG: cường hóa/tinh luyện/tẩy luyện, ghép bộ, đúc thần binh, triệu mã | Màn trang bị, kéo-thả, xem trước, hiệu ứng rèn |
| **PvE chiến dịch** ([[systems/city-conquest]]) | Tiến độ phó bản, **rớt đồ/mảnh tướng**, ngân sách quân ảo, độ khó, mở khóa tướng | Màn chọn phó bản, độ khó, vào trận |
| **Nội chính/Kinh tế** ([[systems/economy-and-internal-affairs]]) | Sản lượng tài nguyên (tính theo thời gian server), trần kho, **timer xây/nghiên cứu**, chi phí | Màn chủ thành, hàng đợi xây, nút nâng cấp |
| **Bản đồ/Quốc chiến** ([[systems/multiplayer-and-endgame]], [[world/world-map-and-campaign]]) | **Trạng thái thế giới chung**: sở hữu thành, di chuyển quân, sương mù, 突进/vây thành, 国力/军资, bảng giết địch | Vẽ bản đồ, fog, ra lệnh hành quân (gửi server), nhận push cập nhật |
| **Giải đấu (武斗会)** | Ghép cặp, bậc đấu, kết quả, **đánh trống cổ vũ (đếm)** | Màn giải, khán chiến, nút cổ vũ |
| **Thế giới BOSS (董卓)** | Máu boss chung, roi/ngày, 狂怒值, thưởng | Hiệu ứng đánh boss, đếm roi |
| **Tiến trình/VIP/Tiền** ([[systems/progression-and-vip]]) | Cấp Chủ Công, EXP, **số dư 元宝/KNB**, ngưỡng VIP, đặc quyền | Hiển thị cấp/VIP/số dư |
| **Shop/Nạp** | Đơn hàng, cổng thanh toán (callback NPH), phát vật phẩm | Giao diện shop, gói nạp |
| **Xã hội** | Quân đoàn/Liên minh, chat (kiểm duyệt), mail, bảng xếp hạng | Khung chat, danh sách thành viên |
| **Lưu trữ** | DB toàn bộ tiến trình; chống mất/giả mạo | Cache cục bộ (chỉ để hiển thị nhanh) |

## 6. Kiến trúc Server (mô-đun)

- **Gateway/Connection**: nhận kết nối, xác thực token, định tuyến tới service.
- **Auth/Account**: đăng nhập, phiên.
- **Battle service**: bộ giải đòn (resolver) + RNG + công thức + sĩ khí; phục vụ cả PvP tương tác lẫn PvE replay.
- **Player/General/Equipment service**: tiến trình, kho đồ, giác tỉnh.
- **City/内政 service**: tài nguyên (tính theo thời gian), công trình, **timer** xây/nghiên cứu (dùng job/scheduler).
- **World/国战 service** *(nặng nhất)*: bản đồ 247 thành thời gian thực, di chuyển quân, fog, vây thành/突进 — giữ trong **cache (Redis)**, đồng bộ định kỳ xuống DB; push cập nhật qua socket.
- **PvE/Campaign service**: phó bản, độ khó, rớt đồ, quân ảo.
- **Tournament/Arena service**: 武斗会 bracket, ghép cặp, khán chiến.
- **Event/Boss service**: 董卓, sự kiện ngày/mùa.
- **Cross-server (跨服) service**: bắc cầu shard cho giải/thành chiến liên server.
- **Persistence**: **SQL** (dữ liệu người chơi) + **Redis** (trạng thái thế giới nóng, phiên, hàng đợi) + **log** (audit/chống gian lận).
- **Anti-cheat/Validation** (xuyên suốt mọi service): kiểm tra input, rate-limit, phát hiện bất thường.

> [!tip] Mỗi shard chạy độc lập (world riêng). Tách **World service** ra tiến trình riêng vì nó là điểm nóng đồng thời cao (đông người trong quốc chiến).

## 7. Kiến trúc Client (Unity)

- **Network layer**: REST client (`UnityWebRequest`) + Socket client; serialize (Protobuf khuyến nghị); **reconnect & resync** (quan trọng cho trận PvP/bản đồ).
- **Data/Model layer**: cache trạng thái người chơi; **Config tĩnh (ScriptableObject)**: định nghĩa tướng/binh chủng/chiến pháp/trang bị để **hiển thị & dự đoán** (xem mục 8).
- **Battle presentation**: renderer isometric, phát animation từ asset (`army/att|def`, `skill`, `eff`), HUD (bánh xe thế trận, menu lệnh), bộ phát replay/lượt.
- **UI/Screens**: chủ thành, tướng, trang bị, bản đồ thế giới, shop, giải đấu, xã hội.
- **Input**: chọn thế trận, lệnh, tương tác bản đồ.
- **Asset/Resources**: nạp `Assets/Resources/` (cân nhắc chuyển sang **Addressables** để cập nhật/giảm RAM).

## 8. Dữ liệu cấu hình: hiển thị (client) vs sự thật (server)

> [!warning] Cấu hình tĩnh (chỉ số tướng, số hàng đánh của 战法, hệ số binh chủng, chỉ số trang bị) PHẢI khớp hai phía.
> - **Client**: giữ bản cấu hình để **hiển thị & dự đoán** (ScriptableObject) — KHÔNG dùng để quyết kết quả.
> - **Server**: giữ bản cấu hình **uy quyền** để giải đòn.
> - **Nên sinh cả hai từ MỘT nguồn** (vd bảng dữ liệu chung → export ra SO cho client + config cho server) để không lệch. Đây là một **việc chung** quan trọng (mục 10).

## 9. Chống gian lận (checklist tối thiểu)

- Không tin bất kỳ con số kết quả nào từ client (sát thương, máu, tiền, vật phẩm).
- Kiểm mọi action: cổng cấp, chi phí tài nguyên, hồi chiêu, **thời điểm bấm trong cửa sổ đồng hồ**, sở hữu vật phẩm.
- Rate-limit & chống replay request (nonce/timestamp).
- RNG ở server (seed bí mật); không lộ seed cho client.
- Server tính thời gian (sản lượng/timer) — không tin đồng hồ client.
- Ghi log giao dịch tiền tệ/vật phẩm để audit & rollback.

---

## 10. PHÂN VIỆC (việc cụ thể cho từng phía)

### 🖥️ CLIENT (đội Unity) — làm gì
| Nhóm | Việc |
|---|---|
| Nền tảng | Network layer (REST + Socket), reconnect/resync, serialize (Protobuf), quản lý phiên/token |
| Dữ liệu | Hệ Config ScriptableObject (tướng/binh chủng/战法/trang bị) để hiển thị; cache trạng thái người chơi |
| **Chiến đấu** | Renderer isometric (2 phe Công/Thủ, 5 vị trí, tốp lính); **bộ phát animation** từ sự kiện server; **HUD bánh xe thế trận + đồng hồ + Giác**; menu lệnh (Soái Kỳ/Mượn Binh/Lừa Địch/Đột Tiến…); banner sự kiện; số thưởng/sát thương nổi; bộ phát **replay** PvE |
| Màn hình | Chủ thành/nội chính, Tướng (+giác tỉnh), Trang bị/Rèn, Bản đồ thế giới (+fog), Shop, Giải đấu (+khán chiến cổ vũ), Xã hội/chat |
| Input | Gửi thế trận/lệnh trong thời hạn; kéo-thả xếp trận/trang bị; ra lệnh hành quân trên bản đồ |
| Asset | Pipeline nạp `Resources/`→Addressables; ghép animator cho `army/skill/eff`; map ID quân→binh chủng |
| Polish | Optimistic UI (hiển thị tạm chờ server xác nhận), âm thanh, hiệu ứng |

### ☁️ SERVER (đội backend) — làm gì
| Nhóm | Việc |
|---|---|
| Nền tảng | Gateway + Auth, quản phiên, định tuyến service, **shard model** |
| **Battle resolver** | Bộ giải đòn uy quyền: RNG seeded, khắc chế thế trận, sĩ khí/skill-1/skill-2, kích hoạt 战法, **công thức sát thương** (crit/độ bền), thắng/thua, phát thưởng |
| Vòng trận PvP | Quản phiên trận theo lượt, cửa sổ đồng hồ, nhận lựa chọn, broadcast sự kiện; Auto khi hết giờ |
| Tiến trình | Tướng (chiêu mộ/cấp/**giác tỉnh RNG**), trang bị/rèn (mọi RNG), trận pháp, binh khí |
| Kinh tế/Nội chính | Sản lượng theo thời gian, trần kho, **timer xây/nghiên cứu (scheduler)**, chi phí, mộ binh |
| **World/国战** | Bản đồ chung 247 thành, di chuyển quân, fog, vây thành/突进, 国力/军资, bảng xếp hạng (Redis + push) |
| PvE | Phó bản, độ khó, **rớt đồ/mảnh tướng**, quân ảo, mở khóa tướng |
| Giải đấu/BOSS/Sự kiện | 武斗会 ghép cặp + cổ vũ, 董卓 boss chung, sự kiện ngày/mùa |
| Liên server | Dịch vụ 跨服 cho giải/thành chiến |
| Tiền/Shop | Số dư 元宝/KNB, VIP累计, đơn nạp + callback NPH, phát vật phẩm |
| Xã hội | Quân đoàn/Liên minh, chat (kiểm duyệt), mail, leaderboard |
| Lưu trữ/An toàn | DB + Redis + log; **anti-cheat/validation** xuyên suốt; backup/rollback |

### 🤝 VIỆC CHUNG (hợp đồng giữa 2 phía — làm SỚM)
| Việc | Vì sao |
|---|---|
| **Định nghĩa protocol** (message schema cho REST + socket, Protobuf/JSON) | Hai đội code song song không kẹt nhau |
| **Một nguồn dữ liệu cấu hình** → export SO (client) + config (server) | Tránh lệch chỉ số gây sai/gian lận (mục 8) |
| **Định dạng "sự kiện trận đánh"** (battle event/replay) | Client phát lại đúng cái server tính |
| **Hợp đồng thời gian** (server-time, timer, đồng hồ thế trận) | Mọi thời gian do server quyết |
| **Mã lỗi & xác thực** chung | Xử lý đồng nhất |

## 11. Đề xuất tech stack & thứ tự MVP

- **Server**: ngôn ngữ có ecosystem game-server tốt (vd **C#/.NET** để chia sẻ code/logic với Unity, hoặc Go/Java/Node tùy đội); **SQL** (Postgres/MySQL) + **Redis**; transport WebSocket/TCP + Protobuf.
  > [!tip] Dùng **C#/.NET** cho server cho phép **chia sẻ DỮ LIỆU/CẤU HÌNH** với client Unity (cùng C#) → giảm lệch. ⚠️ NHƯNG **chỉ chia sẻ data/config, TUYỆT ĐỐI KHÔNG ship resolver/RNG/drop trong client** (decompile lộ logic → bot) — xem §12.7.
- **MVP theo lộ trình [[GDD]] §16**:
  1. **Battle slice**: protocol trận + server resolver + client render/animation cho **1 trận** (5 vị trí, 3 thế trận, sĩ khí).
  2. Tướng + trang bị (server tiến trình + client màn hình).
  3. PvE chiến dịch.
  4. Nội chính/kinh tế (timer server).
  5. Bản đồ/Quốc chiến (World service + socket).
  6. Giải đấu/BOSS/liên server.

---

## 12. Gia cố sản xuất (sau red-team kiến trúc)

> [!info] Mục này bổ sung các phần "khó" mà bản nháp §1–11 chưa làm kỹ, theo review đối kháng. Các nguyên tắc lõi (server-authoritative, RNG seeded, server-time là đồng hồ duy nhất, một-nguồn-config, tách REST/socket, World service riêng, battle-first MVP, log giao dịch) **được giữ nguyên** — phần dưới chỉ siết chặt.

### 12.1 Đồng thời Quốc chiến (CRITICAL — lỗ hổng lớn nhất)
Bản đồ 247 thành chung, 3 nước, 3 khung giờ ai cũng online → **đua chiếm cùng 1 thành** gây double-capture, mất quân, thưởng nhân đôi. "Redis + push" CHƯA đủ.
- **Chiếm thành nguyên tử (atomic)**: mỗi thành có 1 điểm tuần tự hóa (per-city actor/queue, HOẶC Redis Lua CAS/`WATCH`-MULTI, HOẶC DB row-lock). Chiếm = giao dịch tuyến tính: `kiểm defender==0 → set owner → phát thưởng`, all-or-nothing.
- **Tick uy quyền**: World service bước theo **nhịp cố định** (di chuyển quân/vây thành) → thứ tự xác định, không đua async socket.
- **Giải tranh chấp đồng tick**: tie-break theo timestamp/seq đến trước.
- **Redis = cache nóng, DB = chủ bền**: sự kiện chiếm thành phải **commit bền ngay** (không chỉ flush định kỳ — flush định kỳ làm mất kết quả khi crash).
- **Single-writer/thành**: để bộ đếm phe (mà 突进 & khóa 战法 phụ thuộc) nhất quán.
- **Phân vùng theo region** + batch broadcast: thành nóng không serialize cả bản đồ.

### 12.2 Mất kết nối / kết nối lại / no-show (CRITICAL)
- **Trận PvP rớt giữa chừng**: server GIỮ phiên trận sống; lượt người rớt → **Auto** trong cửa sổ ân hạn (vd N lượt/M giây); vào lại → **replay lượt đã lỡ** từ event log; quá hạn → server **xử thua** (rớt KHÔNG có lợi → chống rage-quit/rút cáp).
- **Giải đấu no-show**: walkover/auto-resolve bằng đội hình đã nộp đánh Auto; người vắng không làm kẹt bracket.
- **AFK quốc chiến/boss**: timeout hiện diện server-side; AFK không giữ tài nguyên tranh chấp.
- **Resync**: snapshot + delta theo seq; thưởng đã commit **KHÔNG cấp lại** (idempotent); áp lại fog khi resync.

### 12.3 Giao thức lượt: commit–reveal (HIGH)
Hai bên chọn thế trận **đồng thời & bí mật** → naive "gửi thế trận" bị sniff/lệch độ trễ.
- **Commit–reveal**: cả 2 client submit (server giữ kín) → server chỉ **reveal sau khi cả 2 đã khóa** hoặc hết giờ; **không bao giờ broadcast thế trận trước khi khóa**; giải đòn server-side; chỉ phát chuỗi sự kiện đã giải.
- **Mọi trận tái dựng được** từ event log server (reconnect, audit, khán chiến).
- **Ma trận**: PvP người-vs-người = commit-reveal tương tác; PvE/NPC = server pre-compute + **replay có ký**.

### 12.4 Idempotency: thanh toán, thưởng, mail (CRITICAL — tiền thật)
- **Đơn nạp**: vòng đời idempotent `pending→paid→granted`; **dedupe callback NPH theo order-id**; verify receipt server-side; job đối soát; xử chargeback/clawback.
- **Mọi cấp/trừ** (mail attachment, thưởng cuối trận khi retry, 借兵): 1 giao dịch DB theo **idempotency token**; **claim-once** với cờ "đã nhận" kiểm TRONG giao dịch.

### 12.5 Chống bot & gian lận hành vi (CRITICAL)
- **Phát hiện hành vi** (không chỉ kiểm từng request): entropy thời điểm bấm (thế trận rơi vào ms quá đều trong cửa sổ 3-4s = bot), độ dài phiên/không nghỉ, bất thường tần suất, client attestation/integrity, device fingerprint → pipeline: shadow-flag → review → rollback/ban.
- **Auto-tactic ở SERVER**: chính sách auto đánh giá server từ config lưu server; client chỉ gửi on/off (KHÔNG để client tính nước tối ưu = bot được server chúc phúc).
- **Đánh trống cổ vũ (击鼓)**: rate-limit/cooldown/account, dedupe, loại self/alt; qua đường idempotency như action kinh tế.
- **Bảng xếp hạng/giải**: chống thông đồng (đồ thị alt, lặp cặp đấu), cap điểm/đối thủ.

### 12.6 Bịt rò rỉ thẩm quyền (HIGH)
- **Optimistic UI = CHỈ placeholder hình ảnh**; bị ghi đè hoàn toàn bởi snapshot server kế tiếp; **không quyết định nào của client đọc state dự đoán**.
- **Fog = ranh giới phân quyền SERVER-SIDE** (server chỉ gửi state người chơi được phép thấy), KHÔNG phải lọc render ở client → chống **maphack**.
- **Server re-validate đội hình/trang bị**: tính lại toàn bộ chỉ số từ layout nộp lên, đối chiếu sở hữu/cổng cấp, từ chối slot phạm luật (tướng trùng, đồ vượt gate, set không hợp lệ).
- **突进 / khóa 战法**: server đánh giá theo bộ đếm phe/thành, push xuống — client KHÔNG tự quyết.
- **Time-skip/tăng tốc**: tiêu vật phẩm = giao dịch server **giảm timer + trừ item nguyên tử**.
- **RBAC quân đoàn/liên minh**: mọi action quyền lực (tuyên chiến liên server, kick, chia chiến lợi) kiểm quyền server-side; không tin vai trò client khai.

### 12.7 Rủi ro stack C# chia sẻ (HIGH)
- ⚠️ **KHÔNG ship resolver thật trong client**: IL C# decompile dễ (ILSpy/dnSpy) → lộ công thức sát thương/RNG/drop → bot hoàn hảo + đoán rớt đồ. Chỉ chia sẻ **data/config + stub dự đoán trình diễn**; **resolver thật ở assembly/repo SERVER-ONLY**, không bao giờ ship.
- **Float determinism**: cross-platform float không xác định → dự đoán client chỉ **tư vấn & luôn bị ghi đè**; nếu cần lockstep thì dùng **fixed-point/integer** + lib toán pinned.
- **Schema versioning**: message versioned + negotiate capability khi connect + forced-update cho breaking change (client/server ship độc lập, tránh desync giữa quốc chiến).

### 12.8 An toàn tài khoản & live-ops
- 2FA/binding, chống chiếm phiên, device binding (game PvP + nạp + trade account dễ bị trộm).
- **Gộp server (merge)** khi dân giảm (đặc thù thể loại): định danh cross-shard, va chạm tên/leaderboard khi merge — thiết kế từ đầu.

---
## Backlinks
- [[overview]] — kiến trúc tổng thể
- [[GDD]] — §14 Kỹ thuật, §16 lộ trình
- [[technical/asset-pipeline]] · [[technical/asset-system-mapping]]
- [[systems/battle-system]] — luồng chiến đấu
