# old-kali-theme

A simple automation script to bring back the classic **Kali Linux look**, including old icons, themes, and configurations — as seen in earlier Kali releases.

## About

Kali Linux had several visual changes over the years. But many users (including myself) still prefer the old look of it for its familiarity. This script restores that legacy(old) style.

When browsing on the web, I came across a helpful [Reddit post](https://www.reddit.com/r/Kalilinux/comments/tsu3x8/comment/i2txr7k/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) where a user wrote tutorial on how to manually revert Kali to its old look. Inspired by their tutorial and after discovering Kali’s legacy themes and assets hosted on GitLab, I decided to automate the entire process and share it with the community.

## Features

**!!** You have to install GNOME manually on Kali first.
- Restores old **icon themes** (Zen-Kali)
- Applies classic **GTK theme** (Kali-X)
- Changes **terminal prompt** to old one
- Automated installation with minimal user input

## Getting Started

Clone the repository and run the installer script:

```bash
git clone https://github.com/dincertekin/old-kali-theme.git
cd old-kali-theme
chmod +x install.sh
./install.sh
```
**Note:** The script may require sudo access for installing themes and dependencies.

## Credits

**Original tutorial:** Found on Reddit — special thanks to the user who shared the method step-by-step.  
**Themes and assets:** Latest ones gathered from Kali Linux’s GitLab repositories:
[Window Theme](https://gitlab.com/kalilinux/packages/kali-themes/-/tree/0dbeed74cc49da312b1fd73760f2da115b577ea7/Window-Theme)
[Icon Theme](https://gitlab.com/kalilinux/packages/kali-themes/-/tree/0dbeed74cc49da312b1fd73760f2da115b577ea7/Icon-Theme)
[Wallpaper](https://gitlab.com/kalilinux/packages/kali-wallpapers/-/blob/kali/master/legacy/backgrounds/kali-2.0/kali-2.0-2560x1440.png)

## Disclaimer

This script modifies your desktop environment. Use at your own discretion. It's tested on current Kali Rolling releases, but might need tweaks for older versions.
