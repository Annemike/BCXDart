#install ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get update

sudo apt-get install ros-kinetic-desktop

sudo rosdep init

rosdep update

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

source ~/.bashrc

sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential
./install_gazebo.sh 8

#install catkin command line tools
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install python-catkin-tools

#install additional packages needed
sudo apt-get install ros-kinetic-rqt-multiplot ros-kinetic-teleop-twist-keyboard 
sudo apt-get install ros-kinetic-joy

#install LAPACK|BLAS -> Armadillo dependencies -> obstracle_detection dependency
sudo apt-get install libblas-dev liblapack-dev

#initialize submodules
git submodule update --init --recursive

