#!/bin/bash
set -e

echo "======================================================"
echo "  Cài đặt Lịch Á Đông Mondrian ScreenSaver cho macOS  "
echo "======================================================"

SCREENSAVER_DIR="$HOME/Library/Screen Savers"
SAVER_BUNDLE="$SCREENSAVER_DIR/WebViewScreenSaver.saver"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$SCREENSAVER_DIR"

# 1. Cài đặt WebViewScreenSaver nếu chưa có
if [ ! -d "$SAVER_BUNDLE" ]; then
    echo "[1/4] Đang tải WebViewScreenSaver engine..."
    curl -L -s -o /tmp/WebViewScreenSaver.zip "https://github.com/liquidx/webviewscreensaver/releases/download/v2.5/WebViewScreenSaver-2.5.zip"
    unzip -q -o /tmp/WebViewScreenSaver.zip -d "$SCREENSAVER_DIR/"
    rm -f /tmp/WebViewScreenSaver.zip
fi

# 2. Nhúng index.html và cấu hình URL mặc định vào trong bundle
echo "[2/4] Cập nhật tài nguyên và URL mặc định vào screensaver..."
cp "$SCRIPT_DIR/index.html" "$SAVER_BUNDLE/Contents/Resources/index.html"

TARGET_URL="https://namxhung99.github.io/ScreenSaver2026/"

python3 -c "
import plistlib
p = '$SAVER_BUNDLE/Contents/Info.plist'
with open(p, 'rb') as f:
    d = plistlib.load(f)
d['WVSSDefaultAddressURL'] = '$TARGET_URL'
with open(p, 'wb') as f:
    plistlib.dump(d, f)
"
codesign --force --deep --sign - "$SAVER_BUNDLE" 2>/dev/null || true
xattr -cr "$SAVER_BUNDLE"

# 3. Ghi cấu hình sandbox preferences
echo "[3/4] Đồng bộ cấu hình macOS ScreenSaver..."
UUID=$(system_profiler SPHardwareDataType 2>/dev/null | grep "Hardware UUID" | awk '{print $3}')
if [ -z "$UUID" ]; then
    UUID=$(ioreg -d2 -c IOPlatformExpertDevice | awk -F\" '/IOPlatformUUID/{print $(NF-1)}')
fi

python3 -c "
import plistlib, os

uuid = '$UUID'
url = '$TARGET_URL'

data = {
    'kScreenSaverFetchURLs': False,
    'kScreenSaverURLList': [{'kScreenSaverURL': url, 'kScreenSaverTime': 86400}]
}

targets = [
    os.path.expanduser(f'~/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/WebViewScreenSaver.{uuid}.plist'),
    os.path.expanduser('~/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/WebViewScreenSaver.plist'),
    os.path.expanduser(f'~/Library/Preferences/ByHost/WebViewScreenSaver.{uuid}.plist'),
    os.path.expanduser('~/Library/Preferences/WebViewScreenSaver.plist'),
    os.path.expanduser(f'~/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/net.liquidx.WebViewScreenSaver.{uuid}.plist'),
    os.path.expanduser('~/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/net.liquidx.WebViewScreenSaver.plist'),
    os.path.expanduser(f'~/Library/Preferences/ByHost/net.liquidx.WebViewScreenSaver.{uuid}.plist'),
    os.path.expanduser('~/Library/Preferences/net.liquidx.WebViewScreenSaver.plist')
]

for t in targets:
    os.makedirs(os.path.dirname(t), exist_ok=True)
    with open(t, 'wb') as f:
        plistlib.dump(data, f)
"

# Đặt làm ScreenSaver chính
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName WebViewScreenSaver path "$SAVER_BUNDLE" type 0
killall cfprefsd 2>/dev/null || true
killall legacyScreenSaver 2>/dev/null || true

echo "[4/4] Hoàn tất!"
echo "======================================================"
echo " Đã cấu hình screensaver thành công!"
echo " URL: $TARGET_URL"
echo " Xem thử ngay: open -a ScreenSaverEngine"
echo "======================================================"
