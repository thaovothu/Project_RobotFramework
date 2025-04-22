#  Robot Framework Test Project

**Họ và tên:      Võ Thu Thảo
**Mã sinh viên:   123210150
**Lớp:            21PFIEV3

---

## Yêu cầu hệ thống

- Python >= 3.10
- pip (Python package manager)
- Google Chrome (hoặc trình duyệt khác nếu tùy chỉnh)
- [ChromeDriver](https://chromedriver.chromium.org/) phù hợp với phiên bản trình duyệt *(nếu không dùng `webdriver-manager`)*

---

## Cài đặt môi trường

Tạo môi trường ảo (virtual environment):

```bash
python3 -m venv venv
source venv/bin/activate    #MacOS   , ở đây em dùng MacOS nên em sẽ sử dụng dòng lệnh này
venv\Scripts\activate       #Window


Cài thư viện cần thiết

pip install -r requirements.txt
pip install robotframework robotframework-seleniumlibrary webdriver-manager


Cấu trúc thư mục

Project_RobotFramework/
├── tests/                     # Chứa các file .robot
│   ├── dangky.robot
│   └── dangnhap.robot
│   └── themsanpham.robot
│   └── timkiem.robot
│   └── xemgiohang.robot
│
├── reports/                   # Chứa file kết quả sau khi chạy test, đượcx xuất tự động
│   ├── log.html
│   └── report.html
│   └── output.xml
│
├── resources/                 # Chứa file có biến dùng chung, và các keywords định nghĩa riêng giúp tái sử dụng và rút gọn testcase
│   ├── keywords.robot
│   └── variables.robot
│
├── requirements.txt
└── README.md
└── venv                       # Môi trường ảo, có hoặc không, nhưng ở đây em dùng MacOS nên em sẽ ưu tiên cài môi trường ảo



Cách chạy test

robot --outputdir reports tests/ #Chúng ta sẽ chạy toàn bộ test suites có trong tests/
#Nếu muốn chạy riêng lẽ từng file .robot thì chạy lần lượt các dòng dưới
robot --outputdir reports dangky.robot
robot --outputdir reports dangnhap.robot
robot --outputdir reports themsanpham.robot
robot --outputdir reports timkiem.robot
robot --outputdir reports xemgiohang.robot




Nhận xét kết quả sau khi chạy:

Tổng Quan Kết Quả Test
Tổng số test: 14
Số test pass: 12
Số test fail: 2
-->Tỷ lệ pass: 85.7% — khá tốt
-->Thời gian thực thi: 2 phút 30 giây

Chi Tiết 2 Test Case Bị Fail
1. Test đăng ký với email sai định dạng (sai_dinh_dang)
- Dự kiến: Hệ thống hiển thị lỗi định dạng email không hợp lệ 'Invalid email address'
- Thực tế: Hệ thống không báo lỗi, vẫn chuyển sang trang đăng ký hợp lệ.
--> Nhận xét: Đây là lỗi logic nghiêm trọng phía backend hoặc frontend vì thiếu kiểm tra định dạng email, dễ gây rác dữ liệu trong hệ thống.

**Lỗi thứ 2 sinh ra vì sai sót của lỗi thứ nhất

2. Test đăng nhập với email đã đăng ký nhưng sai định dạng (sai_dinh_dang)
- Dự kiến: Hiển thị thông báo lỗi định dạng email không hợp lệ 'Your email is in the wrong format!'
- Thực tế: Hệ thống vẫn chuyển đến trang chủ — nghĩa là đăng nhập thành công dù Email sai định dạng .
--> Nhận xét: Đây là lỗ hổng bảo mật, nếu không kiểm soát chặt chẽ có thể cho phép truy cập trái phép.


