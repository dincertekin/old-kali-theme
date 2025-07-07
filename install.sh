#!/bin/bash

set -e

echo "[+] Installing required packages..."
sudo apt update
sudo apt install -y menulibre gnome-tweaks gnome-shell-extensions gnome-shell-extension-prefs

echo "[+] Applying bash shell settings using kali-tweaks..."
kali-tweaks --set-shell backtrack --set-login-shell bash

echo "[+] Fixing 'Open in Terminal' for Desktop..."
gsettings set org.gnome.desktop.default-applications.terminal exec gnome-terminal

echo "[+] Extracting legacy themes and icons..."
THEMES_DIR="$HOME/.themes"
ICONS_DIR="$HOME/.icons"

mkdir -p "$THEMES_DIR" "$ICONS_DIR"

# Replace with actual theme/icon archive names
echo "[+] Copying themes and icons from local 'files/' folder..."
for file in ./files/*.zip; do
    unzip -o "$file" -d "$HOME/.local/share/"
done

echo "[+] Applying GTK and icon themes..."
gsettings set org.gnome.desktop.interface gtk-theme "Kali-Dark"
gsettings set org.gnome.desktop.wm.preferences theme "Kali-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix-Blue-Dark"

echo "[+] Setting fonts..."
gsettings set org.gnome.desktop.interface font-name "Cantarell 11"
gsettings set org.gnome.desktop.interface document-font-name "Sans 11"
gsettings set org.gnome.desktop.interface monospace-font-name "Monospace 11"

echo "[+] Installing GNOME extensions..."
echo "Please open Firefox/Chromium and visit: https://extensions.gnome.org"
echo "Install: 'Extension Manager' and 'Dash to Dock'"
echo "Then configure Dash to Dock manually via GNOME Tweaks."

echo "[+] Reminder: Customize terminal icon using 'menulibre' after script finishes."
echo "Do not run menulibre as root — it won't work!"

echo "[+] Optional: Set your desired wallpaper manually from GNOME Settings."

echo "[✔] Done! Log out and log back in for all changes to fully apply."
