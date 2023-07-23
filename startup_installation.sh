sudo apt-get update -y

# Creates the folders to work on
mkdir -p ~/GitHub/Youngermaster/
mkdir ~/GitHub/AnotherOnes/
mkdir -p ~/GitLab/Youngermaster/
mkdir ~/GitLab/AnotherOnes/
mkdir ~/Obsidian
mkdir ~/Flutter
mkdir ~/AndroidStudio
mkdir ~/ISOs

# General packages
sudo apt-get install vim git cmake g++ build-essential curl net-tools neofetch htop wget nmap ranger tree -y

# Graphical stuff
sudo apt-get install linux-headers-generic baobab libuv1-dev flameshot shotwell mupdf -y
sudo apt install -y wmname bspwm sxhkd python3-pastel thunar rofi polybar dunst mpd mpc maim xclip viewnior feh xsettingsd light xcolors xfce4-power-manager
sudo apt install -y libapr1 libaprutil1 libxcb-damage0

# Common apps dependencies
sudo apt install libgconf-2-4 libqt5opengl5 libqt5printsupport5 libqt5x11extras5 libsdl1.2debian libgdk-pixbuf2.0-0 -y
sudo apt install clang ninja-build libgtk-3-dev -y
sudo apt install libqt5help5 libqt5xml5 libc++1 -y
## Flutter new Linux dependency
sudo apt-get install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev
sudo apt install -y lib32stdc++-12-dev

# Flathub based installations
flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub md.obsidian.Obsidian -y
mkdir ~/Obsidian/

# Fonts installation
mkdir -p ~/.fonts/
mkdir -p ~/.local/share/fonts/
cp -r fonts/* ~/.fonts/
cp -r fonts/* ~/.local/share/fonts/
fc-cache -fv

# Some configs added
cp -r .config/* ~/.config

# Mouse Drivers
sudo apt-get install piper ratbagd -y
## On the file "/usr/share/libratbag/logitech-g102-g203.device" 
## I should add this:
## # G102 and G203 (USB)
## [Device]
## Name=Logitech Gaming Mouse G102/G103
## DeviceMatch=usb:046d:c084;usb:046d:c092
## Driver=hidpp20
## LedTypes=logo;side;

# ZSH
sudo apt-get install zsh zsh-syntax-highlighting zsh-autosuggestions -y
sudo usermod --shell /usr/bin/zsh $USER
sudo usermod --shell /usr/bin/zsh root
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Python 3 and pip3
sudo apt-get install python3 python3-venv python3-pip -y

# General packages for Python3
pip3 install matplotlib numpy jupyterlab

# LaTex Installation
sudo apt install texlive-latex-extra texlive-full pandoc -y

# Node.js Installation
sudo apt-get install gcc g++ make -y 
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

## To install the Yarn package manager, run:
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update -y && sudo apt-get install yarn -y

# Docker
sudo apt-get update -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Java Installation
sudo apt install openjdk-11-jdk -y

# OBS Studio for virtual camera
sudo apt install ffmpeg -y
sudo apt install v4l2loopback-dkms -y
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update -y
sudo apt install obs-studio -y

# Virtualization
sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils -y
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo apt install virt-manager -y

# Installing Complete Multimedia Support
sudo apt install ubuntu-restricted-extras -y

# Install GNOME Shell Extensions
sudo apt-get install chrome-gnome-shell -y
sudo apt-get install gnome-tweaks -y

# Setup the themes and icons
mkdir ~/.themes
mkdir ~/.icons

# ############## SWAP ##############
# Resize Swap to 16GB
# Turn swap off
# This moves stuff in swap to the main memory and might take several minutes
sudo swapoff -a

# Create an empty swapfile
# Note that "1G" is basically just the unit and count is an integer.
# Together, they define the size. In this case 16GB.
sudo dd if=/dev/zero of=/swapfile bs=1G count=8
# Set the correct permissions
sudo chmod 0600 /swapfile

sudo mkswap /swapfile  # Set up a Linux swap area
sudo swapon /swapfile  # Turn the swap on

# To make the change permanent open the /etc/fstab file and append the following line:
# /swapfile swap swap defaults 0 0
# ############## SWAP ##############
sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab

sudo apt-get upgrade -y

# Add Android Studio launcher
# cp android-studio.desktop ~/.local/share/applications/
