#!/bin/sh
FIND_FILE="/boot/config.txt"

if [ `grep -c "camera_auto_detect=1" $FIND_FILE` -ne '0' ];then
    sudo sed -i "s/\(^camera_auto_detect=1\)/camera_auto_detect=0/" /boot/config.txt
fi
if [ `grep -c "camera_auto_detect=0" $FIND_FILE` -lt '1' ];then
    sudo bash -c 'echo camera_auto_detect=0 >> /boot/config.txt'
fi
if [ `grep -c "dtoverlay=arducam-pivariety,media-controller=0" $FIND_FILE` -lt '1' ];then
    sudo bash -c 'echo dtoverlay=arducam-pivariety,media-controller=0 >> /boot/config.txt'
fi

sudo apt update
sudo apt install -y libopencv-dev
sudo apt install -y libcblas-dev
sudo apt install -y libhdf5-dev
sudo apt install -y libhdf5-serial-dev
sudo apt install -y libatlas-base-dev
sudo apt install -y libjasper-dev 
sudo apt install -y libqtgui4 
sudo apt install -y libqt4-test

sudo pip3 install opencv-python ArducamDepthCamera
sudo pip3 install numpy --upgrade

echo "suggest reboot!!"
