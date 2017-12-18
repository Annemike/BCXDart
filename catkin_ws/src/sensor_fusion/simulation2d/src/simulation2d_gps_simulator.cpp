#include "ros/ros.h"
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <random>

int main(int argc, char **argv) {
  ros::init(argc, argv, "simulation2d_gps_simulator");
  ros::NodeHandle n;
  tf::TransformBroadcaster br;
  tf::TransformListener listener;

  std::default_random_engine generator;
  std::normal_distribution<double> distribution(0, 0.2);

  ros::Rate update_rate(10);
  tf::Transform Tbaselink_gpsantenna;
  Tbaselink_gpsantenna.setIdentity();
  Tbaselink_gpsantenna.setOrigin(tf::Vector3(1, 0, 0));

  while (ros::ok()) {
    ros::spinOnce();

    //lookup ground truth, add noise and publish
    tf::StampedTransform Tworld_baselink;
    try {
      listener.lookupTransform("/world", "/base_link",
                               ros::Time(0), Tworld_baselink);
    } catch (tf::TransformException &ex) {
      ROS_ERROR("%s", ex.what());
      ros::Duration(1.0).sleep();
    }
    tf::Transform gps_with_noise = Tworld_baselink * Tbaselink_gpsantenna;
    gps_with_noise.setOrigin(gps_with_noise.getOrigin()+tf::Vector3(distribution(generator), distribution(generator), 0.0));
    br.sendTransform(
        tf::StampedTransform(gps_with_noise,
                             ros::Time::now(), "/world", "gps"));

    update_rate.sleep();
  };

  return 0;

}

