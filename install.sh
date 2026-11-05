#!/usr/bin/env bash
# ==============================================================================
# MX Linux 23.6 (Xfce) -> Windows 10 Automated Transformation Script
# ==============================================================================

set -euo pipefail

echo "==> [1/6] Updating repositories and installing prerequisites..."
sudo apt update
sudo apt install -y git fontconfig ttf-mscorefonts-installer

echo "==> [2/6] Downloading Windows 10 themes and icons..."
mkdir -p ~/.themes ~/.icons
if [ ! -d "$HOME/.themes/Windows-10" ]; then
    git clone https://github.com/B00merang-Project/Windows-10.git ~/.themes/Windows-10
fi
if [ ! -d "$HOME/.themes/Windows-10-Dark" ]; then
    git clone https://github.com/B00merang-Project/Windows-10-Dark.git ~/.themes/Windows-10-Dark
fi
if [ ! -d "$HOME/.icons/Windows-10-Icons" ]; then
    git clone https://github.com/B00merang-Artwork/Windows-10.git ~/.icons/Windows-10-Icons
fi

echo "==> [3/6] Installing Segoe UI fonts..."
rm -rf /tmp/segoe-ui-linux
git clone https://github.com/mrbvrz/segoe-ui-linux.git /tmp/segoe-ui-linux
(cd /tmp/segoe-ui-linux && chmod +x install.sh && ./install.sh)
fc-cache -f

echo "==> [4/6] Installing and locking Windows 10 cursors..."
rm -rf /tmp/Win10OS-cursors
git clone https://github.com/yeyushengfan258/Win10OS-cursors.git /tmp/Win10OS-cursors
cp -r /tmp/Win10OS-cursors/dist ~/.icons/Win10OS-cursors || cp -r /tmp/Win10OS-cursors ~/.icons/Win10OS-cursors

# Lock cursor system-wide for current user
mkdir -p ~/.icons/default
printf "[Icon Theme]\nInherits=Win10OS-cursors\n" > ~/.icons/default/index.theme

echo "==> [5/6] Applying Xfce desktop settings via xfconf..."
xfconf-query -c xsettings -p /Net/ThemeName -s "Windows-10-Dark" --create -t string
xfconf-query -c xfwm4 -p /general/theme -s "Windows-10-Dark" --create -t string
xfconf-query -c xsettings -p /Net/IconThemeName -s "Windows-10-Icons" --create -t string
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Win10OS-cursors" --create -t string
xfconf-query -c xsettings -p /Gtk/FontName -s "Segoe UI 9" --create -t string
xfconf-query -c xfwm4 -p /general/title_font -s "Segoe UI Semibold 9" --create -t string

echo "==> [6/6] Verifying installation..."
fc-list | grep -qi "Segoe UI" && echo "✓ Segoe UI font detected" || echo "! Warning: Segoe UI font missing"
[ -d "$HOME/.icons/Win10OS-cursors" ] && echo "✓ Cursors installed" || echo "! Warning: Cursors missing"

echo "=============================================================================="
echo "Transformation complete! Use 'MX Tweak' -> 'Panel' to position taskbar at bottom."
echo "Log out and back in to apply full cursor and session changes."
echo "=============================================================================="
