#change directory
cd catkin_ws/

#build all catkin packages
catkin build

#source workspace
source devel/setup.bash

#launch
roslaunch launch launch.launch

