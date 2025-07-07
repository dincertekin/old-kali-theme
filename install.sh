#!/bin/bash

set -e

echo "[+] Updating and installing required packages..."
sudo apt update
sudo apt install -y menulibre gnome-tweaks gnome-shell-extensions gnome-shell-extension-manager gnome-terminal dconf-cli git curl unzip wget

echo "[+] Switching to Bash shell with legacy BackTrack prompt..."
kali-tweaks --set-shell backtrack --set-login-shell bash

echo "[+] Fixing right-click 'Open in Terminal'..."
gsettings set org.gnome.desktop.default-applications.terminal exec gnome-terminal

echo "[+] Cloning legacy Kali themes from GitLab..."
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"
git clone https://gitlab.com/kalilinux/packages/kali-themes.git
git checkout 0dbeed74cc49da312b1fd73760f2da115b577ea7

echo "[+] Installing GTK themes..."
mkdir -p "$HOME/.themes"
cp -r "$TEMP_DIR/Window-Theme/Kali-Dark" "$HOME/.themes/"
cp -r "$TEMP_DIR/Window-Theme/Kali-Light" "$HOME/.themes/"
cp -r "$TEMP_DIR/Window-Theme/Kali-X-Dark" "$HOME/.themes/"
cp -r "$TEMP_DIR/Window-Theme/Kali-X" "$HOME/.themes/"

echo "[+] Installing icon themes..."
mkdir -p "$HOME/.icons"
cp -r "$TEMP_DIR/Icon-Theme/Flat-Remix-Blue-Dark" "$HOME/.icons/"
cp -r "$TEMP_DIR/Icon-Theme/Flat-Remix-Blue-Light" "$HOME/.icons/"
cp -r "$TEMP_DIR/Icon-Theme/Vibrancy-Kali-Dark" "$HOME/.icons/"
cp -r "$TEMP_DIR/Icon-Theme/Vibrancy-Kali-Full-Dark" "$HOME/.icons/"
cp -r "$TEMP_DIR/Icon-Theme/Vibrancy-Kali" "$HOME/.icons/"
cp -r "$TEMP_DIR/Icon-Theme/Zen-Kali-Dark" "$HOME/.icons/"
cp -r "$TEMP_DIR/Icon-Theme/Zen-Kali" "$HOME/.icons/"
rm -rf "$TEMP_DIR"

echo "[+] Applying theme settings..."
gsettings set org.gnome.desktop.interface gtk-theme "Kali-Dark"
gsettings set org.gnome.desktop.wm.preferences theme "Kali-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix-Blue-Dark"

echo "[+] Setting font preferences..."
gsettings set org.gnome.desktop.interface font-name "Cantarell 11"
gsettings set org.gnome.desktop.interface document-font-name "Sans 11"
gsettings set org.gnome.desktop.interface monospace-font-name "Monospace 11"

echo "[+] Installing and enabling Dash-to-Dock extension..."
EXT_DIR="$HOME/.local/share/gnome-shell/extensions"
mkdir -p "$EXT_DIR"

DASH_DOCK_UUID="dash-to-dock@micxgx.gmail.com"
DASH_DOCK_ZIP="/tmp/dash-to-dock.zip"

wget -O "$DASH_DOCK_ZIP" "https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v81.shell-extension.zip"
unzip -q "$DASH_DOCK_ZIP" -d "$EXT_DIR/$DASH_DOCK_UUID"
gnome-extensions enable "$DASH_DOCK_UUID"

echo "[+] Configuring Dash-to-Dock..."
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height false
dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 36
dconf write /org/gnome/shell/extensions/dash-to-dock/show-mounts false
dconf write /org/gnome/shell/extensions/dash-to-dock/intellihide true
dconf write /org/gnome/shell/extensions/dash-to-dock/click-action "'focus-or-previews'"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink true

echo "[+] Setting wallpaper..."
WALLPAPER_URL="https://gitlab.com/kalilinux/packages/kali-wallpapers/-/raw/kali/master/kali.jpg"
WALLPAPER_PATH="$HOME/Pictures/kali-wallpaper.jpg"
wget -O "$WALLPAPER_PATH" "$WALLPAPER_URL"
gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER_PATH"

echo "[+] NOTE: Changing application icons (e.g., terminal) must be done manually via 'menulibre'."
echo "Do NOT run menulibre as root."

echo "[✔] Done! Please log out and log back in to apply all settings."
