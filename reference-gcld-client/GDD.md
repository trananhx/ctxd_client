# GDD tái dựng — "Xưng Đế Công Thành" (攻城掠地 / Công Thành Lược Địa)

> Tài liệu thiết kế game **tái dựng bằng kỹ thuật dịch ngược** từ APK `Xưng Đế Công Thành_1.apk`, phục vụ nghiên cứu tham chiếu cho dự án `ctxd_client`. Chỉ phân tích **thiết kế & cơ chế**; không trích xuất/tái phân phối tài sản có bản quyền (art, audio, chuỗi nguyên bản).

## 0. Danh tính & tổng quan

| Mục | Giá trị |
|---|---|
| Tựa Việt | Xưng Đế Công Thành |
| Game gốc | **《攻城掠地》 Công Thành Lược Địa** (GCLD) — SLG Tam Quốc |
| NPH/đơn vị | Aoshitang (熬时堂) / Ujoy — domain `gcmob.ujoy.com`, `gcmob.aoshitang.com` |
| Package | `com.gpstore.xdctslg` · app-id `com.regin.gcld.vie.gcld` (`gcld`=攻城掠地, `vie`=tiếng Việt) |
| Engine | **Cocos2d-x + LuaJIT** (`libcocos2dlua.so`), toàn bộ gameplay bằng Lua |
| Phiên bản | game `8.9.0.6`, client `5.4.1.0`, build 2018-08-08 |
| Thể loại | SLG chiến thuật theo lượt bán tự động (server tính trận, client replay) |
| Bối cảnh | Tam Quốc; mở rộng cross-server chinh phục Cao Ly/Nhật Bản/Lưu Cầu/Nam Chiếu |

<!-- SECTION:METHODOLOGY -->
## 1. Phương pháp dịch ngược (tái lập được)

Đây là quy trình đã dùng, có thể lặp lại cho bất kỳ game Cocos-Lua nào:

1. **APK là ZIP** → `unzip`. Kiểm `lib/*/*.so` để xác định engine. Thấy `libcocos2dlua.so` ⇒ Cocos2d-x, gameplay nằm trong **script Lua** (không phải `.so`).
2. **Phân loại `assets/`** theo magic bytes: `1B4C4A0102` = **LuaJIT bytecode (stripped)**; `89504E47`/`FFD8` = ảnh; `3C3F786D` = XML; `43435A21` = CCZ.
   - Kết quả: **1115 file LuaJIT bytecode**, 1832 ảnh, 142 XML, 5 CCZ, 23 mp3.
3. **Tên file bị che = `md5(đường-dẫn-tương-đối + ".lua")`** (KHÔNG mã hoá nội dung). Xác minh: `md5("lua/common/json.lua") = f9108c27...` khớp file tồn tại.
4. **Decompile** bằng [`luajit-decompiler-v2`](https://github.com/marsinator358/luajit-decompiler-v2) (hỗ trợ stripped bytecode) → **1115/1115 thành công** trong ~3,5s. Bytecode là LuaJIT stock (không custom opcode).
5. **Dựng lại cây tên gốc**: gom mọi chuỗi `require("...")` trong code đã giải → tính `md5(path+".lua")` → map hash→tên → tái tạo `lua/game/battle/*.lua`… (698/1115 = 62% có tên; phần còn lại vẫn đọc được theo hash).
6. **Bảng bản địa hoá** `res/lang_zh_cn.lua` (giữ tên gốc nhưng nội dung đã Việt hoá) = từ điển `[textId]="tiếng Việt"`; mọi config chỉ chứa `textId` → tra bảng ra tên.

> Ghi chú then chốt: đây là SLG **server-authoritative**. Client chứa **UI, config trình bày, và "trình phát lại báo cáo trận"**; các **con số cân bằng cốt lõi (sát thương, chỉ số gốc) phần lớn ở server**. GDD này khôi phục *cấu trúc, luật, enum, quan hệ* — phần định lượng chi tiết ghi rõ "ở server" khi không có ở client.

<!-- SECTION:FOUNDATION -->
## 2. Nền tảng chiến trường, địa hình & mã chiến pháp (đã xác minh trực tiếp)

**Chiến trường** (`lua/game/battle/battleConstants.lua`):
- **12 hàng** (`BATTLE_ROW_NUM = 12`), hai phe: Công (`BATTLE_SIDE_ATTACK=1`) / Thủ (`BATTLE_SIDE_DEFENDER=2`).
- Trạng thái hoạt ảnh: `IDLE / MOVE / STACTICS(chiến pháp) / ATTSTATEGY / DEFSTATEGY / FIGHT`.
- Chế độ phantom/giao chiến: Thường(0) · Đột kích(1) · **Đơn khiêu**(dantiao,2) · **Hổ Báo Kỵ**(hubaoqi,20) · Cự Ly(4) · Tiên Chinh(5).

**6 loại địa hình** (`terrainType`, tra language):

| id | textId | Tên Việt |
|---|---|---|
| 1 | 190083 | Bình nguyên |
| 2 | 190084 | Đất rừng |
| 3 | 190085 | Vùng núi |
| 4 | 190086 | Thủy vực |
| 5 | 190087 | Thành trì |
| 6 | 190088 | Quan ải |

**Hệ mã ID chiến pháp gắn địa hình** (`getTacticsPicDetail`): cùng một tướng thi triển chiến pháp **khác nhau theo địa hình**. 3 loại gốc: Đột kích (190089) · Công kích (190090) · Phòng thủ (190091). Chi tiết đầy đủ ở §5.

**~40 loại trận** (`battleType`): ARMY, ARMIES, CITY, OCCUPY, PERSONAL/GROUP_MINE, NATION_RANK, BARBARIAN, DUEL, SCENARIO(kịch bản), + cross-server KF_WD/KFZB/KFGZ/KFYZ…

**Tài nguyên trong trận** (`BATTLE_RES_*`): bạc, gỗ, lương, thiết, exp, vàng, **nô lệ** (slave/enslave/slave_owner) + tiền tệ sự kiện (bánh trung thu, đồ Giáng Sinh, lì xì, vé thiết…).

<!-- SECTION:MODES -->
## 3. Chế độ chơi & PvE

- **Kịch bản** (`juben` 剧本, "Kịch bản"/"Phó bản"): chiến dịch PvE có bản đồ, hành quân (MarchingLayer), nhiệm vụ huấn luyện (DrillTask); chấm **5 sao/ải** ("Kịch bản qua ải: tất cả kịch bản đạt 5 sao"). Nhân vật kịch bản: A Đẩu, Lý Nho, Trương Phi…
- **Viễn chinh** (Expedition): chiếm tài nguyên đô thành; bản **liên server** "Chinh phục thiên hạ" mở rộng ngoài Trung Nguyên — **Cao Ly, Nhật Bản (Đông Doanh), Lưu Cầu, Nam Chiếu** (`lua/layer/kfyzWorld/config/road/*`).
- **Man tộc** (BARBARIAN), **Đơn khiêu/Đấu tay đôi** (DUEL/one2one), **Mỏ** cá nhân/liên minh, **Bảng xếp hạng quốc gia**.


---

# Phần II — Các hệ thống chi tiết (từ 6 luồng bóc tách song song)

## 4. Engine chiến đấu & luồng trận

### 1. Mô hình tổng quát: server tính, client replay

Trận đấu **hoàn toàn do server tính trước**, đóng gói thành một chuỗi "báo cáo trận" (battle report) dạng chuỗi text nhiều tầng phân tách bằng ký tự, rồi stream về client. Client **chỉ giải mã và replay** — không có bất kỳ logic tính sát thương, xác suất, hay AI targeting nào ở client.

- Điểm vào duy nhất: `fightLayer.lua:3413` `doBattleReport(reportStr)`. Chuỗi report tách theo `#` → mỗi block là một sự kiện; block đầu chứa `reportType|battleId`. Mỗi block sau parse bằng handler tương ứng và **đẩy vào `reportData[]`** (`fightLayer.lua:3578,3581`).
- Vòng lặp replay: `update(dt)` (`fightLayer.lua:3391`) mỗi frame gọi `doRound()` → lấy `reportData[1]`, biên dịch thành các bước hoạt ảnh trong `animData[]`, rồi `table.remove(reportData,1)` (`fightLayer.lua:3384`). Hàm `animation()` (`fightLayer.lua:2099`) tiêu thụ `animData[1]` tuần tự, chỉ chạy khi `state == BATTLE_STATE_IDLE` (`fightLayer.lua:3408`).
- Hai trạng thái replay: `BATTLE_STATE_IDLE = 0`, `BATTLE_STATE_ANIM = 1` (`uiConstant.lua:1-2`).
- Client **giữ toàn bộ report gốc** (`myReport`, `fightLayer.lua:3414-3415`) để tua lại/xem chậm.
- **Fast battle**: nếu report chứa event type `45`, bật `inFastBattleState`; chỉ giữ event 2/10/16/43/46 để nhảy nhanh tới kết quả (`fightLayer.lua:3429-3433,3576-3579`).

### 2. Vòng đời trận

| Giai đoạn | Ai điều khiển | Tham chiếu |
|---|---|---|
| **Chuẩn bị** | Client gửi `actions.battlePrepare` (terrain+battleType+targetId); server trả tướng 2 phe, terrain, side | `control.lua:580-641` |
| → Panel chuẩn bị | `showPerparePanel(attGenerals, defGenerals)` | `control.lua:633` |
| → Đang trận / xem trực tiếp | `watchBattle`/`watchKfgz`; có sẵn `battleReport` thì vào thẳng | `control.lua:618-626,1183-1184` |
| **Chiến đấu** | `enterFigth(report)` → `fightControl:clearup()/init()` → `doBattleReport(report)` | `control.lua:811-822` |
| **Kết quả** | Event 7 sinh anim `result`; event 31 sinh anim `over` mang `lastResult` | `fightLayer.lua:2545-2549,2713-2719` |

Loại trận (`battleType`, `battleConstants.lua:123-155`): quân đơn(1)/đa quân(2)/công thành(3)/chiếm(4)/tự động(5)/mỏ(6-7)/liên server (KFWD 30, KFZB 31, KFGZ 1025...), kịch bản(18-20), song đấu(16), demo(-1). State liên server `kfwdState`/`kfzbState` = prepare/fight/result/... (`battleConstants.lua:222-235`).

### 3. Bố cục chiến trường

- **12 hàng** (`BATTLE_ROW_NUM=12`), phe `ATTACK=1`/`DEFENDER=2`, nhãn `"att"/"def"/"ob"(quan sát)` (`battleConstants.lua:1-3,104-106`).
- Hàng 0 là "cửa", hàng 1..12 xếp chéo hai bên; att trái, def phải (`fightController.lua:37-60`).
- **Dồn hàng khi chết**: `getMovePosition` tìm ô trống gần nhất 0→12 (`fightController.lua:86-105`); `startFight` dịch army hàng sau lên (`fightLayer.lua:745-779`).
- **Xếp lính trong 1 nhóm (3×3)**: 7 pattern `troopPattern[1..7]` + biến thể `zhoutai1/2/3` (Chu Thái) (`uiConstant.lua:73-243`); z-order khác nhau att/def (`uiConstant.lua:39-72`).
- Địa hình quyết định biến thể chiến pháp qua `getTacticsPicDetail` (`battleConstants.lua:262-290`).

### 4. Từ vựng hành động — reportHandler event types

Dispatch: `fightLayer.lua:3458-3558`. Handler = `reportHandler/<n>.lua`.

| # | Ý nghĩa | Tham chiếu |
|---|---|---|
| 2 | **Khởi tạo/nạp đội hình** — army 2 phe (row, playerId, troopType, tacticsId, HP list, chỉ số mở rộng: giác tỉnh, xung phong, main, phantom đặc biệt, jueEquip, atk/def, kháng, xe, khiên) | `2.lua`, `:2528-2535` |
| 3 | **Kết quả 1 lượt cận chiến** — attRow/defRow, danh sách chết (cờ né `ms`/bạo kích `bj`), số chết/hàng, thứ tự đánh | `3.lua`, `:2536-2544` |
| 7 | **Bảng kết quả trận** — thắng/thua, %, killNum/loseNum, killGeneral, thưởng res/item/building, tướng bị bắt, tên thành | `7.lua`, `:2545-2549` |
| 8,11,15,18,20,28,29 | **No-op** (đồng bộ, không hoạt ảnh) | — |
| 10 | **Nạp/bổ sung army** + `teamEffect` (tiếp viện giữa trận) | `10.lua`, `:2552-2559` |
| 12 | **Song đấu 1v1 tướng** | `12.lua`, `:2562-2563` |
| 13 | **Cập nhật danh sách tướng 2 phe** (join/rời, forceId) | `13.lua`, `:2564-2565` |
| 14 | **Thi triển chiến pháp (lõi)** — stategyShow att/def (type, thành công, tacticsId, bị hoá giải `beHold`, chiến pháp kế), tổn thất/hàng, stunBuff, khiên, Gia Cát "nghịch thiên cải mệnh" (`retry`), Chu Du hoả công | `14.lua`, `:2566-2652` |
| 16 | **Cập nhật panel người chơi/tướng** — lv, hp, killNum, lực, buff | `16.lua`, `:2655-2659` |
| 19 | **Thưởng EXP tướng** (lvup, rewards) | `19.lua`, `:2662-2666` |
| 25 | **Bảng chiến pháp quân đội** `amryTactics[row]=tacticsId` | `25.lua`, `:2669-2670` |
| 26 | **Đếm ngược lượt / trụ tên** — roundTimeCost, towerBlood, số sét | `26.lua`, `:2671-2698` |
| 27 | **Panel chọn chiến pháp** (3 lựa chọn, cờ isChaos/isSurround/isMelee/isWoman) | `27.lua`, `:2699-2703` |
| 30 | **Chết theo hàng** (attDeadRow/defDeadRow) — anim `dead` | `30.lua`, `:2708-2712` |
| 31 | **Kết thúc trận** — anim `over` | `31.lua`, `:2713-2719` |
| 32 | **Trụ tên bắn (phòng thủ)** — CD, độ bền (`battleTower.FANGJIAN`) | `32.lua` |
| 33 | **Máy bắn đá phá trụ tên** (`POHUAI`) | `33.lua` |
| 34 | **Phóng hoả** (fireNum) — anim `fire`+`fire_troops` | `34.lua` |
| 35 | **Trụ tên pháo kích** (`PAOJI`) | `35.lua` |
| 36 | **Tướng giác tỉnh** — anim `GeneralJuexing` | `36.lua` |
| 37 | **Đẩy lùi** (jiTui) | `37.lua` |
| 38 | **Xe phích lịch (pili) nổ** — carId, stunBuff | `38.lua` |
| 39 | **Đánh dốc/lăn đá (slope)** | `39.lua` |
| 40 | **Chiến pháp đồ thành** (`BATTLE_TUCHENGH`) | `40.lua` |
| 41 | **Lữ Bố tự bạo** (`BATTLE_LVBUZIBAO`) | `41.lua` |
| 42 | **Hoả thần/Chúc Dung hoả công** | `42.lua` |
| 43 | **Chiến pháp (biến thể 14)** + mê hoặc `meihuoLine`, bạo kích `bsPro` | `43.lua` |
| 44 | **Tổng kết tổn thất 2 phe** | `44.lua` |
| 45 | **Cờ fast-battle** | `45.lua` |
| 46 | **Chết theo hàng (nhanh)** | `46.lua` |
| 47 | **Cập nhật chỉ số army/hàng** (hp, shield, atk, def, zfShield, carHp) | `47.lua` |
| 48 | **Tuân Úc "Dạ hoả phá trận"** | `48.lua` |
| 49 | **Hoả kế** (`BATTLE_HUOJI`) | `49.lua` |
| 50 | **Cập nhật uy hiếp** (deterUpdate) | `50.lua` |
| 51 | **"Quân lâm thiên hạ"** | `51.lua` |
| 52 | **Bộ khúc theo hàng** (buQuArray) | `52.lua` |
| 53 | **Vây/đột phá** (surround, slam, slamCd) | `53.lua` |
| 54 | **Chiến pháp động** (id 8000+n) | `54.lua` |
| 55 | **Khiên xe (car shield)** | `55.lua` |
| 57 | **"Chế hành" khiên** (Tôn Quyền) | `57.lua` |
| 59 | **Sét đánh** | `59.lua` |

**Thứ tự ưu tiên hoạt ảnh** `fightPriority` (`fightController.lua:3-35`): map reportType→priority (2→1, 3→6, 7→22, 10→7, 12→2, 14→4, 16→5).
Handler **17,21-24,56,58 KHÔNG tồn tại** (chưa dùng/bỏ).

### 5. Chế độ giao chiến / "ảo ảnh" (phantom)

`BATTLE_PHANTOM_TOTAL=5` (`battleConstants.lua:5-11`):

| Hằng | Giá trị | Việt |
|---|---|---|
| NORMAL | 0 | Giao chiến thường |
| TUJI | 1 | Đột kích |
| DANTIAO | 2 | Đơn khiêu (1v1) |
| JULI | 4 | Cự ly (từ xa) |
| XIANZHENG | 5 | Hãm trận |
| HUBAOQI | 20 | Hổ Báo Kỵ |

"Phantom" = **ảo ảnh/quân sao chép** tăng viện (text 190092: "Tốn Vàng chiêu gọi 1 ảo ảnh giúp chiến đấu"). Tạo bằng `actions.copyArmy` / `actions.kfgzBuyPhantom`; hạn mức `freePhantomCount`/`phantomMax`/`remainBuyPhantom` (`control.lua:1013,1056,1227-1302`).
Hành động chủ động khác: `actions.tujin`(đột tiến), `quitBattle`(rút lui), `youdi`(du kích), `battleUserStrategy`(chiến pháp thủ công), `autoStategy`/`canselAutoStategy`, `joinBattle`.

### 6. Cơ chế Surround (vây / phong tỏa)

- Event 53: `surround`, `slam`, `slamCd`; `slamCd` đếm ngược thời gian thực (`Surround.lua:412-423`).
- 3 trạng thái: **Bao vây** (text 214704/214702: "cứ 5 hiệp chịu/tạo sát thương, không thể dùng chiến pháp"); **Phong tỏa** (214705/214701: "binh lực phe công >5× phe thủ → phong tỏa"); **Đột phá phong tỏa** (214703/214706).
- Hiệu ứng: cung bao vây bay Bézier 1.5s; icon `bwqh_icon_bw.png`/`_fs.png` (`Surround.lua:161-353`).

### 7. HP bar, hoạt ảnh, hằng số lộ ở client

- **ANIM_STATE_** (`battleConstants.lua:107-112`): IDLE=1, MOVE=2, STACTICS=3, ATTSTATEGY=4, DEFSTATEGY=5, FIGHT=6.
- **Thời gian di chuyển** `BATTLE_ARMY_MOVE_TIME=0.8` (0.12s khi tua nhanh); Điêu Thuyền múa 0.8/0.03s.
- **Mã né/bạo kích trong report 3**: tiền tố `ms`(né→ -100000000), `bj`(bạo kích→ -200000000-dmg) — "ngôn ngữ" server báo cho client (`3.lua:255-275`).
- Chỉ số army mở rộng (report 2/10/12): `isJuexing`(giác tỉnh), `isChongfeng`(xung phong), `isMain`, `specialPhantom`+`xianzhengNum`, `jueEquip`, `attack/defense`, `resistPercentage`(kháng), `carId`, `bigGzNum`, `bsPro`(bạo kích%), `zfShield`, `chaosState`(hỗn loạn) (`2.lua:38-208`).
- `basicTaticsById` (`battleConstants.lua:156-199`): 1xxxxxx→Đột kích, 3xxxxxx→Công kích, 2xxxxxx→Phòng thủ; tên qua `getTacticsName` (400022-400027).
- Hằng chiến pháp đặc biệt (`uiConstant.lua:244-296`): SIMAYI_FANTAN=1001, ZHUGELIANG_BAGUA=20001, ZHOUYUJX_FIRE2=50001, BATTLE_TUCHENGH=30001, BATTLE_LVBUZIBAO=40001, XUNYU_YEHUOPOZHEN=60001, BATTLE_HUOJI=70001, TEN_JUNLINTIANXIA=80001, CARSHILED=90001, ZHIHENG=90002/3, LIGNTNING=90004; trụ tên `battleTower.FANGJIAN=10001/PAOJI=10003/POHUAI=10004/BOMB=10010-13`.

### Nằm ở server / chưa rõ

- **Toàn bộ công thức chiến đấu**: sát thương, xác suất né/bạo kích, targeting, điều kiện & số lần kích hoạt chiến pháp, hệ số địa hình (gia thành), kháng, khiên — client **chỉ nhận kết quả đã tính**.
- **Quy tắc "chết theo hàng"**: client chỉ vẽ hàng chết + dồn hàng (event 30/46); logic ở server (khớp memory: chết-theo-hàng là chủ ý thiết kế).
- **AI/rule-engine targeting**: không ở client; chỉ thấy `amryTactics[row]=tacticsId` là kết quả gán.
- **Điều kiện Surround** (>5× binh lực): tính ở server.
- **Sinh phantom**: client chỉ gửi request; số lượng/chỉ số do server.

---

## 5. Binh chủng, quân đội & đội hình

> Logic sát thương/hệ số khắc chế/chỉ số gốc do **server** giữ; client chỉ hiển thị và gửi request.

### 1. Ba tầng khái niệm binh chủng (đừng lẫn)

**a) Ba chiến thuật khắc chế (lõi combat — "kezhi")** — `battleConstants.lua:156-199,242-260`. Mã hoá ở chữ số đầu của `basicTaticsById`:

| Mã đầu | Chiến thuật | textId |
|---|---|---|
| `1xxxxxx` | **Đột kích** (tuji) | 190089 |
| `2xxxxxx` | **Phòng thủ** (fangshou) | 190091 |
| `3xxxxxx` | **Công kích** (gongji) | 190090 |

**b) Ba binh chủng danh nghĩa (dùng trong tech/thức tỉnh khắc chế)** — `490729` **Bộ binh**, `490727` **Kỵ binh**, `490728` **Cung thủ**; mỗi loại có kỹ năng "Khắc chế … lv%s". **Binh công thành/khí giới** không phải class riêng mà là tướng chuyên (vd `220134` Hoa Hùng "binh công thành"); cờ `hasCar` (`army.lua:63`) đổi rig sang loại 5.

**c) `troopType` (biến thể unit hiển thị)** — card tướng kẹp 1–9 → icon `troop_1..9.png` (`generalCard.lua:298-303`); trong battle là enum chi tiết 16–60 ánh xạ về **7 rig animation** (`army.lua:62-170`). Binh đặc biệt trong text: **Hổ Báo Kỵ** (135211/215502), Tây Lương, Bạch Mã. Loại "jiebing/phantom" 6 kiểu (`battleConstants.lua:5-11`).

### 2. Quan hệ khắc chế (kezhi)

Tam giác chiến thuật (`220050/220051`, **không có hệ số trong client**):

| Bên tấn công | Khắc chế | Bị khắc bởi |
|---|---|---|
| **Đột kích** | Công kích | Phòng thủ |
| **Công kích** | Phòng thủ | Đột kích |
| **Phòng thủ** | Đột kích | Công kích |

- Khắc chế **binh chủng** (Bộ/Kỵ/Cung) là **buff theo cấp** từ **Thức tỉnh tướng** + công nghệ (`490727/490728/490729`), không cố định theo đơn vị.
- **Địa hình** chồng lên: 6 loại `190083-190088`. Chiến pháp có biến thể theo địa hình (`getTacticsPicDetail`): Đột kích Bình nguyên/Vùng núi/Thành trì; Phòng thủ Vùng núi/Thủy vực; Công kích Bình nguyên/Thủy vực/Thành trì. **Hệ số cụ thể → server.**

### 3. Chỉ số binh chủng (client giữ được)

Client **không** giữ atk/def/hp/speed/range gốc (đều server). Card tướng chỉ hiển thị (`generalCard.lua:89-343`): **Binh lực** hiện/tối đa = `armyHp/armyHpMax` (đây là "HP quân" của tướng), Lv, quality (màu ~1–6), icon binh chủng, cờ chủ tướng `isZhujiang`. Text: `82004/101007` "Giới hạn dẫn binh +%s Binh lực/**phương trận**".

### 4. Thành phần đội / quân đoàn & xếp hàng

**Đội (team)** — `showTeamCostPanel.lua`, `showJoinTeamPanel.lua`: số tướng `curNum/maxNum` (vd "3/5"); trần `generalMaxNum` **do server**. Chi phí đội: `teamExp`, `gold` (phí triển khai), `inspireCost` (cổ vũ/sĩ khí), `orderGold`, `totalForces`. **Chủ tướng vs phó tướng**: phó gắn `chiefId` trỏ chủ; ước lượng trần đội ≈ 8 (5 chủ + phó khi `deputyOpen`) — con số cứng ở server.

**Xếp hàng 12 hàng** (`BATTLE_ROW_NUM=12`): z-order = `12 - row` → hàng sau phủ hàng trước (`fightLayer.lua:472,493`). Ô đứng tướng dùng tag CENTER/LEFT/RIGHT (`army.lua:4-6`). Chiến pháp thức tỉnh nhắm "N hàng địch" (490725=4 hàng, 490702=3 hàng, 490726=5 dãy) → xác nhận combat theo hàng.

**Quân đoàn (corps)** — `CorpsPanelNew.lua`: gồm danh sách **tướng** + danh sách **jiebing/phantom** (lính vô danh thành viên góp). Đóng góp `selfDonationNum` (upper/lowerLimit), yêu cầu quan phẩm (vd `218123` "Quan tứ phẩm trở lên"). **Trần thành viên → server.**

### 5. Huấn luyện / sản xuất binh

- **Luyện binh hằng ngày (dayTrain)** — `dayTrain/ui.lua`: bấm tướng → trừ 1 lượt, nhận **EXP** chia cho binh; có "Huấn luyện miễn phí", "Tỉ lệ nhân EXP", "Tiêu hao: Gỗ". Số lượt/ngày → server.
- **Mộ binh (bổ sung quân cho tướng)** — `generalPanel.lua`: `mubing()` (mộ thường) / `jiasumubing()` (tăng tốc tốn Vàng); lệnh `general@startRecruitForces`. Đang mộ binh thì tướng không ra trận.
- **Chế độ sản lượng (outputMode)** — `outputMode/choosePanel.lua`: mua buff sản lượng theo 5 loại `resType` **1=Bạc, 2=Gỗ, 3=Lương, 4=Sắt, 5=Binh**; riêng Binh chỉ 2 mốc thời gian.
- Nơi sản xuất: doanh trại / khu tài nguyên `resourceArea2/`.

### 6. Nâng cấp binh chủng / mở khoá công nghệ

- **Qua nghiên cứu công nghệ**: `220457` "Tất cả binh chủng tăng cấp!… **Mã Đạo**…", `220548` "binh chủng lên lv2, chiến lực tăng". Tech tree trạng thái UNOPENED/READY/OPENED/INVESTED/RESEARCHING/EFFECTED (0-5).
- **Khắc chế binh chủng theo cấp** (buff): từ Thức tỉnh + tech; nhóm buff công/thủ/HP vĩnh viễn `490715/490716/490717`.
- Binh đặc biệt mở theo LV/sự kiện: `1210904` "Đủ LV220 tăng Hổ Báo Kỵ".

### Nằm ở server / chưa rõ

- **Hệ số khắc chế** (3 chiến thuật & Bộ/Kỵ/Cung) — client chỉ có tên + tam giác, không có số nhân.
- **Chỉ số gốc binh chủng** (atk/def/hp/speed/range) — server.
- **Trần cứng**: số tướng/đội, số phó tướng, giới hạn "binh lực/phương trận", quy mô quân đoàn — server.
- **Bảng huấn luyện/sản xuất**: chi phí, thời gian, số lượt/ngày, tốc độ mộ binh, sản lượng — server.
- **Danh sách `troopType` 16–60 → tên binh chủng** — không có bảng tên trong client.

---

## 6. Hệ thống Tướng

> **Tướng = một phương trận binh lính**: chỉ số tướng quyết định lượng binh mang theo và sức chiến; "máu" tướng chính là quân số (`forces`). Toàn bộ tính toán (giá chiêu mộ, tỉ lệ rơi, phẩm chất, thăng cấp) ở **server**.

Panel tướng 6 tab (`general/ui.lua:32-149`): **Tướng lĩnh** · **Đổi trang bị** · **Quán rượu** (chiêu mộ) · **Yến hội** · **Nhà tù** · **Thuật sĩ**.

### 1. Thuộc tính tướng (`generalPanel.lua`)

| Field | Ý nghĩa | Nhãn |
|---|---|---|
| `leader` | **Thống suất** (dẫn binh) | "Thống %s" (82011) |
| `strength` | **Vũ lực / Dũng** | "Dũng %s" (82013) |
| `att` / `def` | Tấn công / Phòng ngự | 82005 / 82006 |
| `fMax` | HP tướng (cộng thêm) | "Võ tướng HP：%s" (490720) |
| `forces`/`forcesMax` | Quân số / **Giới hạn dẫn binh** (= máu phương trận) | 82007 |
| `generalLv`/`generalExp` | Cấp / kinh nghiệm | — |
| `troopType` | Binh chủng (1-9) | icon `troop_%d.png` |
| `quality` | Phẩm chất (1-6) | tô màu tên |

Chi tiết công/thủ tách phần phụ: Cường công (490704), Cường tráng (490705), Cường phòng (490706), Khống chế (490707).

### 2. Phẩm chất (6 bậc, `data/color.lua`)

| Bậc | Code | Việt |
|---|---|---|
| 1 | White | Trắng (thường) |
| 2 | Blue | Lam |
| 3 | Green | Lục |
| 4 | Yellow | Vàng/Kim |
| 5 | Red | Đỏ |
| 6 | Violet | **Tím** (cao nhất) |

Bậc 0 = xám (tử trận/vô hiệu). Quán rượu có toggle "**Chỉ mộ tướng Tím**" (83045). **Không có hệ "sao" riêng cho tướng** ở client (biểu tượng sao chỉ đếm dòng thuộc tính **trang bị**).

### 3. Thức tỉnh (Juexing / 觉醒) — trục tiến hoá chính

Không có bảng nâng sao/tiến giai cổ điển; cơ chế cốt lõi là **Thức tỉnh** (`general.evoke`: 0=khoá, 1=mở được, 2=đã thức tỉnh).
- **Mở**: `actions.openEvoke` → "chỉ mặc bộ trang bị nhưng có cơ hội nhận kỹ năng thức tỉnh cực mạnh" (490701).
- **Nâng cấp** (`callJuxing`) tiêu vật liệu tùy `evokeType` 0-6: Vàng/Gem/Đá/Rượu 2302/Rượu Đỗ Khang/**Rượu Gia Cát** (riêng tướng 269)/jrcl.
- **Thành quả**: cộng vĩnh viễn Công/Thủ/HP (trần `evokeAttMax/DefMax/HpMax`), buff tạm `evokeBuff`, và **4 kỹ năng nhỏ + 1 đại kỹ năng thức tỉnh** (`GENERAL_JUEXING_SKILL_MAX=5`). Icon thuộc tính: thống suất, HP, khắc bộ binh, công thành.
- **Quà "Tơ lụa" thức tỉnh**: mở **bảo vật chuyên thuộc** theo tướng (Tiêu Vĩ Cầm/Điêu Thuyền, Khổng Minh Đăng/Gia Cát…).

### 4. Kỹ năng ký danh & thức tỉnh cực mạnh (`uiConstant.lua:244-265`)

| Hằng | Tướng | Kỹ năng cực mạnh | Text |
|---|---|---|---|
| SIMAYI_FANTAN=1001 | Tư Mã Ý | Phản Đàn | — |
| ZHUGELIANG_BAGUA=20001 | Gia Cát Lượng | **Bát Quái Trận** (né lớn) + "Gặp Dữ Hoá Lành" | 490730 |
| ZHOUYUJX_FIRE2=50001 | Chu Du | **Xích Diệm Mê Trận** (4 hàng + hỗn loạn) | 490725 |
| DIAOCHAN_DANCE=32 | Điêu Thuyền | Vũ điệu (Long Phượng Mỹ Nhân) | — |
| CAOCAO_HAOLINGTIANXIA=35 | Tào Tháo | **Hào Lệnh Thiên Hạ** (thét binh địch ra thành) | 490721 |
| BATTLE_LVBUZIBAO=40001 | Lữ Bố | **Tự Bạo** (đánh 5 hàng; xông pha 80/50/20% HP; miễn Chạm/Trảm) | 490726 |
| XUNYU_YEHUOPOZHEN=60001 | Tuân Úc | Dạ Hoả Phá Trận | — |
| TEN_JUNLINTIANXIA=80001 | (Thập) | **Quân Lâm Thiên Hạ** (mỗi %s hiệp thả 1 lần lên tướng địch) | 215923 |
| ZHIHENG=90002/3 | Tôn Quyền | Chế Hành | — |
| BATTLE_HUOJI=70001 | (kho) | **Hoả Kế** (đốt 5 hàng trước phe công) | 490126 |

**Thiên phú / Địa hình** (`general.terrain`, bị động): Bình nguyên (81109), Sơn địa (81110), Thủy vực (81111), Thành trì (81112); "%sLực chiến +%d%%" (81012). **Buff khắc chế binh chủng**: Khắc Kỵ (490727)/Cung (490728)/Bộ (490729). Có **buff liên kết** giữa tướng đã thức tỉnh (vd Gia Cát đấu Triệu Vân đã thức tỉnh → ghép 3 quẻ).

### 5. Trang bị gắn tướng (8 loại, `constant.lua:15-23`)

1=Vũ khí, 2=Ngựa, 3=Giáp, 4=Áo choàng, 5=Binh phù/cờ, 6=Cờ, 7=Bảo vật, 8=Bộ (suit). Mỗi món có `quality`, `refreshAttribute[]` (dòng thuộc tính đếm bằng "sao"), `maxLv`. Bảo vật cộng Thống/Dũng, yêu cầu tướng Lv.35. Thêm: Bảo vật ngự tứ, Huân chương (2 ô), Bộ đồ tập hợp (Chân/Cực Khu Hổ, Bá Hạ, Trúc Long, Phụng Hoàng, Linh Quy).
**Phó tướng**: gắn tướng phó (`chiefId/isChief`), binh lực phó cộng dồn vào chủ.

### 6. Chiêu mộ (Quán rượu / Tavern)

**Hai loại**: `wujiang=2` (**Võ tướng** — chỉ số + chiến pháp) và `wenguan=1` (**Văn Quan** — kế sách, chỉ mở khi `isOpenWenguan`).
- Grid tối đa **5 thẻ**; mua từng thẻ (không có 1-lần/10-lần) → `recruitGeneral`.
- **Làm mới** `refreshGeneral`: "Miễn phí tạo mới" khi hết CD; còn CD dài → "Xoá" CD bằng **Vàng**. Khoá/mở khoá thẻ tránh bị làm mới.
- Toggle "Chỉ mộ tướng Tím"; Sa thải `fireGeneral`.
- **gainGeneral** (cốt truyện): tướng trao qua nhiệm vụ/mua vé (Trương Lương, Hoa Hùng, Tuân Úc, Cam Ninh/Hạ Hầu Đôn/Chúc Dung dạng "Chân X").

### 7. Danh sách tướng trích được (id → tên)

| ID | Tướng | ID | Tướng | ID | Tướng |
|---|---|---|---|---|---|
| 103 | Chu Du★ | 205 | Mã Siêu | 267 | Khương Duy |
| 107 | Tào Tháo | 206 | Thái Sử Từ | 268 | Tư Mã Ý |
| 110 | Lục Tốn | 207 | Hứa Chử | 269 | Gia Cát Lượng★ |
| 201 | Lữ Bố★ | 208 | Điển Vi | 270 | Hạ Hầu Đôn★ |
| 202 | Trương Phi★ | 211 | Hoàng Trung | 271 | Tào Nhân |
| 203 | Quan Vũ★ | 218 | Nguỵ Diên | 273 | Hạ Hầu Uyên |
| 204 | Triệu Vân★ | 224 | Chu Thái★ | 274 | Tôn Quyền |
| 230 | Cam Ninh★ | 266 | Điêu Thuyền | 275 | Hoàng Nguyệt Anh★ |

(★ = có nhánh thức tỉnh riêng.) Bổ sung trong `generalBustMap.lua`: văn quan (Phượng Kỷ, Quách Tự, Điền Phong, Tuân Du…), võ tướng (Hàn Toại, Hoàng Quyền, Lý Thôi, Tang Bá…), Đổng Trác, Chúc Dung, Trương Giác, Lưu Chương.

### Nằm ở server / chưa rõ

- **Toàn bộ số liệu**: bảng chỉ số gốc theo phẩm chất/cấp, đường cong EXP, giá chiêu mộ, **tỉ lệ rơi/pool phẩm chất**, trần thức tỉnh, chi phí vật liệu — client chỉ nhận `arg.action.data`.
- **Bảng tên tướng** & data tĩnh `getSData("tactic"/"evoke_skill"/"evoke_general")` — nạp runtime.
- **"Bổ nhiệm quan" (applyOfficer) KHÔNG phải gán tướng vào chức** — thực chất là duyệt/từ chối người chơi khác xin trấn giữ (`occupy@*`). Hệ "tướng→chức vụ→buff" thật (nếu có) nằm ở protocol `nation@`/`office` riêng.
- Hệ **sao (xingji)** cho tướng: không thấy ở client.

---

## 7. Chiến pháp & Nộ khí

> Client chỉ là **trình phát lại (renderer)** — toàn bộ *tính toán* chiến pháp (trúng/né, sát thương, tích nộ, phản chiến) ở **server**, đẩy về qua `report`. Client giữ: (1) quy tắc đánh số ID để chọn icon/animation, (2) danh mục kỹ năng tướng ký danh → animation, (3) bảng textId.

### 1. Giải mã quy tắc ID chiến pháp cơ bản (số 7 chữ số)

Cấu trúc `L TT V A ..` — `battleConstants.lua:242-340`, `army.lua:804-816`:

| Vị trí | Ý nghĩa | Giá trị |
|---|---|---|
| 1 (đầu) | **Loại** | 1=Đột kích, 2=Phòng thủ, 3=Công kích |
| 2-3 | **Địa hình** (ở biến thể) | 00=cơ bản; 11=bình nguyên; 21=vùng núi; 31=thủy vực; 41=thành trì |
| 4 | Nhóm biến thể | 0=cơ bản, 1=địa hình |
| 5 | Chỉ số phụ (cấp/thứ tự) | 1→5 |

**3 chiến pháp gốc**: `1000130` Đột kích (190089) · `3000110` Công kích (190090) · `2000120` Phòng thủ (190091).

**Biến thể theo địa hình** (mỗi loại 5 ID liên tiếp → 1 sprite):

| Dải ID | Nghĩa |
|---|---|
| 1110131–1110531 | Đột kích **Bình nguyên** |
| 1210133–1210533 | Đột kích **Sơn địa** |
| 1410132–1410532 | Đột kích **Thành trì** |
| 3110113–3110513 | Công kích **Bình nguyên** |
| 3310111–3310511 | Công kích **Thủy vực** |
| 3410112–3410512 | Công kích **Thành trì** |
| 2210121–2210521 | Phòng thủ **Sơn địa** |
| 2310122–2310522 | Phòng thủ **Thủy vực** |

> **"jiacheng" (gia thành = bonus):** `getTacticsPic` gộp mọi biến thể địa hình vào sprite chung `tujijiacheng`/`fangshoujiacheng`/`gongjijiacheng` — tức bản **được cộng thêm nhờ khớp địa hình**. `showTacticsWinEffect` (`army.lua:845-880`) chỉ phát anim "thắng đặc biệt" khi dùng **đúng biến thể địa hình**; bản gốc `x000xx0` không có.

6 địa hình: 190083 Bình nguyên · 190084 Đất rừng · 190085 Vùng núi · 190086 Thủy vực · 190087 Thành trì · 190088 **Quan ải** (bảng Việt dịch nhầm "Đóng thẻ" từ 关卡).

### 2. Phân loại chiến pháp

1. **Cơ bản (3 gốc):** Đột kích / Công kích / Phòng thủ — khắc chế vòng tròn (hint UI `tacticsLayer.lua:196-238`).
2. **Biến thể địa hình ("jiacheng"/bonus):** cùng loại khớp địa hình → icon bonus + hiệu ứng thắng đặc biệt.
3. **Kỹ năng tướng ký danh (chiến pháp NỘ):** xem §4.

### 3. Cơ chế "cùng tướng, khác chiến pháp theo địa hình"

- Trước mỗi hiệp, **server** đẩy **report 27** mở bảng chọn chiến pháp: 3 lựa chọn `id1/id2/id3` + cờ `recommend` (server gợi ý ID tối ưu cho địa hình) + `strategy` (nút nộ).
- `createTacticsLayer` (`tacticsLayer.lua:46-75`) gọi `getTacticsPicDetail(id1/id2/id3)` → **3 icon biến thể địa hình khác nhau** cho cùng đội. Bấm → `battleUserStrategy`/`kfwdUsest`/`kfgzUseTactic`.
- Địa hình lấy từ `terrainType` (text "Địa hình:" = 190107). Cùng tướng ở bình nguyên nhận bộ ID `11x`, ở thành trì nhận `41x`… → **danh sách chiến pháp chọn được thay đổi theo bãi chiến.**

### 4. Kỹ năng tướng ký danh (chiến pháp NỘ)

Hằng số `uiConstant.lua:244-265`; animation `stategyEffect.lua:12-56`; chữ hiển thị `stategyEffect.lua:482-530`:

| Hằng | Tướng / Tên | Phân loại hiệu ứng |
|---|---|---|
| SIMAYI_FANTAN=1001 | Tư Mã Ý – Phản Đàn | **Phản chiến** (bật chiến pháp địch trả lại) |
| ZHUGELIANG_1=27 / _4=26 | Gia Cát Lượng – Bát Quái Trận | **Khống chế/né + sấm** (loạt sét 3-4 hàng) |
| ZHOUYUJX_FIRE=31 / FIRE2=50001 | Chu Du – Hoả công / Xích Diệm Mê Trận | **Sát thương lửa 4 hàng + hỗn loạn** |
| DIAOCHAN_DANCE=32 / _STATEGY=45 | Điêu Thuyền – Khuynh Quốc (Vũ) | **Khống chế/mê hoặc** (logic `beHold`) |
| MENGHUO_STATEGY=50 | Mạnh Hoạch – Ất Mộc (Man binh) | **Buff/triệu hồi** |
| CAOCAO_HAOLINGTIANXIA=35 | Tào Tháo – Hào Lệnh Thiên Hạ | **Buff toàn quân** |
| BATTLE_TUCHENGH=30001 | Đồ Thành (thần kỹ) | **Kết liễu + phá thành** |
| BATTLE_LVBUZIBAO=40001 | Lữ Bố – Tự Bạo | **Sát thương cảm tử** |
| XUNYU_YEHUOPOZHEN=60001 | Tuân Úc – Dạ Hoả Phá Trận | **Sát thương/phá trận** |
| BATTLE_HUOJI=70001 | Hoả Kế | **Sát thương lửa** |
| TEN_JUNLINTIANXIA=80001 | Quân Lâm Thiên Hạ | **Debuff định kỳ lên tướng địch** |
| CARSHILED_EFFECT=90001 | Xa Thuẫn (khiên xe) | **Buff phòng ngự** |
| ZHIHENG=90002/90003 | Tôn Quyền – Chế Hoành (att/def) | **Buff/khống chế 2 chiều** |
| LIGNTNING=90004 | Sấm sét | **Sát thương diện rộng** |

**Kỹ năng thức tỉnh (juexing) riêng** (`stategyEffect.lua:634-682`): Quan Vũ thức tỉnh → **Võ Thần Giáng Lâm** (490702: 3 hàng đầu địch còn 1 HP); Chu Thương → Thiên Khiển (220150). Cờ `strategy.juexing` bật nút kỹ năng thức tỉnh.

**Tháp thành / vũ khí công thành** (`battleTower`, `uiConstant.lua:270-296`): FANGJIAN=10001 (bắn tên), PAOJI=10003 (pháo kích), POHUAI=10004 (phá huỷ), SMOKE/BOMB — đẩy từ report 32/33/35.

### 5. Nộ khí (rage) — cơ chế

- **Nút nộ = `strategy` trong report 27**: `strategy.useAble` (số lần còn dùng), cờ `isChaos`/`isSurround`/`isMelee`/`isWoman`, `juexing`.
- Nút nộ chỉ hiện khi `useAble > 0` (`tacticsLayer.lua:89`, **server đã quyết nộ đủ ngưỡng**); `useAble > 1` hiện số lần.
- **Vô hiệu**: `isChaos` (hỗn loạn) hoặc `isWoman` (nữ tướng hạn chế) → disable + xám.
- **Kích hoạt & phát nộ = report 14** (mirror 43) — `stategyShow` cho 2 phe: `type` (1=att/2=def strategy), `succ` (trúng?), `tacticsId`, **`showTacticsId`** (kỹ năng nộ/animation ký danh), `beHold` (0-3 trạng thái phản/giữ), `nextTacticId` (**chiến pháp chuỗi kế**), `luanwu` (buff **Loạn Vũ** — tăng mạnh sát thương chiến pháp, 320350).
- **`beHold` điều khiển thứ tự phát & phản chiến**: `beHold==0` → chiến pháp có hiệu lực; `beHold` 2/3 → phe bị **phản/giữ**, anim phe phản phát trước; `beHold` 1/3 → animation "đỡ/didang".
- Text nộ: 190104 "Giải phóng pháp chiến rồi", 190106 "Võ tướng không tham chiến". Một số phó bản **cấm toàn bộ nộ** (136422/136424) để cân bằng.

### 6. Các TAG hiệu ứng (`stategyEffect.lua:1-5`)

| TAG | Giá trị | Ý nghĩa |
|---|---|---|
| TAG_STATEPY_EFFECT | 2 | Node animation chính của chiến pháp nộ |
| TAG_SPEED_EFFECT | 3 | Hiệu ứng tốc độ/xông tới |
| TAG_STATEPY_EFFECT_ADD | 4 | Animation phụ trợ (tên/pháo tháp thành) |
| TAG_STATEPY_TEXT | 6 | Sprite chữ tên chiến pháp |
| TAG_WEAK_TEXT | 7 | Nhãn "bị suy yếu" (isWorldFightWeaken) |
| TAG_TACTICS_STRATEGY | 100 | Nút kỹ năng nộ trên bảng chọn |

### Nằm ở server / chưa rõ

- **Toàn bộ giá trị số**: ngưỡng tích nộ, tốc độ tích/hiệp, % sát thương từng chiến pháp, % trúng-né, hệ số khắc chế loại × địa hình (bonus jiacheng bao nhiêu %), giá trị buff Loạn Vũ/Hào Lệnh. Client chỉ nhận `deadInfo` (số lính chết).
- **`recommend/succ/beHold/nextTacticId`** đều do server tính; logic AI chọn chiến pháp/khắc chế ở server.
- Ý nghĩa chính xác đuôi ID (31/33/32…): suy đoán là mã địa hình bị khắc chế; bảng quy đổi ở server.

---

## 8. Kinh tế, tài nguyên, công trình & công nghệ

> Cân bằng thực (công thức, sản lượng gốc, thời gian) hầu hết ở server; client render UI + gọi `actions`.

### 1. Tài nguyên & vai trò (`battleConstants.lua:76-96`)

| ID | Tên Việt | Vai trò |
|---|---|---|
| 1 | Bạc | Tiền tệ cơ bản |
| 2 | Gỗ | Xây dựng, nâng cấp |
| 3 | Lương (Lúa) | Nuôi quân, huấn luyện |
| 4 | Thiết | Rèn vũ khí, khai mỏ |
| 8 | **Nô lệ (tù nhân)** | Lao dịch, cải tạo công trình |
| 9/10 | Bắt nô / Chủ nô | Hành động cướp/bắt nô |
| 11 | Vàng | Tiền nạp (IAP), tăng tốc/boost |

4 tài nguyên nền tảng: **Bạc / Gỗ / Lúa / Thiết** (`mainCity/ui.lua`, textId 10101-10104). Nhiều tiền tệ sự kiện (mooncake, xmas, redbag, iron ticket…).

**Hệ NÔ LỆ**: tướng địch bị bắt giữ ở **Nhà lao/Lao phòng** (`general/jail/ui.lua`), có nút "Bắt lao dịch" → tù nhân sản xuất. Nô lệ tiêu hao để **cải tạo công trình (Lỗ Ban)**: cần đủ tù nhân (490935 "Cần tù nhân: %s/%s"), mua thêm lượt cướp nô bằng **Vàng** (`buyGrabCost`/`goldBuySlave`). Quan chức đế chế cũng sinh nô lệ theo giờ.

### 2. Công trình trong thành (6 khu, `mainCity/ui.lua:93-115`)

| Khu (sys_*) | Chức năng |
|---|---|
| `sys_juming` | Sản xuất **Bạc** (dân cư) |
| `sys_muchang` | Sản xuất **Gỗ** (mộc trường) |
| `sys_nongchang` | Sản xuất **Lúa** (nông trường) |
| `sys_kuangchang` | Sản xuất **Thiết** (mỏ quặng) |
| `sys_bingying` | **Binh doanh** — huấn luyện quân (4 bậc lính, 170001-170004) |
| `sys_huangchen` | **Hoàng Thành** — hành chính, mở reform/đầu tư quốc gia |

Mỗi khu = "resourceArea" chứa nhiều ô công trình con (16 vị trí/khu). Nâng cấp (`changeBuilding`/`reformBuilding`): chi phí cost[1]=Vàng/Bạc, cost[2]=Gỗ; **Búa vàng** (tăng tốc) + số lượt miễn phí `freeConsNum`; **Tự động nâng cấp** (autoUpgrade). **Cải tạo/Reform (Lỗ Ban)**: 4 trạng thái Đầu tư → Xây (dùng nô lệ) → Cải cách → Hoàn thành, sinh buff.
> Tên các công trình con (Mã trường, Tiền trang…) hiện chỉ suy từ tên file art, **chưa xác thực textId**.

### 3. Cây công nghệ ("Khoa kĩ", 50007)

**A. Long Mạch (dragonTech)** — vòng đời 6 trạng thái: Chưa mở(0)→Sẵn sàng(1)→Đã mở(2)→Đã đầu tư(3)→Đang nghiên cứu(4)→Đã hiệu lực(5). Thao tác: **Đầu tư** (nạp tài nguyên 1-4) → **Nghiên cứu** (chờ `cdTotal`) → **Tăng tốc** (tốn Vàng). ~26 nhóm tech (lương, chợ, ngọc, kiến trúc, phúc lợi, chiến đấu…); **tên/tác dụng cụ thể không lộ ở client**.

**B. Khoa kĩ xây dựng/Thợ (buildTech)** — mở khi `workerOpen`. 2 nghề: **Thợ rèn (tiejiang) & Thợ mộc (mujiang)**, mỗi nghề 9 kỹ năng. Học tốn điểm khoa kĩ hoặc Vàng; mua điểm & đổi nghề tốn Vàng.

### 4. Sản xuất đặc thù

- **Con đường tơ lụa (silk road)** — `silk/*`, `resource/silkRoad/*`: tơ lụa là tài nguyên thương mại mua/bán qua thương lái (SilkBuy/SilkSell, market, blackMarket); `SilkPower` = PvE tranh chấp tuyến. **Giá & tỉ lệ ở server.**
- **Mỏ thiết (iron mine)** — `ironMine/*`: bản đồ **17 ô mỏ**, có chủ/tranh chấp; hành động mineMine/mineRush/mineAbandon → cộng Thiết.
- **Đồn điền (farm/tuntian)** — `farm/*`: gán tướng/binh vào ô tự thu **Lúa**; loại thường thưởng chu kỳ 10 phút; loại 1-5 kèm buff (giảm hao lương, tăng chiến lực).

### 5. Boost sản lượng (outputMode) — **con số lộ rõ ở client**

`outputMode/choosePanel.lua`: dùng **Vàng** mua buff sản lượng cho 1 trong 5 nhóm (Dân cư/Mỏ gỗ/Ruộng/Mỏ quặng/Binh doanh), chọn **thời hạn 1/7/30 ngày** và **mức 150%/200%/300%**.

Bảng chi phí Vàng (`var_0_7`, cho Bạc/Gỗ/Lúa/Thiết) — *giá trị trong file, chưa kiểm chứng độc lập*:

| Mức | 1 ngày | 7 ngày | 30 ngày |
|---|---|---|---|
| 150% | 8 | 44 | 168 |
| 200% | 16 | 89 | 336 |
| 300% | 40 | 224 | 840 |

Riêng **Binh doanh** chỉ 2 mức (bỏ 300%), rẻ hơn (150%=4/22/84, 200%=8/44/168).

### 6. Quốc gia / đế chế

`data/country.lua`: **3 nước Ngụy (wei) / Thục (shu) / Ngô (wu)**. Đế chế (`empire/ui.lua`) quản công trình quốc gia do tướng chiếm, sinh bonus: resourceType 1-4 → "+%s/giờ" (180001), 5 → nô lệ/giờ, 6 → giảm thời gian.

### Nằm ở server / chưa rõ
- **Toàn bộ công thức**: sản lượng gốc/giờ, đường cong chi phí nâng cấp, thời gian xây/nghiên cứu, cấp tối đa, điều kiện mở khoá.
- **Giá tơ lụa, sản lượng mỏ, thưởng đồn điền, `buyGrabCost`** — client chỉ nhận số.
- **Tên/tác dụng ~26 nhánh dragonTech & 9 skill/nghề buildTech** — chỉ có mã pic.

---

## 9. Thế lực, thế giới, trang bị & meta

> **Client rất "mỏng"** — hầu hết số liệu (bậc VIP, phẩm chất, giá, hệ số) do **server** cấp runtime.

### 1. Thế lực / Quốc gia

- **3 nước cố định: Ngụy / Thục / Ngô** (`countryFlag = {wei,shu,wu}`, `country.lua:1-4`; textId 95016/95017/95018). Cờ 3 màu (Ngụy lam, Thục đỏ, Ngô lục).
- **Chọn thế lực khi tạo nhân vật** → gắn vĩnh viễn `user.player.forceId` (không thấy đổi nước) — `selectForce/*`.
- **Cấp quốc gia (forceLv)** tăng tới **Vương Triều**, mở tính năng theo cấp: Lv2 lệnh giết địch, Lv3 mua chuộc Man tộc + khiêu chiến cá nhân, Lv5 quốc chiến liên server, Lv8+ kiến quốc — `nation/nationTab/NationTab.lua`.
- **Chức quan**: Quốc Vương + quan nhất phẩm; Quốc Vương biên tập thông báo, chỉ định quân vụ, phát viễn chinh, đổi tên nước (tốn Vàng, ≤15 ký tự).
- **Nhiệm vụ quốc gia & bỏ phiếu** (`nation/taskTab/*`, VotePanel có CD); **Quyên góp** Đồng/Gỗ đổi EXP (`investCopper`).

### 2. Chiến tranh quốc gia (đúng chủ đề "Xưng Đế Công Thành")

| Hệ thống | Mô tả | File |
|---|---|---|
| **Hội chiến** (huizhan) | Đại chiến toàn server 3 nước: Trù bị→Công thủ→Kết thúc; giành Hổ Phù, dùng Trưng Chiêu Lệnh tập quân | `nation/huizhan/*` |
| **Vây/Công thành** (weicheng) | Xếp hạng & bảo vệ thành trì | `nation/weicheng/*` |
| **Quân Đoàn** (corps) | Nhóm hợp binh cùng công thành/xuất chinh; có cả QĐ cá nhân | `corps/CorpsPanelNew.lua` |
| **Kiến Quốc Đại Nghiệp** | Nâng cấp nước tới Vương Triều | `nation/buildNation/jianguodaye/*` |
| **Quyết Chiến Dĩnh Châu / Korea Battle** | Chiếm đảo/liên server cấp quốc gia cao | `nation/buildNation/*`, `KoreaBattlePanel.lua` |

### 3. "Liên minh" — 2 khái niệm dễ nhầm

- **Liên minh ngoại giao (league)**: quan hệ giữa 3 nước, phổ biến **2 nước liên thủ đánh 1** (`world/ShowLeague.lua`, textId 470001/470005).
- **KHÔNG có "bang hội" người-chơi kiểu MMO** — vai trò cộng đồng do **Quốc gia** + **Quân Đoàn** đảm nhận.
- ⚠️ **Đính chính:** `feud/FeudPanel.lua` **KHÔNG phải bang hội**, mà là **Phong Địa (fief)** — nạp cứ điểm đã chiếm thành phong địa để **sản xuất tài nguyên**; bị đánh chiếm thì ngừng sản xuất (textId 121067/121068, 75097 "Đại Tướng Quân Ấn").

### 4. Vũ khí & trang bị

**Vũ khí** (`weaponTab/*`):
- **Rèn/Đúc**: chọn phẩm chất & bản vẽ, tốn Vàng + vật liệu, rèn 1x/10x — `casting/CastingPanel.lua`.
- **Thần Binh**: cấp tối đa **220** (`MAX_GOD_WEAPON_LV=220`); dung luyện Bách Luyện Cương.
- **Khe đá quý trên vũ khí**: gỡ đá thường miễn phí, đá cao cấp tốn Vàng (textId 121032).
- **Khí giới công thành**: Catapult (máy bắn đá) & Machine (nâng bằng thiên thạch).

**Trang bị** (`equipment/*`) — 5 tab: Cửa hàng · Kho · Tôi luyện · Giao dịch:
- Phẩm chất theo màu & sao; bộ **tím (epic)** là mốc mạnh, có kỹ năng bộ.
- **Tôi luyện (quenching)**: đổi/nâng thuộc tính ngẫu nhiên (miễn phí vài lần rồi tốn Vàng).
- **Khai Quang (kaiguang)**: tiến hoá bộ trang bị (Phượng/Thuỷ/Ba Tư/Linh Quỷ/Rồng).
- **Thần Tướng (shenjiang)**: "tiêm" Tơ lụa/Bảo thạch/Giao thạch hoàn thiện bộ (+ATK/DEF/HP + 2 kỹ năng).

**Đá quý / Bảo thạch**: chấm **sao (1–12)**, phân nguyên thạch thường/cực phẩm/thần bí; khảm vào khe vũ khí; 3 dòng ATK/DEF/HP (textId 135540-135547, 130025 "Bàn Quay Bảo Thạch").

### 5. Đại bản đồ thế giới (30 loại ô, `world/constant.lua`)

- **Thành**: Chengchi 1-2, Zhucheng (chủ thành), Tesechengchi (đặc sắc), Manzucheng (thành Man).
- **Quan ải**: Guanqia 1-3.
- **Địa hình**: Pingyuan (bình nguyên), Shandi/Gaoshan (núi), Shuidi (thuỷ), Xiagu (hẻm), Miling, Xiepo 1-3 (dốc).
- **Tài nguyên/quân sự**: Tuntianqu (đồn điền), Junhuoku 1-3 (**Kho Quân Hoả** — cấp "Hoả Kế" khi công thành, 490126), Baolei 1-3 (bảo lũy), Yaosai 1-3 (yếu tái), Sishi 1-3 (điểm khai thác).

- **Sương mù (uncoverFog)**: mở dần theo tiến độ; hoàn thành nhiệm vụ "vén màn sương mù" nhận EXP + tài nguyên.
- **Hành quân**: tướng di chuyển theo đường tính sẵn (`traceData/tracePoints`) — `world/generalMoveLayer.lua`.
- **Đầu tư (NewInvestMenu)**: khai thác ô tài nguyên tốn **Đồng**, nhận sản lượng + EXP, có CD (tăng tốc bằng Vàng); menu Chiến lược (vây hãm/hành tiến).
- Tài nguyên chính: **Lúa · Gỗ · Thiết · Bạc · Đồng** (+ Vàng, EXP).
- **Sự kiện bản đồ**: popup 2 lựa chọn (`world/eventWindow.lua`); thành NPC sinh quân tự tiêu (`DiedCastleNpc`); sự kiện Viên Thiệu/Trương Giác (`yuanshaoEvent`).

### 6. VIP

Nạp-driven; nhắc tới **VIP11** (textId 142010) → **≥11 bậc**. Quyền lợi ví dụ: VIP1 tự-nâng-cấp kiến trúc miễn phí vĩnh viễn (160001), VIP5 tăng EXP phó bản (220320). Bảng chi tiết **do server cấp**.

### 7. Xếp hạng & Nhiệm vụ

- **Bảng xếp hạng** (`rankInfo/ui.lua`, 110001-110004): **Công huân · Quan chức · Khiêu chiến · Công thành** (hôm nay/hôm qua).
- **Nhiệm vụ** (`task/*`): Con đường tân thủ, Nhiệm vụ chính tuyến, Thành tựu + nhiệm vụ quốc gia.

### 8. Catalog hoạt động (~80 sự kiện, `activity/activityTab/*` — 110 file)

- **Vòng quay/bàn quay**: BigRotary, GemRotary/Super, IronRotary, ZhuanPan, HorseRacing.
- **Nạp/tiêu tích luỹ & quà gói**: ConsumeGift, GoldActivity, TankCharge, GodPaper, ChooseEquip, DataReward.
- **Đá quý/rèn**: NewGems, GemBonus/Mine, JueStone, KaiguangPoint, Furnace, NewSword.
- **Đào mỏ/Thiết**: IronMine/Mountain/Reward/Sell, GangMine, MoveMountain, Meteorite.
- **Tơ lụa/thẻ**: SeaSilk, SilkCard/Shop, Card, SendRed (lì xì).
- **Lễ hội mùa**: MidAutumn/MoonCake, Lantern/TianDeng, ChristmasDay, BaiNian/YearBeast (Tết), PoShui (té nước), Fishing.
- **PvE/PvP cốt truyện**: ChangbanSally (Trường Bản), DefendXiangYang (thủ Tương Dương), BoatArrow (thuyền cỏ mượn tên), SevenCatch (thất cầm), Qingmei (luận anh hùng), FeteHero/HeroDrink.

### 9. Cross-server (kf* = khoá phục / liên máy chủ)

| Module | Mô tả |
|---|---|
| **kfmg** | **Diệt Quốc liên server** — công phá thành (Tương Dương/Kiến Nghiệp), dùng Công Thành Chuỳ |
| **kfwd** | **Giải Tiên Phong** — 3 ngày, 5 trận/ngày, tích điểm xếp hạng |
| **kfzb** | **Giải Tranh Bá** — vòng loại→tứ/bán/chung kết→Tiệc Tranh Bá, sinh Quán quân |
| **kfyz** | **Viễn chinh nước ngoài (Đông Doanh…)** — nhiệm vụ cá nhân, đầu tư, kho quân, đặt lịch |
| **kfyzWorld** | Bản đồ ngoại quốc: **Cao Ly, Nhật (Đông Doanh), Lưu Cầu, Nam Chiếu, Việt Nam/Giao Chỉ** (`gaoli/japan/liuqiu/nanzhao/yuenanCubePoly`) |
| **kfsy** | Chế độ liên server (tổng quan) |
| **kfworld/kfgz** | Đại bản đồ + giải đấu kfgz liên server (rank/lịch/kết thúc) |

### Nằm ở server / chưa rõ
- **Bảng số**: số bậc VIP đầy đủ & quyền lợi, phẩm chất/màu trang bị chính xác, hệ số sao đá quý, chi phí rèn/khảm, cấp trần vũ khí thường — server.
- **"Bang hội" người chơi**: xác nhận **không tồn tại** dạng guild MMO; cộng đồng = Quốc gia + Quân Đoàn.
- **kfsy/kfmg/kfgz luật chi tiết**: mới nắm tên & vai trò; luật điểm/lịch ở server.
- Một số tên ô bản đồ (Yaosai/Baolei/Sishi) dịch từ pinyin, chưa chốt tên Việt chuẩn.
