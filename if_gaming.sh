# If you want to play games on Steam, you should run the following commands
sudo dpkg --add-architecture i386
sudo apt-get update -y
sudo apt install libgl1-mesa-dri:i386 libgl1:i386
sudo apt-get upgrade steam -f
