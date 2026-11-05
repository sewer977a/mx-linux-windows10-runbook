# MX Linux 23.6 to Windows 10 Transformation Runbook

[![OS: MX Linux 23.6](https://img.shields.io/badge/OS-MX%20Linux%2023.6-blue)](https://mxlinux.org/)
[![Desktop: Xfce](https://img.shields.io/badge/Desktop-Xfce-lightblue)](https://xfce.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A complete step-by-step and automated runbook for transforming MX Linux 23.6 (Xfce) into a Windows 10 visual environment.

## Overview
- **Visual Style:** B00merang Windows 10 Light and Dark GTK themes
- **Icons:** B00merang Windows 10 Icons
- **Fonts:** Segoe UI font family and Microsoft Core TrueType fonts
- **Cursors:** Win10OS cursors with permanent fallback lock
- **Taskbar:** Bottom-aligned horizontal panel with Docklike pinning
- **Login Screen:** Optional Windows 10 LightDM styling

---

## Quick Start (Automated Script)

Run the automated setup script to install all assets and configure Xfce settings:

```bash
chmod +x install.sh
./install.sh
```

---

## Manual Step-by-Step Instructions

### 1. Panel Configuration
1. Open **MX Tweak** -> **Panel** tab.
2. Select **Display panel horizontally** and set position to **Bottom**.
3. In **Panel Preferences** -> **Items**, enable **Docklike Taskbar** for pinned icon grouping.

### 2. Fonts & Rendering
1. Install Microsoft fonts: `sudo apt install -y ttf-mscorefonts-installer fontconfig`
2. Install Segoe UI:
   ```bash
   git clone https://github.com/mrbvrz/segoe-ui-linux.git /tmp/segoe-ui-linux
   cd /tmp/segoe-ui-linux && ./install.sh
   ```
3. In **Settings -> Appearance -> Fonts**, set font to **Segoe UI Regular 9**, Hinting to **Slight**, and Sub-pixel order to **RGB**.

### 3. Cursors & Icons
- Themes: `~/.themes/Windows-10` and `~/.themes/Windows-10-Dark`
- Icons: `~/.icons/Windows-10-Icons`
- Cursors: `~/.icons/Win10OS-cursors` with fallback `~/.icons/default/index.theme`

### 4. Session Persistence
1. Open **Panel Profiles** -> Save current panel as `Windows-10-Permanent`.
2. In **Session and Startup**, uncheck *Automatically save session on logout*, then click *Save Session*.

---

## Live Interactive Runbook & GitHub Pages Preview
View the interactive HTML version with progress checklists and one-click copy buttons by opening `index.html` locally in your browser, or enable **GitHub Pages** (`Settings` -> `Pages` -> `Deploy from a branch: main / (root)`) to host a live preview directly from this repository.
