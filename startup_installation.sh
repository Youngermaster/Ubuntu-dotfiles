sudo apt-get update -y

# General packages
sudo apt-get install vim git cmake g++ build-essential curl net-tools screenfetch htop wget -y

# Python 3 and pip3
sudo apt-get install python3 python3-pip -y

# General packages for Python3
sudo apt-get install python3-pyaudio -y
pip3 install matplotlib numpy pyaudio jupyterlab

# Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# LaTex Installation
sudo apt install texlive-latex-extra -y

# Node.js Installation
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install gcc g++ make -y 
sudo apt-get install nodejs -y

# Java Installation
sudo apt install openjdk-8-jdk -y
