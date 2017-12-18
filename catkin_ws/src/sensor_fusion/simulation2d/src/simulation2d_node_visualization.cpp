/*
 * node.cpp
 *
 *  Created on: Sep 11, 2017
 *      Author: magnus
 */
#include "ros/ros.h"
#include <simulation2d_msgs/car_state.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include "std_msgs/Int32MultiArray.h"

void OnMapRecieve(const std_msgs::Int32MultiArray& cones);
ros::Publisher map_visual_publisher;
visualization_msgs::MarkerArray map;

int main(int argc, char **argv) {
  //init ros
  ros::init(argc, argv, "simulation2d_visualization");
  ros::NodeHandle n;

  //init subscribers and publishers
  ros::Subscriber map_sub = n.subscribe("cone", 1, OnMapRecieve);
  map_visual_publisher = n.advertise<visualization_msgs::MarkerArray>(
      "map_visual", 1, true);//set third argument to true to latch message!

  ros::spin();
  return 0;
}

void OnMapRecieve(const std_msgs::Int32MultiArray& cones) {
  int i = 0;
  std::vector<int>::const_iterator it = cones.data.begin();
  for (i = 0; it != cones.data.end(); it += 3) {
    visualization_msgs::Marker cone;
    cone.header.frame_id = "/world";
    cone.header.stamp = ros::Time::now();
    cone.ns = "map";
    cone.action = visualization_msgs::Marker::ADD;
    cone.pose.orientation.w = 1.0;

    cone.id = i;

    cone.type = visualization_msgs::Marker::CYLINDER;

    cone.scale.x = 0.3;
    cone.scale.y = 0.3;
    cone.scale.z = 0.4;

    int x = *it;
    int y = *(it + 1);
    int id = *(it + 2);
    cone.lifetime = ros::DURATION_MAX;
    switch(id){
      case 0:
       cone.color.a = 1;
       cone.color.r = 1;
       cone.color.g = 1;
       cone.color.b = 0;
       break;
      case 1:
       cone.color.a = 1;
       cone.color.r = 0.2;
       cone.color.g = 0.4;
       cone.color.b = 1;
       break;
      case 2:
       cone.color.a = 1;
       cone.color.r = 1;
       cone.color.g = 0.6;
       cone.color.b = 0;
       break;
      case 3:
       cone.color.a = 1;
       cone.color.r = 1;
       cone.color.g = 0.6;
       cone.color.b = 0;
       break;
      default:
        ROS_ERROR("could not recognize id %d", id);
    }
    cone.pose.position.x = 0.001*x;
    cone.pose.position.y = 0.001*y;
    cone.pose.position.z = 0;
    map.markers.push_back(cone);

    i++;
  }
  map_visual_publisher.publish(map);
}

