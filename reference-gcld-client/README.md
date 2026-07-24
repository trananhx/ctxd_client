# reference-gcld-client — Source client dịch ngược của game gốc

> **Tài liệu tham chiếu nội bộ.** Đây là mã nguồn client + GDD của **game gốc mà `ctxd_client` đang làm lại**: 《攻城掠地》 / **Công Thành Lược Địa** (GCLD), bản Việt hoá "Xưng Đế Công Thành". Dùng để đối chiếu thiết kế khi phát triển. **Không phân phối lại** — chỉ tham chiếu trong nội bộ dự án.

Thư mục này nằm **ngoài `Assets/`** nên Unity không import/biên dịch nó.

## Nội dung

| Đường dẫn | Mô tả |
|---|---|
| [`GDD.md`](GDD.md) | **GDD tái dựng đầy đủ** (9 mục: danh tính, phương pháp, chiến trường, chế độ chơi, engine chiến đấu, binh chủng, tướng, chiến pháp/nộ, kinh tế, meta) |
| `decompiled/` | **Toàn bộ 1115 file Lua** đã decompile, cây tên gốc (`lua/game/battle/*`, `lua/layer/*`, …) |
| `decompiled/res/lang_zh_cn.lua` | Bảng bản địa hoá **tiếng Việt** `[textId] = "..."` — tra tên hệ thống/item/chiến pháp |
| `decompiled/_unmapped/` | 417 file chưa khôi phục được tên (giữ tên hash) — vẫn đọc được |
| `tooling/hash2path.tsv` | Map `hash → đường-dẫn-module` (698 file đã đặt tên) |
| `tooling/resolve.py` | Tra `textId → tiếng Việt`: `python tooling/resolve.py 190083 490727` |
| `tooling/extract_strings.py` | Trích chuỗi UTF-8 từ bytecode (dùng khi chạy lại pipeline) |

## Nguồn & bối cảnh

- **Game**: 攻城掠地 / Công Thành Lược Địa — SLG Tam Quốc, NPH Aoshitang (熬时堂) / Ujoy.
- **APK gốc**: `Xưng Đế Công Thành_1.apk` (ở gốc project; **bị `.gitignore` loại** nên không sync qua git — chỉ thư mục này sync).
- **Phiên bản**: game `8.9.0.6`, client `5.4.1.0`, build 2018. Package `com.gpstore.xdctslg`.
- **Engine**: **Cocos2d-x + LuaJIT** (không phải Unity) — toàn bộ gameplay trong Lua.

## ⚠️ Ranh giới client / server (đọc trước khi dùng số liệu)

Game **server-authoritative tuyệt đối**: server tính TOÀN BỘ trận rồi stream một "báo cáo trận" gồm ~47 loại sự kiện đánh số; client (thư mục này) **chỉ replay** (`lua/game/battle/reportHandler/<n>.lua`).

**Mọi con số cân bằng — sát thương, xác suất né/bạo kích, targeting, tích nộ, hệ số khắc chế/địa hình, giá, sản lượng, đường cong cấp — NẰM Ở SERVER, KHÔNG có trong code này.** Nguồn này mạnh về **cấu trúc / luật / enum / thuật ngữ**, không có định lượng cân bằng gốc.

## Cách tái tạo (nếu cần chạy lại từ APK)

1. `unzip "Xưng Đế Công Thành_1.apk" -d out` → `out/assets/` chứa 1115 file LuaJIT bytecode (magic `1B 4C 4A 01 02`).
2. Tải decompiler: **luajit-decompiler-v2** — https://github.com/marsinator358/luajit-decompiler-v2 (release `.exe`, Windows x64).
3. `luajit-decompiler-v2.exe out/assets` → thư mục `output/` chứa `<hash>.lua`.
4. Khôi phục tên: tên file gốc = `md5(đường-dẫn-tương-đối + ".lua")`. Gom mọi chuỗi `require("...")` trong code đã giải, tính `md5(path+".lua")`, so với tên hash → map ngược. (Xem `tooling/hash2path.tsv` cho kết quả.)
5. Bảng ngôn ngữ: module `res/lang_zh_cn.lua` (giữ tên gốc nhưng nội dung đã Việt hoá).

## Liên kết wiki

Nội dung này đã được nạp vào knowledge base của dự án:
- Trang nguồn: `.wiki/wiki/sources/apk-reverse-engineering-2026-07-24.md`
- Claim client-confirmed: `.wiki/wiki/claims.md` (`c-20260724-07…16`)
- Các trang hệ thống (`.wiki/wiki/systems/*`) có callout "Xác thực từ dịch ngược client".

_Tạo 2026-07-24 bằng quy trình dịch ngược tự động._
