#source workspace
source devel/setup.bash

#record
dt=$(date '+%d_%m_%Y-%H:%M:%S');
rosbag record -a -O Records/record_$dt.bag

