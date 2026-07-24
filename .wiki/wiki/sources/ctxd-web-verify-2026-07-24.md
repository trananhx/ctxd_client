---
title: Đối chiếu web — mô hình đơn vị CTXD (2026-07-24)
category: sources
source_path: raw/references/
tags: [web-research, verification, primary, tam-quoc]
created: 2026-07-24
updated: 2026-07-24
---

# Đối chiếu web — mô hình đơn vị CTXD (2026-07-24)

> [!info] Provenance tập trung
> Trang **đối chiếu web** gom mọi kết luận đã kiểm chứng qua nguồn thật cho **mô hình đơn vị** của 攻城掠地 / Công Thành Xưng Đế (đợt xác minh 2026-07-24). Mọi fact CONFIRMED kèm **URL thật**; điểm chưa chắc đánh ⚠️/❓/UNVERIFIED. Dùng làm **chuẩn đối chiếu** cho các trang model đơn vị (khi lệch với suy diễn từ ảnh in-game, ưu tiên nguồn có URL). Phân biệt nguồn **official** (傲世堂/aoshitang.com) với **fansite/thứ cấp** (49you, 07073, shiyouhome, 9game, gamersky…).

> [!warning] source_path
> web research — nhiều URL, không có 1 file gốc trong `raw/`. `source_path: raw/references/` chỉ là thư mục quy ước; danh sách URL đầy đủ nằm ở từng mục và ở phần **Nguồn** cuối trang.

## Đã xác nhận (CONFIRMED)

- **V1 — Chỉ 2 chỉ số nền 统/勇, KHÔNG có 武力 riêng** *(official)*. 攻城掠地 chỉ có 统(Thống) & 勇(Dũng). 统 chi phối 普通攻击 + 普通防御 (đòn thường, cả công LẪN thủ); 勇 chi phối 战法攻击 + 战法防御 (chiến pháp, cả công LẪN thủ); 1 điểm ≈ 10 công/thủ. 5 thuộc tính giải đòn: 普通攻击 / 普通防御 / 战法攻击 / 战法防御 / 计策. NGUỒN (official): https://gc.aoshitang.com/news/zixun/322013031413222593632.html ; (fansite) http://gcld.49you.com/gonglue/60744.html
- **V2 — Chiến pháp Mã Siêu = 铁骑无敌 (Thiết Kỵ VÔ ĐỊCH)**. Đánh 前3排 (3 hàng đầu), sát thương không né được. KHÔNG phải 铁骑无双, KHÔNG phải 5 hàng ⇒ UNIT C ("5 hàng") **không** phải Mã Siêu. NGUỒN (fansite): http://m.ouwan.com/news/gcld20150604dw11.html , https://m.iask.sina.com.cn/b/wtVedLAeXm.html
- **V3 — Số hàng (排) là thuộc tính RIÊNG mỗi 战法 (2–5)** *(official 武将大全)*. Ví dụ official: 庞德冲锋=3排, 甘宁固守=4排, 夏侯惇飞羽=穿4排, 徐晃背水=3排, 吕蒙入侵=2排, 祝融突击=3排. NGUỒN (official): https://gc.aoshitang.com/news/gonglue/772013041123252111032.html ; (thứ cấp — 太史慈"4排+2 lần", 赵云"5&2排") https://www.shiyouhome.com/gcld/wjfx/1995.html , https://www.9game.cn/news/9767095.html
- **V4 — Một 战法 có thể có SỐ LẦN phát (次数)** *(medium/fansite)*. Vd 太史慈乘胜追击 "4排 + phát 2 lần" → củng cố `castMode` N-lần. NGUỒN: https://www.shiyouhome.com/gcld/wjfx/1995.html
- **V5 — Cast chiến pháp là THỦ CÔNG** *(official)*. Người chơi BẤM hình tướng để thả 战法 khi thanh đầy ("点击中间武将头像就会释放该武将的战法"). NGUỒN (official): https://gc.aoshitang.com/news/ziliao/152012121118262077467.html . ⚠️ Thuật ngữ 士气 vs 怒气 **chưa** chốt — official không dùng từ nào, gamersky có 怒气 → đừng khẳng định 怒气 sai.
- **V6 — 战力 (Lực chiến) = chỉ số TỔNG HỢP thực lực, KHÔNG = sát thương** *(fansite, củng cố FIX-1)*. Buff "+X% 战力/战斗力" là hệ số NHÂN (1+加成) trong công thức. NGUỒN: http://www.07073.com/gcld/gonglue/1145296.html
- **V7 — Cấu trúc thiên phú công thành "chỉ phe công (仅攻方)" là THẬT** *(cấu trúc CHỐT; con số +60% UNVERIFIED)*. Ví dụ Tư Mã Ý "攻城战斗力+25%（若非副将，守城无15%加成）". NHƯNG con số +60% của UNIT A **không** có nguồn (thiên phú công thành có nguồn đều +25%; 60% có thể là bonus phối-binh-bình-nguyên, không phải 1 dòng thiên phú tướng). NGUỒN: https://www.shiyouhome.com/gcld/wjfx/2009.html , https://www.602.com/news/33/6396.html
- **V8 — Thiên phú buff 战斗力 theo 4 địa hình 平原/山地/水域/城池**, % per-tướng (Quan Vũ 平原+25%, Lữ Bố 平原+35%, Triệu Vân/Chu Thái toàn-địa-hình-trừ-thành +25%…). NGUỒN: https://www.hly.com/zixun/z-55319.html
- **V9 — Binh lực = HP; chết-theo-hàng** *(official, trích逐字)*: "部队伤亡以列为单位，一列部队兵力降至零则后一列补上，直至一方兵力均消耗完毕则战斗结束". NGUỒN (official): https://gc.aoshitang.com/news/ziliao/152012121118262077467.html
- **V10 — 带兵量 (trần binh lực) = 3 trụ**: cấp tướng + trang bị/兵器 + 科技. NGUỒN: https://www.gameres.com/249586.html , (official) https://gc.aoshitang.com/news/ziliao/152012121118262077467.html
- **V11 — Mộ binh: 兵力 hồi theo timer thời gian thực** *(cấu trúc CHỐT; con số UNVERIFIED)*. Càng gần thành chính hồi càng nhanh ("武将离主城越近，兵力恢复越快"); 募兵令/vàng bổ sung ngay. Con số cụ thể (-5 phút/lệnh, 5000 lính/lệnh, trần tích trữ) KHÔNG nguồn → đừng ghi làm fact. NGUỒN: https://www.gamersky.com/handbook/201405/359124.shtml , (official) https://gc.aoshitang.com/news/ziliao/152012121118262077467.html
- **V12 — 4 hệ binh chủng khắc chế, KHÔNG có hệ thứ 5 法师/谋士**. Khắc chế thật: 步/弓/骑/器械 (步克弓 / 弓克骑 / 骑克器械 / 器械克步), biểu hiện qua 兵种天赋. "Binh chủng thứ 5 法师/谋士" là nội dung trộn game khác → BÁC. ⚠️ App store nêu "12种兵种" (nhiều khả năng 4 hệ × nhiều bậc). NGUỒN: https://www.9game.cn/news/9969087.html , https://apps.apple.com/us/app/id1444310665

## Đã sửa (CORRECTED)

- **E1 — "Nhục Bác Tứ Sĩ" → "Nhục Bác TỬ SĨ"** (死士 = quân cảm tử). 肉搏死士 LÀ binh chủng thật; 黄金肉搏死士 = binh chủng vàng của 周泰 (Chu Thái), thuần cận chiến "không phụ thuộc chiến pháp" → giải thích vì sao **UNIT B** để ô chiến pháp TRỐNG. Độ tin **MEDIUM** (fansite; trang gốc ruiel 404). NGUỒN: https://www.shiyouhome.com/gcld/wjfx/1999.html , https://www.233leyuan.com/post-detail/1991837600193638277
- **Mã Siêu (đối chiếu V2)** — sửa suy diễn cũ: chiến pháp Mã Siêu = **铁骑无敌** (3 hàng), KHÔNG phải 铁骑无双, KHÔNG phải 5 hàng. Hệ quả: **UNIT C "5 hàng" KHÔNG phải Mã Siêu**; tên chiến pháp UNIT C (铁骑无双) vẫn để ❓. (Xem V2 để nguồn.)
- **Tách UNIT C** — do V2, gỡ liên kết C ↔ Mã Siêu. UNIT C ("黄金战骑" / "5 hàng") tách thành đơn vị định danh **chưa chốt**: binh chủng 骑兵 khả dĩ (high) nhưng tên "黄金战骑" UNVERIFIED và tướng sở hữu KHÔNG đoán. (Xem X2.)

## Chưa chắc (UNVERIFIED/PARTIAL)

> [!warning] X1 — Hệ "bậc sao binh chủng (兵种星级)" có thể thuộc GAME KHÁC
> Các con số bậc sao (战录 50/100/150/200, 4★ nhân đôi thiên phú, 5★ sĩ khí 100) **truy về game khác** (三国志战略版 / 率土之滨 / 乱世曹操传), **KHÔNG** có nguồn 攻城掠地 official. GIỮ NGUYÊN cảnh báo "chưa xác nhận cho 攻城掠地 / có thể thuộc game khác". TUYỆT ĐỐI KHÔNG viết hệ sao này là cơ chế đã-chốt của CTXD.

- **X2 — Tên định danh binh chủng UNIT A / UNIT C** ⚠️
  - "攻城车" (UNIT A) = **PARTIAL**: siege 器械 có thật, nhưng "攻城车" có thể là mô tả loại, không phải tên định danh.
  - "黄金战骑" (UNIT C) = **UNVERIFIED**: không nguồn nào ra đúng chuỗi.
  - Giữ ⚠️, KHÔNG chốt tên, KHÔNG đoán tướng sở hữu.
- **X3 — "LV4 / cấp4" là bậc SAO hay CẤP ĐỘ** ❓ vẫn CHƯA chốt (open question), vì cả hệ sao lẫn hệ cấp đều chưa xác nhận cho CTXD.
- **+60% công thành (UNIT A)** ⚠️ UNVERIFIED — cấu trúc "chỉ phe công" là thật (V7) nhưng con số +60% không nguồn; mọi thiên phú công thành có nguồn đều +25%.
- **Con số 募兵令 (mộ binh)** ⚠️ UNVERIFIED — cấu trúc timer/gần-thành-hồi-nhanh là thật (V11); các con số cụ thể (-5 phút/lệnh, 5000 lính/lệnh, trần tích trữ) KHÔNG nguồn.
- **计策 do 统 hay 勇** ❓ UNVERIFIED — 计策 là 1 trong 5 thuộc tính giải đòn (V1) nhưng nguồn official chưa nói rõ nó bám 统 hay 勇.

## Nguồn

**Official (傲世堂 / aoshitang.com — độ tin cao):**
- 5 thuộc tính công/thủ (V1): https://gc.aoshitang.com/news/zixun/322013031413222593632.html
- 武将大全 số hàng 战法 (V3): https://gc.aoshitang.com/news/gonglue/772013041123252111032.html
- Cast thủ công + chết-theo-hàng + 带兵量 + mộ binh (V5/V9/V10/V11): https://gc.aoshitang.com/news/ziliao/152012121118262077467.html

**Fansite / thứ cấp (độ tin medium — dùng để củng cố, không tự đứng một mình cho fact quan trọng):**
- 统/勇 (V1): http://gcld.49you.com/gonglue/60744.html
- Mã Siêu 铁骑无敌 (V2): http://m.ouwan.com/news/gcld20150604dw11.html , https://m.iask.sina.com.cn/b/wtVedLAeXm.html
- 战法 số hàng/số lần thứ cấp (V3/V4): https://www.shiyouhome.com/gcld/wjfx/1995.html , https://www.9game.cn/news/9767095.html
- 战力 = tổng hợp (V6): http://www.07073.com/gcld/gonglue/1145296.html
- Thiên phú công thành "chỉ phe công" (V7): https://www.shiyouhome.com/gcld/wjfx/2009.html , https://www.602.com/news/33/6396.html
- Thiên phú địa hình (V8): https://www.hly.com/zixun/z-55319.html
- 带兵量 3 trụ (V10): https://www.gameres.com/249586.html
- Mộ binh (V11): https://www.gamersky.com/handbook/201405/359124.shtml
- 4 hệ binh chủng (V12): https://www.9game.cn/news/9969087.html , https://apps.apple.com/us/app/id1444310665
- 肉搏死士 / 黄金肉搏死士 — Chu Thái (E1): https://www.shiyouhome.com/gcld/wjfx/1999.html , https://www.233leyuan.com/post-detail/1991837600193638277

---

## Backlinks
- [[systems/unit-entity-model]] — mô hình tướng+lính hợp nhất, đối chiếu với nguồn web
- [[systems/troop-types]] — 4 hệ binh chủng, tên định danh (X2)
- [[systems/general-system]] — 统/勇, chiến pháp, cast thủ công
- [[entities/generals]] — Mã Siêu (V2), Chu Thái (E1), tướng sở hữu binh chủng
- [[claims]] — provenance các fact có nguồn web
- [[contradictions]] — X1/X2/X3 và các điểm còn tranh chấp
