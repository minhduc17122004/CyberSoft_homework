# Key Lab — Giải thích (đọc SAU khi tự quan sát)

## Cách thử
1. Bấm nút "+" ở 2-3 tile khác nhau để mỗi user có 1 counter khác nhau
   (ví dụ Alice=3, Bao=1, Chi=0...).
2. Để toggle "Dùng key: ValueKey(user.id)" ở trạng thái **TẮT**.
3. Bấm "Xáo trộn danh sách" vài lần. Quan sát: counter có đi theo
   đúng tên/màu avatar của từng người không?
4. Bật toggle lên, bấm "Reset", lặp lại bước 1-3. So sánh.

## Vì sao KHÔNG có key lại sai?

```dart
UserTile(user: user); // không truyền key
```

Khi Flutter build lại `ListView.builder` sau khi `_users.shuffle()`,
nó phải so khớp (reconcile) danh sách widget CŨ với danh sách widget
MỚI để quyết định: giữ nguyên State nào, huỷ State nào, tạo mới State
nào.

**Không có key**, Flutter chỉ có 1 cách để so khớp: dựa vào **VỊ TRÍ**
(index) và **type** của widget. Vị trí 0 cũ (kiểu `UserTile`) sẽ được
ghép với vị trí 0 mới (cũng kiểu `UserTile`) — bất kể `user` bên trong
có phải cùng 1 người hay không. Vì type khớp nhau, Flutter nghĩ "đây
vẫn là widget cũ, chỉ update dữ liệu thôi" → **giữ nguyên State cũ**
(bao gồm `_counter`) nhưng gán `widget.user` MỚI vào.

Hệ quả: counter bị "dính" vào **vị trí trong danh sách**, trong khi
tên/avatar lại đúng theo **dữ liệu** `user` mới nhất. Hai thứ không
còn khớp nhau → bug kinh điển "state đi lạc".

## Vì sao CÓ `ValueKey(user.id)` lại đúng?

```dart
UserTile(key: ValueKey(user.id), user: user);
```

Khi mỗi widget có key, Flutter so khớp bằng **key** thay vì vị trí: nó
dựng 1 bảng tra cứu "key cũ -> element cũ", rồi với mỗi widget mới,
tìm xem có key nào trùng không, bất kể widget đó đang ở vị trí nào.

Vì `ValueKey('u1')` luôn gắn với Alice dù cô ấy đang ở vị trí 0 hay vị
trí 4, Flutter luôn tìm đúng State cũ của Alice và gắn nó vào đúng vị
trí mới của Alice. `_counter` nhờ vậy **đi theo đúng người**, không
phụ thuộc thứ tự hiển thị.

## Bài học tổng quát
- Không phải lúc nào cũng cần key — chỉ cần khi:
  - Danh sách các widget **cùng kiểu** có thể bị **thêm/xoá/đổi thứ
    tự**, VÀ
  - Những widget đó có **State nội bộ** (hoặc animation, hoặc
    `GlobalKey` cần giữ identity) cần "đi theo" đúng dữ liệu.
- Key nên là thứ **ổn định và duy nhất theo dữ liệu** (id từ database,
  không phải index trong list) — dùng `ValueKey(index)` thực chất
  tương đương với KHÔNG CÓ KEY, vì index chính là vị trí.
