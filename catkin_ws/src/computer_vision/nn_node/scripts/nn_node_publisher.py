#!/usr/bin/env python

import rospy
from std_msgs.msg import String

def talker():
    pub = rospy.Publisher('BoundingBoxes', String, queue_size=10) # publish to the bounding boxes topic
    rospy.init_node('NeuralNetwork', anonymous=True)    # this is the neural network node
    rate = rospy.Rate(10) #Loop at 10Hz

    while not rospy.is_shutdown():                          #while ros is active do work
        hello_str = "hello world %s" % rospy.get_time()
        rospy.loginfo(hello_str)
        pub.publish(hello_str)                              # publish string to bounding boxes topic
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass

