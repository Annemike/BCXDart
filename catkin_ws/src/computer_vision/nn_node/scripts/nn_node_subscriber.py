#!/usr/bin/env python
import os
import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
# from std_msgs.msg import String
from sensor_msgs.msg import Image
from pytorch_yolo2.obj_detect import detect


bridge = CvBridge()


def callback(msg):
    rospy.loginfo(rospy.get_caller_id() + " I'm seeing an image")

    try:
        cv2_img = bridge.imgmsg_to_cv2(msg, desired_encoding="passthrough")
    except CvBridgeError as e:
        print(e)

    cwd = os.getcwd()
    boxes = detect(cwd + '/src/computer_vision/nn_node/scripts/pytorch_yolo2/cfg/yolo.cfg', cwd + '/src/computer_vision/nn_node/scripts/pytorch_yolo2/yolo.weights', cv2_img)


def listener():
    # In ROS, nodes are uniquely named. If two nodes with the same
    # node are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('NeuralNetwork_Subscriber', anonymous=True)

    rospy.Subscriber("zed/rgb/image_rect_color", Image, callback)
    # rospy.Publisher("NeuralNetwork_caught_img", Image, queue_size=10)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()


if __name__ == '__main__':
    listener()
