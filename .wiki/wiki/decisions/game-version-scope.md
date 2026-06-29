---
title: Phạm vi phiên bản để dựng lại
category: decisions
tags: [scope, disambiguation, decision]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Phạm vi: dựng lại phiên bản nào của "Công Thành Xưng Đế"?

**Ngày**: 2026-06-27
**Quyết định bởi**: (chờ xác nhận của chủ dự án)
**Trạng thái**: đang xem xét (đề xuất bên dưới)

## Bối cảnh
Khâu nghiên cứu phát hiện **ba** game khác nhau cùng/gần tên, có cơ chế KHÁC nhau ở vài điểm cốt lõi (số binh chủng, cách khắc chế, hệ sao lính). Nếu trộn dữ liệu sẽ dựng sai. Cần chốt bản nào là chuẩn để mọi trang wiki bám theo.

## Các lựa chọn
1. **攻城掠地 — webgame 傲世堂 (2013)** *(đề xuất)*
   - Asset của dự án khớp bản này: hàng đợi tướng, animation công/thủ (att/def), nộ khí (`warFeatAnger`), 武神附体/武将觉醒, banner tên chiến pháp.
   - Cơ chế: chiến đấu theo lượt, tối đa 5 tướng, **3 thế trận** 突击/攻击/防御 khắc chế vòng tròn; theo Baidu webgame dùng **4 binh chủng** (骑/枪/弓/攻城) và "兵种互不相克" (khắc chế nằm ở lớp thế trận).
   - Ưu: tài liệu TQ sâu nhất; khớp asset. Nhược: vài số liệu nằm trong forum cần đăng nhập.
2. **Công Thành Xưng Đế Mobile (2019, NPH VGP)**
   - Game mobile ra sau, **5 binh chủng** (Thương/Cung/Kỵ/Mưu Sĩ/Chiến Xa), lối chơi chiến thuật thời gian thực hơn.
   - Ưu: là bản VN gần đây, có trang chính chủ congthanh.vgplay.vn. Nhược: KHÁC cơ chế lõi với asset hiện có.
3. **乱世曹操传 (game anh em cùng NPH)**
   - **6 binh chủng** + hệ sao lính (战录 50/100/150/200) + 兵种天赋 +25%. Nhiều "số liệu đẹp" trên mạng thực ra thuộc bản này.
   - Ưu: cơ chế lính rõ ràng. Nhược: KHÔNG phải game mục tiêu; chỉ dùng tham khảo.

## Đề xuất quyết định
Lấy **(1) webgame 攻城掠地 2013** làm chuẩn (vì asset khớp), và CHỈ mượn cơ chế từ (2)/(3) khi có callout `> [!warning]` nói rõ nguồn. Mọi trang `systems/` đã viết theo nguyên tắc này.

## Hệ quả
- Các dữ kiện "5/6 binh chủng", "hệ sao 战录", "兵种天赋 +25%" được đánh dấu là THUỘC bản khác cho tới khi xác nhận lại cho webgame.
- Cần chủ dự án xác nhận: **dựng lại đúng webgame 2013, hay làm bản phối/hiện đại hóa?** Việc này ảnh hưởng số binh chủng, hệ khắc chế, và renderer.
- Xem mâu thuẫn liên quan: [[contradictions]] (x-20260627-01 binh chủng, x-20260627-06 hình học chiến trường).

---
## Backlinks
- [[overview]] — cảnh báo phân biệt 3 game
- [[systems/troop-types]] — số binh chủng theo từng bản
- [[sources/ctxd-web-research-2026-06-27]]
