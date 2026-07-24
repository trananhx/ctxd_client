# ASSET-MANIFEST — asset tĩnh trích từ APK

> Sinh tự động từ `Xưng Đế Công Thành_1.apk` (bundled `assets/`, 3149 file). Bytecode Lua (1115 file) đã nằm ở [`../decompiled/`](../decompiled/); thư mục này chứa **mọi asset còn lại**: ảnh, plist atlas, audio, manifest.

## Tổng quan

| Loại | Đặt tên được | Chưa map (`_unmapped/`) | Tổng | Dung lượng |
|---|--:|--:|--:|--:|
| PNG (anh/sprite sheet) | 523 | 896 | 1419 | 25.14 MB |
| JPEG (nen/anh lon) | 108 | 305 | 413 | 6.72 MB |
| Plist atlas (XML) | 75 | 67 | 142 | 2.19 MB |
| pvr.ccz (PVR nen) | 4 | 1 | 5 | 0.87 MB |
| MP3 (audio) | 0 | 23 | 23 | 1.38 MB |
| Texture khac (ibcc) | 0 | 30 | 30 | 0.06 MB |
| **Tổng** | **710** | **1322** | **2032** | **36.37 MB** |

Cộng thêm: `res.lua` (bảng resource manifest 287 KB), `version.lua`, `hash2asset.tsv` (map khôi phục).

## Cách đặt tên (khôi phục đường dẫn gốc)

Game gốc địa chỉ mọi file bằng `md5(đường-dẫn-tương-đối)` → tên file trên đĩa là hash 32 ký tự, **không có phần mở rộng**. Khôi phục bằng 2 nguồn:

1. **String literal trong Lua đã decompile** — quét mọi chuỗi `"res/....(plist|png|jpg|...)"` tĩnh, tính `md5(path)`, đối chiếu tên hash. (Chuỗi dựng động kiểu `"%s%d.png"` không giải tĩnh được → giữ tên hash.)
2. **`<textureFileName>` trong plist** — mỗi atlas trỏ tới texture cùng thư mục; suy ra đường dẫn texture rồi `md5` để đặt tên PNG/pvr.ccz atlas.

Kết quả: **710/2032** asset (~34%) khôi phục được tên và đặt vào cây `res/` đúng cấu trúc gốc; phần còn lại (tên dựng runtime, audio tải về, texture custom) nằm trong `_unmapped/<loại>/<hash>.<ext>`.

## Bố cục thư mục

```
assets/
├── res/                 # asset đã khôi phục tên, mirror cây gốc
│   ├── res/                         (1 file)
│   ├── res/anim/                    (75 file)
│   ├── res/army/                    (2 file)
│   ├── res/native/                  (13 file)
│   ├── res/sys/                     (5 file)
│   ├── res/tiledmap/                (36 file)
│   ├── res/ui/                      (578 file)
├── _unmapped/           # chưa map được tên (giữ hash)
│   ├── png/       896 file
│   ├── jpg/       305 file
│   ├── plist/     67 file
│   ├── ccz/       1 file
│   ├── mp3/       23 file
│   ├── other/     30 file
├── res.lua              # data_res_info: hash → {content-md5, size}
├── version.lua          # game 8.9.0.6 / client 5.4.1.0
└── hash2asset.tsv       # map md5(path) → path đã khôi phục
```

## Chỉ mục atlas (plist) — 75 atlas đã đặt tên, 2422 sprite-frame

25 atlas nhiều frame nhất (mỗi plist định nghĩa toạ độ sprite trong sheet; tên frame lộ cấu trúc animation):

| Atlas | Số frame |
|---|--:|
| `res/ui/world/worldBuilding.plist` | 612 |
| `res/ui/common/ItemsPic/ItemsPic2.plist` | 165 |
| `res/ui/common/ItemsPic/ItemsPic.plist` | 149 |
| `res/ui/nation/nation.plist` | 148 |
| `res/ui/common/icon/icon.plist` | 73 |
| `res/ui/activity/activity.plist` | 70 |
| `res/ui/activity/ancientCastle/gcName.plist` | 67 |
| `res/ui/world/thumbnail.plist` | 66 |
| `res/ui/activity/lantern/lanternPic.plist` | 43 |
| `res/ui/common/button/button.plist` | 41 |
| `res/ui/activity/beast/beastAnim.plist` | 40 |
| `res/anim/resourceAnim/jinguangAnim.plist` | 35 |
| `res/ui/activity/beast/beastPic.plist` | 34 |
| `res/ui/activity/ironMine/ironMinePic.plist` | 32 |
| `res/anim/resourceAnim/buildingManAnim.plist` | 32 |
| `res/ui/world/worldTower.plist` | 31 |
| `res/ui/login/login3.plist` | 30 |
| `res/anim/swordEffect/swordEffect.plist` | 30 |
| `res/ui/world/cityWindow.plist` | 29 |
| `res/ui/world/rankHour.plist` | 26 |
| `res/anim/resourceAnim/resoLight.plist` | 24 |
| `res/anim/buffer/stun/stun.plist` | 24 |
| `res/ui/activity/midAutumn/midAutumn.plist` | 22 |
| `res/anim/warlockUpgrade/warlockUpgrade.plist` | 21 |
| `res/anim/buffer/wushenfuti/wushengfuti.plist` | 20 |

## Lưu ý khi dùng

- **pvr.ccz**: texture nén zlib+PVR, không xem trực tiếp — cần giải nén rồi decode PVR. Vài atlas nhân vật (vd `blueManzu5`) dùng định dạng này thay PNG.
- **`_unmapped/png`, `_unmapped/jpg`**: vẫn là art thật, chỉ chưa khôi phục được tên (game dựng đường dẫn lúc chạy). Xem trực tiếp được.
- **`_unmapped/mp3`**: audio bundled; đường dẫn `res/audio/*.mp3` tham chiếu trong code là bản **tải runtime**, khác tập bundled nên không map được.
- **`_unmapped/other`**: 30 texture định dạng in-house (magic `ibcc`).
- **Ranh giới client/server** giữ nguyên: đây là art & cấu trúc, **không phải số liệu cân bằng** (xem [`../README.md`](../README.md)).
- Ảnh (`*.png/*.jpg`) do `.gitattributes` gốc route qua **Git LFS**; plist/pvr.ccz/other lưu thường.

_Sinh tự động 2026-07-24 — mở rộng pipeline dịch ngược sang asset phi-Lua._