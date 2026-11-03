# ScreenSaver2026 — Lịch Á Đông Mondrian cho macOS

Screensaver phong cách nghệ thuật Mondrian kết hợp Lịch Á Đông, hiển thị thời gian, can chi, lịch âm dương và danh ngôn hàng ngày.

![macOS Screensaver](https://img.shields.io/badge/platform-macOS-lightgrey.svg)
![license](https://img.shields.io/badge/license-MIT-blue.svg)

---

## 🚀 Cài đặt nhanh (1 Click)

Chỉ cần mở **Terminal** và chạy lệnh sau từ thư mục dự án:

```bash
chmod +x install.sh
./install.sh
```

Script sẽ tự động:
1. Đưa file giao diện HTML vào thư mục screensaver hệ thống (`~/Library/Screen Savers/mondrian.html`).
2. Thiết lập trình chạy WebView native.
3. Kích hoạt và đặt làm screensaver mặc định cho macOS.

---

## 🖥 Chạy thử Screensaver

Sau khi cài đặt xong, bạn có thể kiểm tra ngay bằng lệnh:
```bash
open -a ScreenSaverEngine
```
hoặc vào **System Settings (Cài đặt hệ thống)** > **Screen Saver**.

---

## 📁 Cấu trúc thư mục

```text
ScreenSaver2026/
├── index.html                  # File giao diện HTML / CSS / JS gốc
├── install.sh                  # Script cài đặt tự động cho macOS
├── NativeSource/
│   └── MondrianSaverView.swift # Source code Swift cho ai muốn tự build .saver riêng
└── README.md
```

---

## 🛠 Tự đóng gói thành file `.saver` bằng Xcode (Tùy chọn)

Nếu bạn muốn tự compile ra file binary `.saver` độc lập:
1. Mở Xcode, tạo dự án mới: **macOS** > **Screen Saver**.
2. Thêm file `NativeSource/MondrianSaverView.swift` và kéo file `index.html` vào target.
3. Trong `Info.plist` của target, đặt `Principal Class` là `MondrianSaverView`.
4. Build và nhấn đúp vào file `.saver` kết quả để cài đặt.

