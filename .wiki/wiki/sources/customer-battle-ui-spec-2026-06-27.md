---
title: Đặc tả khách hàng — Giao diện & cơ chế trận đánh
category: sources
tags: [customer-spec, requirements, battle-ui, geometry, primary]
source_path: raw/feedback/customer-battle-ui-spec.md
source_type: spec
date: 2026-06-27
authors: [khách hàng / chủ dự án]
created: 2026-06-27
ingested: 2026-06-27
updated: 2026-06-27
---

# Đặc tả khách hàng — Giao diện & cơ chế trận đánh

## Abstract
Yêu cầu chi tiết **do khách hàng cung cấp** về giao diện chờ, giao diện chiến đấu, cơ chế quân lính/đội hình và địa hình. Đây là **đặc tả yêu cầu (requirements)** có độ ưu tiên cao — bám theo khi dựng renderer trận đánh. **Giải quyết dứt điểm** câu hỏi mở về hình học chiến trường ([[open-questions#q-20260627-05]], [[contradictions#x-20260627-06]]).

> [!info] Độ ưu tiên: đây là **yêu cầu của khách**, ưu tiên cao hơn suy luận từ nguồn web. Khi dựng lại, lấy đặc tả này làm chuẩn cho phần trình bày trận đánh.

## 1. Giao diện chờ (chuẩn bị trước trận)
- **Chia rõ 2 phe**: **Phe Công (trái)** và **Phe Thủ (phải)**, kèm bảng "**Võ Tướng Đối Đấu**".
- **Sắp xếp đội hình**: người chơi **tự do đổi thứ tự xuất chiến** của tướng trước khi đếm ngược kết thúc; thứ tự đánh số **Một → Ngũ (一–五)**.
- **Thông tin mỗi ô tướng**: avatar, **cấp (Lv)**, **tên tướng** (vd Chúc Dung 祝融, Cam Ninh 甘宁, Chu Du 周瑜, Gia Cát Lượng 诸葛亮…), **lực chiến / binh lực**.
- **Đồng hồ đếm ngược** ở giữa màn trước khi vào trận.

## 2. Giao diện chiến đấu (trong trận)
- **Thứ tự xuất chiến**: tướng dẫn quân ra trận **đúng thứ tự đã sắp** ở màn chờ (lần lượt, không ra cùng lúc).
- **Trạng thái 2 tướng đang giao tranh**: **Thanh máu (HP) + sĩ khí/năng lượng + avatar** của hai tướng đang trực tiếp đánh nhau được **ghim ở hai góc trên** màn hình (góc trái = Công, góc phải = Thủ).
- **Tiếp viện**: trong lúc đánh, có thể có **tướng mới tham gia chi viện**; tướng vào sau **tự động xếp vào CUỐI hàng đợi** xuất trận. (Khớp lệnh "Mượn Binh 借兵" — xem [[systems/multiplayer-and-endgame]].)
- **Cutscene kỹ năng**: khi tướng thi triển chiến pháp đặc biệt (vd **"Xích Diễm Mê Trận" 赤焰迷阵** của Chu Du), hiện **phân cảnh cắt ngang màn** với **chân dung tướng + tên kỹ năng** nổi bật, kèm hiệu ứng cháy nổ / sát thương diện rộng. (Khớp asset `warSkillName` + `tacticalGeneralPicMax` + `skill/*`.)
- **Chiến thuật**: đồng hồ ngắn (vd **4s**) để chọn cách tấn công (Đột Kích / Phòng Thủ…), hiển thị **ngay trên đầu đạo quân**.

## 3. Cơ chế quân lính & đội hình (GIẢI QUYẾT HÌNH HỌC)
- **Số hàng quân/tướng**: mỗi tướng ra trận mang **tối thiểu 4 hàng quân**; các hàng **không tràn lên cùng lúc** mà **tiến lên tham chiến LẦN LƯỢT** (từng hàng một).
- **Bố cục 1 hàng**: mỗi hàng lính dàn mặc định thành **3 nhóm** đứng theo **đội hình hàng ngang**.
- **Số lính/nhóm**: mặc định **6 lính/nhóm → 18 lính/hàng ngang** (3 nhóm × 6). **Số lính/nhóm là BIẾN SỐ**, đổi theo nâng cấp/trạng thái lính.
- **Hiệu ứng trực quan**: mỗi đạo quân có **vòng tròn sáng dưới chân** (**xanh / vàng**) để phân biệt **phe**, trạng thái **nhận buff (Cổ vũ)**, hoặc **đang chọn chiến thuật**. (Liên quan asset `warState` bw/cw/fs — xem [[technical/asset-system-mapping]].)

> [!tip] Mô hình hóa hình học (chốt cho renderer)
> - Mỗi phe = hàng đợi tối đa **5 tướng** (一–五), đánh **lần lượt**; tại một thời điểm có **1 tướng/phe** đang giao tranh (HP/sĩ khí/avatar ghim 2 góc trên).
> - Mỗi tướng = **≥4 hàng** lính, các hàng vào trận **tuần tự**.
> - Mỗi hàng = **3 nhóm × N lính** (N mặc định 6, biến số).
> - Tiếp viện → nối **cuối** hàng đợi tướng.

## 4. Cơ chế môi trường (địa hình)
- **Tùy biến cảnh quan**: background chiến trường (đất trống, trại lính, tháp canh, rào chắn…) **có thể đổi** để đa dạng. (Khớp asset `warBG` ~18 nền — xem [[technical/asset-pipeline]].)
- **Giới hạn**: địa hình **tĩnh trong suốt trận**; việc đổi bối cảnh **chỉ có hiệu lực khi thiết lập TRƯỚC khi vào trận**.

## Pages updated from this source
- [[systems/battle-system]] (giao diện chờ, trong trận, hình học quân lính, tiếp viện, cutscene)
- [[technical/asset-system-mapping]] (vòng tròn dưới chân ↔ warState; địa hình ↔ warBG)
- [[GDD]] (§3.1 cấu trúc trận, §13 UI)
- [[claims]] (c-22), giải quyết [[contradictions#x-20260627-06]] + [[open-questions#q-20260627-05]]

## Notes
- Đặc tả nói "tối thiểu 4 hàng" → 4 là sàn, có thể nhiều hơn (khớp khái niệm 五排兵 và mở rộng 6 hàng Đào Viên).
- "2 tướng giao tranh ghim 2 góc" cho thấy mô hình **đấu tay đôi tuần tự**: front của mỗi hàng đợi đánh nhau, thua thì tướng kế tiến lên.
