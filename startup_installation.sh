sudo apt-get update -y

# Creates the folders to work on
mkdir ~/GitHub/
mkdir ~/GitHub/Youngermaster/
mkdir ~/GitHub/AnotherOnes/

# General packages
sudo apt-get install vim git cmake g++ build-essential curl net-tools screenfetch htop wget nmap shotwell linux-headers-generic baobab libuv1-dev flameshot mupdf ranger -y

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

# Fonts
sudo apt-get install fonts-noto fonts-noto-cjk fonts-noto-color-emoji -y

# Python 3 and pip3
sudo apt-get install python3 python3-venv python3-pip -y

# General packages for Python3
pip3 install matplotlib numpy matplotlib jupyterlab

# NVim
sudo apt-get install nvim exuberant-ctags -y
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# LaTex Installation
sudo apt install texlive-latex-extra texlive-full -y

# Node.js Installation
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install gcc g++ make -y 
sudo apt-get install nodejs -y

# Java Installation
sudo apt install openjdk-8-jdk -y

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

# Virtualbox
sudo apt-get install virtualbox virtualbox-dkms -y
sudo dpkg-reconfigure virtualbox-dkms
sudo dpkg-reconfigure virtualbox

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update -y && sudo apt-get install spotify-client -y

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
