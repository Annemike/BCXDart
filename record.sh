#source workspace
source devel/setup.bash

#TODO: start all node
#start nodes

#record
dt=$(date '+%d_%m_%Y-%H:%M:%S');
rosbag record -a -O Records/record_$dt.bag

