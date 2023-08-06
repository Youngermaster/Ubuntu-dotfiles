sudo apt install -y meson libpulse-dev libpulse0 libcxxopts-dev bspwm polybar sxhkd alacritty brightnessctl dunst rofi lsd jq policykit-1-gnome git playerctl mpd ncmpcpp geany ranger mpc picom xdotool feh libxext-dev maim libwebp-dev xdg-user-dirs webp-pixbuf-loader physlock papirus-icon-theme
git clone https://github.com/cdemoulins/pamixer.git
meson setup build
meson compile -C build
meson install -C build

spicetify config current_theme Ziro
spicetify config color_scheme tokyonight
spicetify config extensions adblock.js
spicetify backup apply