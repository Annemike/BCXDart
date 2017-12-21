#!/usr/bin/env python
import os
import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from yolo2_pytorch import detect
from dart_msgs.msg import cv_cone_list, cv_cone


bridge = CvBridge()
pub_bbox = rospy.Publisher("NeuralNetwork_bboxs", cv_cone_list, queue_size=100)


def callback(msg):
    rospy.loginfo(rospy.get_caller_id() + " I'm seeing an image")

    try:
        cv2_img = bridge.imgmsg_to_cv2(msg, desired_encoding="passthrough")
    except CvBridgeError as e:
        print(e)

    cwd = os.getcwd()
    boxes = detect(cwd + '/src/computer_vision/nn_node/scripts/yolo2_pytorch/cfg/yolo-fsd-tiny.cfg', cwd + '/src/computer_vision/nn_node/scripts/yolo2_pytorch/weights/yolo-fsd-tiny_3000.weights', cv2_img)

    (height, width, channels) = cv2_img.shape

    msg_cone_list = cv_cone_list()
    for box in boxes:
        cone = cv_cone()
        cone.x = box[0] * width
        cone.y = box[1] * height
        cone.width = box[2] * width
        cone.height = box[3] * height
        cone.type = box[6]
        cone.quality = box[5]*100
        msg_cone_list.cones.append(cone)

    pub_bbox.publish(msg_cone_list)



def listener():
    # In ROS, nodes are uniquely named. If two nodes with the same
    # node are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('NeuralNetwork_Subscriber', anonymous=True)

    rospy.Subscriber("zed/rgb/image_rect_color", Image, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()


if __name__ == '__main__':
    listener()
