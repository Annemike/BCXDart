/*
 *
 *
 *  Created on: Sep 11, 2017
 *      Author: magnus
 */
#include "ros/ros.h"
#include "sensor_msgs/Joy.h"
#include "simulation2d_msgs/vehicle_control.h"

void newMessage(const sensor_msgs::Joy::ConstPtr&m);

ros::Publisher controlMsg_pub;
double maxSpeed;
double maxSteering;

int main(int argc, char **argv) {
  ros::init(argc, argv, "simulation2d");
  ros::NodeHandle n;

  //setup subsciber and publisher
  ros::Subscriber sub = n.subscribe("/joy", 10,
                                    newMessage);
  controlMsg_pub = n.advertise<simulation2d_msgs::vehicle_control>("/vehicle_control", 1);

  //retrieve parameters
  maxSpeed = n.param<double>("controler_maxSpeed", 3);
  maxSteering = n.param<double>("controler_maxSteering", 1);
  ROS_INFO("set maxSpeed: %f, maxSteering: %f", maxSpeed, maxSteering);

  //start conversion
  ros::spin();
  return 0;
}

void newMessage(const sensor_msgs::Joy::ConstPtr &m){
  simulation2d_msgs::vehicle_control controlMsg;
  controlMsg.header.stamp = ros::Time::now();
  controlMsg.speed = (1-m->axes[4])/2 * maxSpeed;
  controlMsg.steeringAngle = m->axes[0] * maxSteering;
  controlMsg_pub.publish(controlMsg);
}
