sudo apt update -y

# Installing dependencies
sudo apt install picom rofi rofi-dev acpi acpid acpi-call-dkms upower lxappearance jq inotify-tools polkitd xdotool xclip gpick ffmpeg blueman redshift pipewire pipewire-audio-client-libraries pipewire-pulse pamix brightnessctl feh scrot mpv mpd mpc mpdris2 python-mutagen-doc python3-mutagen ncmpcpp playerctl -y

# Installing AwesomeWM
sudo apt install awesome awesome-doc awesome-extra -y

# Enable services
systemctl --user enable mpd.service
systemctl --user start mpd.service


# Left to install
## ╰─❯ wezterm lxappearance-gtk3 polkit-gnome pipewire-alsa pamixer polkit
