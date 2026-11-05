# MX Linux 23.6 to Windows 10 Transformation Runbook

[![OS: MX Linux 23.6](https://img.shields.io/badge/OS-MX%20Linux%2023.6-blue)](https://mxlinux.org/)
[![Desktop: Xfce](https://img.shields.io/badge/Desktop-Xfce-lightblue)](https://xfce.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

This repository contains a manual guide and an automated script to make MX Linux 23.6 (Xfce) look and work like Windows 10.

The setup installs the B00merang Windows 10 Light and Dark GTK themes along with the matching icon pack, adds the Segoe UI font family and Microsoft Core TrueType fonts, and configures Win10OS cursors with a fallback file so the pointer does not revert inside different apps. It also moves the Xfce panel to a bottom horizontal taskbar with Docklike icon pinning and includes optional instructions for styling the LightDM login screen.

## Quick start

Run `install.sh` in your terminal to download the themes, fonts, and cursors and apply the Xfce desktop settings automatically:

```bash
chmod +x install.sh
./install.sh
```

## Manual setup

### 1. Move the panel to the bottom
1. Open MX Tweak and select the Panel tab.
2. Check Display panel horizontally and set the position to Bottom.
3. Open Panel Preferences, switch to the Items tab, and enable Docklike Taskbar so open and pinned applications group into icons on the bar.

### 2. Install fonts and configure rendering
1. Install the Microsoft core fonts and font utilities: `sudo apt install -y ttf-mscorefonts-installer fontconfig`
2. Clone and run the Segoe UI installer:
   ```bash
   git clone https://github.com/mrbvrz/segoe-ui-linux.git /tmp/segoe-ui-linux
   cd /tmp/segoe-ui-linux && ./install.sh
   ```
3. In Settings, open Appearance and select the Fonts tab. Set the default font to Segoe UI Regular 9, hinting to Slight, and sub-pixel order to RGB.

### 3. Theme, icon, and cursor paths
GTK themes are stored in `~/.themes/Windows-10` and `~/.themes/Windows-10-Dark`, and the icon pack is installed in `~/.icons/Windows-10-Icons`. The cursor theme lives in `~/.icons/Win10OS-cursors`, with `~/.icons/default/index.theme` set to inherit `Win10OS-cursors` so applications keep the same pointer after you log out.

### 4. Save the session
1. Open Panel Profiles and save the current panel layout as `Windows-10-Permanent`.
2. Open Session and Startup, uncheck Automatically save session on logout on the General tab, and click Save Session on the Current Session tab.

## Interactive runbook and GitHub Pages

Open `index.html` in a browser to use the offline runbook with section checkboxes and copy buttons for each terminal command. To host it online with GitHub Pages, open your repository Settings, go to Pages, and set the source to deploy from the `main` branch root.
