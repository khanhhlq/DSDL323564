# Yêu cầu thiết kế mạch điều khiển 10 LED bằng Verilog

Thiết kế một module Verilog điều khiển **10 LED (`led_out[9:0]`)** với các yêu cầu sau:

## 1. Ngõ vào và ngõ ra

* `clk`: Clock hệ thống **50 MHz**.
* `reset`: Tín hiệu reset.
* `test_manual`: Switch chọn chế độ **TEST** hoặc **MANUAL**.
* `mode[1:0]`: Hai switch dùng để chọn **4 chế độ LED** khi ở MANUAL.
* `speed`: Một switch dùng để chọn tốc độ hoạt động **1 MHz hoặc 5 MHz**.
* `led_out[9:0]`: Ngõ ra điều khiển **10 LED**.

## 2. Chế độ TEST

Khi `test_manual` chọn **TEST**:

* Cả **10 LED cùng sáng và cùng tắt luân phiên**.
* LED hoạt động theo kiểu chớp/tắt liên tục.
* Tốc độ chớp phụ thuộc vào switch `speed`.

Ví dụ:

`0000000000 → 1111111111 → 0000000000 → ...`

## 3. Chế độ MANUAL

Khi `test_manual` chọn **MANUAL**, sử dụng `mode[1:0]` để chọn một trong 4 chế độ:

### Mode 1 – Dịch từ trái sang phải

LED sáng chạy lần lượt từ trái sang phải:

`1000000000 → 0100000000 → 0010000000 → ... → 0000000001 → lặp lại`

### Mode 2 – Dịch từ phải sang trái

LED sáng chạy lần lượt từ phải sang trái:

`0000000001 → 0000000010 → 0000000100 → ... → 1000000000 → lặp lại`

### Mode 3 – Dịch từ trong ra ngoài

Hai LED bắt đầu sáng ở vị trí gần trung tâm, sau đó dịch dần ra hai phía ngoài:

`0000110000 → 0001001000 → 0010000100 → 0100000010 → 1000000001 → lặp lại`

### Mode 4 – Dịch từ ngoài vào trong

Hai LED bắt đầu sáng ở hai LED ngoài cùng, sau đó dịch dần vào trung tâm:

`1000000001 → 0100000010 → 0010000100 → 0001001000 → 0000110000 → lặp lại`

## 4. Điều khiển tốc độ

Clock đầu vào của hệ thống là:

`50 MHz`

Sử dụng switch `speed` để lựa chọn hai tốc độ hoạt động:

* `speed = 0`: **1 MHz**
* `speed = 1`: **5 MHz**

Cần sử dụng **bộ chia/tạo enable từ clock 50 MHz** để tạo tốc độ tương ứng cho quá trình thay đổi trạng thái LED.

## 5. Reset

Khi `reset` được kích hoạt:

`led_out = 10'b0000000000`

Tất cả 10 LED phải **tắt ngay và trở về trạng thái ban đầu**.

Sau khi bỏ reset, mạch tiếp tục hoạt động theo chế độ TEST/MANUAL và tốc độ đang được chọn.
