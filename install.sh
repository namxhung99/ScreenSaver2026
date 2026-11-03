#!/bin/bash
set -e

echo "======================================================"
echo "  Cài đặt Lịch Á Đông Mondrian ScreenSaver cho macOS  "
echo "======================================================"

SCREENSAVER_DIR="$HOME/Library/Screen Savers"
HTML_DEST="$SCREENSAVER_DIR/mondrian.html"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$SCREENSAVER_DIR"

# 1. Sao chép file HTML vào thư mục Screen Savers
echo "[1/4] Đang sao chép file HTML..."
cp "$SCRIPT_DIR/index.html" "$HTML_DEST"

# 2. Cài đặt WebViewScreenSaver nếu chưa có
if [ ! -d "$SCREENSAVER_DIR/WebViewScreenSaver.saver" ]; then
    echo "[2/4] Đang tải WebViewScreenSaver engine..."
    curl -L -s -o /tmp/WebViewScreenSaver.zip "https://github.com/liquidx/webviewscreensaver/releases/download/v2.5/WebViewScreenSaver-2.5.zip"
    unzip -q -o /tmp/WebViewScreenSaver.zip -d "$SCREENSAVER_DIR/"
    rm -f /tmp/WebViewScreenSaver.zip
    xattr -cr "$SCREENSAVER_DIR/WebViewScreenSaver.saver"
else
    echo "[2/4] WebViewScreenSaver engine đã tồn tại."
fi

# 3. Lấy Hardware UUID của máy
echo "[3/4] Cấu hình ScreenSaver mặc định..."
UUID=$(system_profiler SPHardwareDataType 2>/dev/null | grep "Hardware UUID" | awk '{print $3}')
if [ -z "$UUID" ]; then
    UUID=$(ioreg -d2 -c IOPlatformExpertDevice | awk -F\" '/IOPlatformUUID/{print $(NF-1)}')
fi

FILE_URL="file://$HTML_DEST"

# Sử dụng Python để cập nhật preferences ByHost và Container
python3 -c "
import plistlib, os

uuid = '$UUID'
file_url = '$FILE_URL'

data = {
    'kScreenSaverFetchURLs': False,
    'kScreenSaverURLList': [
        {
            'kScreenSaverURL': file_url,
            'kScreenSaverTime': 86400
        }
    ]
}

# Preferences paths
paths = [
    os.path.expanduser(f'~/Library/Preferences/ByHost/net.liquidx.WebViewScreenSaver.{uuid}.plist'),
    os.path.expanduser('~/Library/Preferences/net.liquidx.WebViewScreenSaver.plist'),
    os.path.expanduser(f'~/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/net.liquidx.WebViewScreenSaver.{uuid}.plist'),
    os.path.expanduser('~/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/net.liquidx.WebViewScreenSaver.plist')
]

for p in paths:
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, 'wb') as f:
        plistlib.dump(data, f)
"

# Đặt làm ScreenSaver chính
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName WebViewScreenSaver path "$SCREENSAVER_DIR/WebViewScreenSaver.saver" type 0
killall cfprefsd 2>/dev/null || true

echo "[4/4] Hoàn tất!"
echo "======================================================"
echo " Đã kích hoạt screensaver thành công!"
echo " Bạn có thể chạy thử bằng lệnh: open -a ScreenSaverEngine"
echo "======================================================"

