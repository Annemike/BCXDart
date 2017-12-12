#!/bin/bash
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
deb http://packages.ros.org/ros/ubuntu xenial main
sudo apt-get install libssl1.0.0/xenial libssl-doc/xenial libssl-dev/xenial
sudo apt-get install ros-kinetic-desktop
echo “source /opt/ros/kinetic/setup.bash” >> ~/.bashrc
source ~/.bashrc
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/lib/aarch64-linux-gnu

