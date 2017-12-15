/*
 * node.cpp
 *
 *  Created on: Sep 11, 2017
 *      Author: magnus
 */
#include "ros/ros.h"
#include <simulation2d_msgs/car_state.h>
#include <simulation2d_msgs/vehicle_control.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <tf/transform_datatypes.h>

#define PI  3.1415926

void vehicleControlCallback(
    const simulation2d_msgs::vehicle_control::ConstPtr& control);
void update();
int sgn(float val);

tf::Transform pose;
float carLength;
simulation2d_msgs::vehicle_control control;

int main(int argc, char **argv) {
  //init ros
  ros::init(argc, argv, "simulation2d");
  ros::NodeHandle n;

  //get parameters
  int car_state_pub_queue_size = n.param<int>("car_state_pub_queue_size", 1);
  carLength = n.param<double>("carLength", 2);
  int number_of_callback_threads = n.param<int>("number_of_callback_threads",1);
  int update_rate_freq = n.param<int>("update_rate_freq",1);

  control.speed = 0;
  control.steeringAngle = 0;

  //init state
  pose.setOrigin(tf::Vector3(0, 0, 0));
  tf::Quaternion orientation;
  orientation.setRPY(0, 0, 0);
  pose.setRotation(orientation);


  //setup publishers and subscribers
  ros::Subscriber sub = n.subscribe("vehicle_control", 10,
                                    vehicleControlCallback);

  ros::Publisher groundTruthPublisher = n
      .advertise<geometry_msgs::TransformStamped>("groundTruth_car",
                                                  car_state_pub_queue_size);
  tf::TransformBroadcaster br;

  //create asynchronous callback handler to receive control updates
  ros::AsyncSpinner spinner(number_of_callback_threads);
  spinner.start();

  //publish ground truth data of simulation in a fixed frequency
  ros::Rate update_rate(update_rate_freq);
  while (ros::ok()) {
    update();

    //publish pose twice, once for tf tree and once for visualization
    tf::StampedTransform groundTruth = tf::StampedTransform(
        pose, ros::Time::now(), "/world", "base_link");
    br.sendTransform(groundTruth);

    geometry_msgs::TransformStamped t;
    tf::transformStampedTFToMsg(groundTruth, t);
    groundTruthPublisher.publish(t);

    update_rate.sleep();
  }

  return 0;

}

template<typename T> int sgn(T val) {
  return (T(0) < val) - (val < T(0));
}

void vehicleControlCallback(
    const simulation2d_msgs::vehicle_control::ConstPtr &c) {
  control = *c;
  //Immediately update the model as this is a discontinuity
  update();
  return;
}

void update() {
  //compute duration past since last update
  static ros::Time lastTime = ros::Time::now();
  ros::Time t_now = ros::Time::now();
  ros::Duration dt = t_now - lastTime;
  lastTime = t_now;

  float speed = control.speed;
  float steeringAngle = control.steeringAngle;

  float dx, dy, da;
  float distanceTraveled = dt.toSec() * speed;
  float distanceToCenterOfRotation = 0;
  if (steeringAngle != 0) {//vehicle turns
    distanceToCenterOfRotation = std::tan((PI / 2.0) - fabs(steeringAngle))
        * carLength;
    da = distanceTraveled / (distanceToCenterOfRotation);
    dx = distanceToCenterOfRotation * sin(da);
    dy = distanceToCenterOfRotation * (1 - cos(da)) * sgn<float>(steeringAngle);

    tf::Transform dPosition;

    dPosition.setOrigin(tf::Vector3(dx, dy, 0));

    tf::Quaternion rotation;
    rotation.setRPY(0, 0, 0);
    rotation.setRPY(0, 0, da * sgn<float>(steeringAngle));
    dPosition.setRotation(rotation);

    pose = pose * dPosition;

  } else {//vehicle drives exaclty forward
    pose.setOrigin(tf::Vector3(pose * tf::Vector3(distanceTraveled, 0, 0)));
  }
}
