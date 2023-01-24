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
sudo apt-get install vim git cmake g++ build-essential curl net-tools neofetch htop wget nmap ranger -y

# Graphical stuff
sudo apt-get install linux-headers-generic baobab libuv1-dev flameshot shotwell mupdf -y

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
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install gcc g++ make -y 
sudo apt-get install nodejs -y

# Java Installation
sudo apt install openjdk-11-jdk -y

# OBS Studio for virtual camera
sudo apt install ffmpeg -y
sudo apt install v4l2loopback-dkms -y
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update -y
sudo apt install obs-studio -y

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
