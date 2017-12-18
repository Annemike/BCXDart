/*
 * simulation2d_compass_simulator.cpp
 *
 *  Created on: Sep 20, 2017
 *      Author: magnus
 */

#include "ros/ros.h"
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <std_msgs/Float64.h>
#include <random>

int main(int argc, char **argv) {
  ros::init(argc, argv, "simulation2d_compass_simulator");
  ros::NodeHandle n;
  tf::TransformBroadcaster br;
  tf::TransformListener listener;

  ros::Publisher compass_pub = n.advertise<std_msgs::Float64>(
       "compass", 1);

  std::default_random_engine generator;
  std::normal_distribution<double> distribution(0, 2*3.1415/180);

  ros::Rate update_rate(10);
  while (ros::ok()) {
    ros::spinOnce();

    //lookup groundtruth add noise and publish
    tf::StampedTransform groundTruth_base_link;
    try {
      listener.lookupTransform("/world", "/base_link",
                               ros::Time(0), groundTruth_base_link);
    } catch (tf::TransformException &ex) {
      ROS_ERROR("%s", ex.what());
      ros::Duration(1.0).sleep();
    }
    double roll, pitch, yaw;
    tf::Matrix3x3(groundTruth_base_link.getRotation()).getRPY(roll,pitch, yaw);
    compass_pub.publish(yaw+distribution(generator));

    update_rate.sleep();
  };

  return 0;

}

