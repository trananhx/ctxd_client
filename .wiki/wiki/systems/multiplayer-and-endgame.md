---
title: Chế độ nhiều người & cuối game
category: systems
tags: [multiplayer, endgame, national-war, cross-server, world-boss]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Chế độ nhiều người & cuối game

Vòng lặp cuối game của **Công Thành Xưng Đế** (攻城掠地, bản webgame 傲世堂 2013) xoay quanh **Quốc chiến (国战)** thời gian thực liên tục, chồng lên một loạt sự kiện cạnh tranh theo ngày và liên server (跨服). Đây là nơi người chơi rời khỏi nội dung PvE đơn (副本) để tham gia tranh đoạt lãnh thổ tập thể giữa ba nước. Trang này tổng hợp các chế độ nhiều người chính, liên kết chặt với [[systems/city-conquest]] (cơ chế công thành), [[world/world-map-and-campaign]] (bản đồ thế giới) và [[systems/progression-and-vip]] (mốc cấp mở khóa).

> [!info] Ý đồ thiết kế
> Toàn bộ "cuối game" của bản 2013 là một sandbox PvP tập thể: thay vì leo bậc cá nhân, người chơi được kéo vào nhịp ngày (3 khung giờ Quốc chiến) và nhịp tuần/mùa (sự kiện liên server). Hệ thống thưởng kinh nghiệm và tài nguyên buộc người chơi cấp cao phải tham gia tập thể để tiến cấp hiệu quả.

## Quốc chiến (国战)

Quốc chiến là trụ cột cuối game. **Mở khóa khi chủ tướng (主将) đạt cấp 30 VÀ sở hữu một vũ khí phẩm chất lục (绿色武器)** — điều kiện này được nguồn chính thức 傲世堂 ghi nguyên văn và lặp lại nhất quán trên nhiều trang hướng dẫn (độ tin: confirmed).

Bản đồ thế giới (xem chi tiết [[world/world-map-and-campaign]]) được chia cho **ba nước Ngụy (魏), Thục (蜀), Ngô (吴)**, gồm **247 thành trì và quan ải (城池/关隘) cộng 3 thành Man tộc (蛮族城)**. Con số 247 là tổng số thành + ải gộp chung; 3 thành Man được đếm riêng. Hệ thống sương mù (迷雾) che bản đồ, người chơi khám phá để mở rương/thưởng. Mốc 247 thành + 3 thành Man được cả nguồn Trung và nguồn Việt (gamek.vn) xác nhận song ngữ (confirmed).

### Cơ chế chiếm thành

- **Thành vô chủ**: di chuyển tới và đánh bại NPC trong thành để chiếm (xem [[systems/city-conquest]]).
- **Thành của nước địch**: phải đánh bại người chơi nước địch mới chiếm được.
- Càng nhiều thành thì **Quốc lực (国力)** càng cao và phần thưởng **Quân tư (军资)** càng lớn.
- **Bảng giết địch (杀敌榜)** xếp hạng người chơi theo số kẻ địch hạ trong Quốc chiến, thưởng bạc (银币).

### Quy tắc chiến đấu lõi

Hai quy tắc dưới đây là cơ chế cốt lõi, ghi nguyên văn ở trang chính thức (confirmed) và liên quan trực tiếp tới [[systems/battle-system]]:

- **Bị vây thành**: khi một thành bị bao vây, người chơi của nước bị vây **không thể xả chiến pháp (战法)** trong thành đó. Đây là đòn trừng phạt chiến thuật nặng — kết hợp với [[systems/tactics-and-rage]] để hiểu giá trị của việc bị khóa chiến pháp.
- **Đột tiến (突进)**: khi một bên đông hơn bên kia **trên 3 lần (3:1)**, bên đông có thể đột tiến, tấn công thẳng vào các thành hậu phương của địch, tiếp tục cho tới khi tỉ lệ tụt dưới 3:1.

> [!tip] Lưu ý khi dựng lại
> Quy tắc "bị vây không xả được chiến pháp" và "đột tiến khi đông >3 lần" cần đếm số người chơi đang hiện diện ở chiến trường theo thời gian thực. Khi dựng lại, cần một bộ đếm phe theo ô/thành để bật/tắt khả năng đột tiến và khóa chiến pháp.

### Kinh nghiệm Quốc chiến

Quốc chiến cho khoảng **+50% kinh nghiệm so với phụ bản PvE (副本)**. Lưu ý phân biệt hai mốc cấp (cả hai đều confirmed):

- **Lv30 + vũ khí lục**: mở khóa TÍNH NĂNG Quốc chiến.
- **Lv41**: ngưỡng để nhiệm vụ Quốc chiến thế giới trở thành nguồn lên cấp chính (cho +50% XP so với 副b). Từ sau cấp 40, người chơi chủ yếu lên cấp qua Quốc gia nhiệm vụ.

"Một ngày 3 trận Quốc chiến" được xác nhận và khớp với ba khung giờ Quốc gia nhiệm vụ bên dưới.

## Quốc gia nhiệm vụ (国家任务)

Chạy **3 lần/ngày** trong các khung giờ cố định (confirmed):

| Khung giờ |
| --- |
| 10:00 – 11:30 |
| 15:00 – 16:30 |
| 20:00 – 21:30 |

Có **6 loại** nhiệm vụ (confirmed), thưởng "hải lượng" kinh nghiệm và tài nguyên:

1. **Chiếm lĩnh thành trì (占领城池)**
2. **Man tộc xâm nhập (蛮族入侵)**
3. **Bảng giết địch tỉ thí (杀敌榜比拼)**
4. **Phú giáp thiên hạ (富甲天下)** — tích lũy tài sản
5. **Tỉ võ tích phân tái (比武积分赛)** — đấu võ tính điểm
6. **Khai cương khoách thổ (开疆扩土)** — mở rộng lãnh thổ

> [!question] Câu hỏi mở
> Cơ chế tính điểm, hệ đoạn vị (段位) và bảng thưởng cụ thể của đấu tích phân (比武积分赛) chưa được nguồn chốt rõ. Cũng chưa rõ liệu có tồn tại một "đấu trường (竞技场)" PvP cá nhân riêng tách khỏi 比武积分赛 và các bảng liên server hay không.

## Tổ chức: Quân đoàn (军团) → Liên minh (联盟)

- **Quân đoàn (军团)**: đơn vị bang hội đầu game, giới hạn thành viên và lãnh địa nhỏ. Lãnh đạo gồm Chính/Phó Quân đoàn trưởng (正/副军团长) và Đô đốc (都督) — những chức này có quyền tuyên chiến liên server.
- **Liên minh / Thế lực (联盟 / 势力)**: nâng cấp giữa game, **tăng mạnh trần thành viên và lãnh địa**, mở lối chơi liên hợp giữa các thế lực (độ tin: partially-confirmed).

## Quốc gia (国家) và Quốc gia thí luyện (国家试炼)

Ba phe Ngụy/Thục/Ngô lên cấp quốc gia qua nhiệm vụ **xuất chinh Man tộc (出征蛮族)**. Quốc gia cấp 3 có thể "mua chuộc" Man tộc xâm nhập nước địch.

**Quốc gia thí luyện (国家试炼)** (partially-confirmed): quốc gia từ cấp 3 trở lên, kinh nghiệm quốc gia quá nửa, do Quốc vương/Nhất phẩm quan (国王/一品官) phát động; thách đấu thủ đô Man tộc trong **2 giờ**, chỉ mở được trong **khung 9:00–21:00**; thưởng kinh nghiệm nhân vật, kinh nghiệm quốc gia và **Man Vương Lệnh (蛮王令)**. Ngoài ra còn **Quốc gia cấm vệ quân (国家禁卫军)** được điều vào Quốc chiến khi một thành trong phạm vi 3 ô quanh thủ đô bị chiếm.

> [!warning] Độ tin trung bình
> Chi tiết NPC theo cấp quốc gia (ví dụ "quốc gia cấp 4 = NPC 70, cấp 5 = NPC 80") chỉ đến từ một nguồn thứ cấp, chưa được tài liệu chính thức kiểm chứng — xếp độ tin thấp.

## Bảng công thành ngày (每日攻城榜)

**Mở khóa ở cấp 75** (confirmed). Tính điểm theo hành động:

| Hành động | Điểm |
| --- | --- |
| Công thành (攻城) | +5 |
| Trợ công (助攻) | +2 |
| Trợ trận (助阵) | +1 |

Thưởng theo mốc điểm tích lũy, dạng rương báu (kinh nghiệm tới 16.000, lương thảo tới 32.000, hoặc lệnh chiêu mộ); reset mỗi ngày lúc 23:10, tối đa tích 100 rương:

| Mốc điểm | Số rương |
| --- | --- |
| 30 | 6 |
| 60 | 8 |
| 100 | 10 |
| 150 | 14 |
| 200 | 18 |

## Giải đấu tướng: Võ Đấu Hội (武斗会) / Võ Tướng Đối Quyết (武将对决)

> [!info] Bổ sung từ ảnh game thật ([[sources/screenshot-somo-battle-2026-06-27]])
> Đây là chế độ **PvP đấu tướng theo giải**, nhiều khả năng chính là hiện thân của nhiệm vụ "Tỉ võ tích phân tái (比武积分赛)" ở trên, hoặc một giải riêng liên quan.

Quan sát từ màn **武将对决 / 武斗会 8进4** (giải đấu thể thức loại trực tiếp, vòng 8→4):
- Hai phe dàn **đội hình 5 vị trí (一二三四五)**, mỗi vị trí một tướng (hoặc **cặp ghép** như 周瑜●诸葛亮), hiện **chiến lực (战力)** + cấp + **icon binh chủng** từng tướng. Liên quan đội hình ở [[systems/battle-system]] và bộ tướng ở [[entities/generals]].
- Trận diễn ra theo **kiểu địa hình** (ảnh là "**平原战**" — đánh đồng bằng), gắn với buff địa hình ([[systems/troop-types]]).
- **Khán chiến cổ vũ — đánh trống (击鼓支持)**: người xem có thể "đánh trống" ủng hộ **phe Công** hoặc **phe Thủ**, hiển thị **số người ủng hộ** (vd 25 vs 259). Cơ chế khán giả/cổ vũ này nên đưa vào thiết kế UI giải đấu.
- Trạng thái "**战报等待中**" (đang chờ chiến báo) + tỉ số "**0胜**" (0 thắng) mỗi phe → giải đấu nhiều ván (thể thức 3局2胜 — đánh 3 ván thắng 2).

> [!question] Câu hỏi mở
> 武斗会/武将对决 là giải same-server hay liên server, lịch chạy, và cách tính điểm/xếp hạng chưa rõ — cần thêm ảnh/nguồn. Quan hệ chính xác với 比武积分赛 cũng cần xác nhận.

## Thế giới BOSS: Thảo phạt Đổng Trác (讨伐董卓)

Sự kiện world boss (confirmed). Đổng Trác (董卓) đóng tại **Đổng Trác doanh trại (董卓营寨)**:

- Tấn công Đổng Trác để nhận tài nguyên và **roi (鞭子)** — tối đa **20 roi/ngày**.
- Dùng roi quất (鞭笞) sẽ tích **Cuồng nộ trị (狂怒值)**. Khi đầy thanh cuồng nộ, vào trạng thái cuồng nộ cho **thưởng gấp đôi** kèm **Quốc bảo (国宝)**.
- Bể tài nguyên/roi làm mới lúc **10:00 / 15:00 / 20:00**, reset hoàn toàn lúc 0:00.

> [!warning] Phân biệt thanh nộ khí
> Cuồng nộ trị (狂怒值) của sự kiện Đổng Trác là thanh riêng của sự kiện, KHÔNG phải Nộ khí (怒气) — thanh nộ trong chiến đấu theo lượt mô tả ở [[systems/tactics-and-rage]]. Đừng nhầm hai cơ chế này khi dựng lại.

## Liên server (跨服)

> [!warning] Phạm vi phiên bản
> Chưa xác nhận được bản Việt hóa ra mắt 2013 đã có sẵn các giải liên server hay chúng được thêm về sau. Nguồn Trung tham chiếu các kỳ giải tranh bá đánh số tới hơn 50, ngụ ý chúng là nội dung bổ sung dần. Xem thêm [[decisions/game-version-scope]].

### Tranh bá liên server (跨服争霸赛)

Giải đấu loại trực tiếp lặp lại (partially-confirmed): hải tuyển → **16 mạnh → 4 mạnh**. Cả 16 người vào vòng đều nhận trân bảo; nhà vô địch nhận **Tử sắc san hô (紫色珊瑚)**; sau giải có **Khánh công yến (庆功宴)**. Người chơi cấp 70+ có thể quan chiến cổ vũ từ vòng 16 mạnh để nhận **Yêu thỉnh hàm (邀请函)**.

### Thành chiến liên server (跨服城战 / 跨服入侵)

Sự kiện kéo dài **6 ngày**, tranh đoạt **đặc sản (特产)** của server khác (partially-confirmed):

- Quân đoàn đạt định mức giết địch trong ngày sẽ nhận **quyền tuyên chiến (宣战权)** cho ngày hôm sau.
- Sau khi tuyên chiến có **6 phút chuẩn bị** (một nguồn ghi prep 6 phút).
- Tính điểm: **đội NPC +10 điểm, đội người chơi +20 điểm**.
- Thưởng theo hạng cá nhân và quân đoàn: **Lương thảo (粮草) / Hổ bôn tệ (虎贲币) / Đồ lục huân chương (屠戮勋章)**.
- Đặc sản theo nguyên tắc đến trước được trước; cùng một đặc sản chỉ tuyên chiến được một lần.

### Các bảng đấu liên server khác

**Tiên phong tái / Tinh anh lôi đài tái (跨服先锋赛 / 精英擂台赛)** là các bảng xếp hạng PvP liên server, thưởng điểm và trân bảo cao cấp. Lưu ý: tướng trận (như Lữ Mông 吕蒙, Ngụy Diên 魏延) không hưởng buff địa hình ở các bảng này — liên quan tới [[systems/formation-system]] và [[entities/generals]].

> [!question] Câu hỏi mở
> Bảng thưởng chi tiết theo từng hạng của 跨服城战 và 跨服争霸赛 (số lượng chính xác 粮草/虎贲币/屠戮勋章/紫色珊瑚 theo hạng) chưa tìm được nguồn xác nhận.

## Nguồn

- 国战系统 (傲世堂 chính thức): https://gc.aoshitang.com/news/ziliao/612012121118034329969.html
- 攻城掠地国战怎么玩 (3DM页游): https://yeyou.3dmgame.com/gl/12477.html
- 71-80级升级攻略 含每日攻城榜 (酷玩吧): http://www.kuwan8.com/news/20130806/n4241.html
- 国家试炼指南 (视游): https://www.shiyouhome.com/gcld/gonglue/2148.html
- 讨伐董卓 (602): https://gcld.602.com/html/46287.html
- 跨服入侵夺特产 城战赛季 (TapTap): https://www.taptap.cn/moment/311559960032968988
- 第16届跨服争霸赛 (九游): https://www.9game.cn/news/611049.html
- Công Thành Xưng Đế (gamek.vn — xác nhận 247 thành + 3 thành Man): https://gamek.vn/cong-thanh-xung-de.htm

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]]

## Backlinks

- [[overview]]
- [[systems/city-conquest]]
- [[world/world-map-and-campaign]]
- [[systems/progression-and-vip]]
- [[systems/battle-system]]
- [[systems/tactics-and-rage]]
