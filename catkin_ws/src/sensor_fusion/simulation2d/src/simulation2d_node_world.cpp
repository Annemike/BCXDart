/*
 * node_world.cpp
 *
 *  Created on: Sep 11, 2017
 *      Author: magnus
 */
#include "ros/ros.h"
#include <fstream>
#include "std_msgs/Int32MultiArray.h"
#include "std_msgs/MultiArrayDimension.h"

int main(int argc, char **argv) {
  //init ros
  ros::init(argc, argv, "world");
  ros::NodeHandle n;

  //get path to map file and open the file
  std::string worldFile;
   n.getParam("worldFile", worldFile);
   std::fstream myfile(worldFile, std::ios_base::in);

  //setup publisher
  ros::Publisher pub = n.advertise<std_msgs::Int32MultiArray>("cone", 1, true);

  //prepare message
  std_msgs::Int32MultiArray dat;
  dat.layout.dim.push_back(std_msgs::MultiArrayDimension());
  dat.layout.dim.push_back(std_msgs::MultiArrayDimension());
  dat.layout.dim[0].label = "length";
  dat.layout.dim[1].label = "channel";
  dat.layout.dim[1].size = 3;
  dat.layout.dim[1].stride = 3;
  dat.layout.data_offset = 0;

  //write data from file into message
  int a;
  while (myfile >> a) {
    dat.data.push_back(a);
  }
  myfile.close();

  //set size arguments
  dat.layout.dim[0].size = dat.data.size()/3;
  dat.layout.dim[0].stride = dat.data.size();

  //publish and latch the message
  pub.publish(dat);
  ros::spin();
  return 0;
}
