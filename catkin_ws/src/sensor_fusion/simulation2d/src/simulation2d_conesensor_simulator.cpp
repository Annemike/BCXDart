/*
 * simulation2d_conesensor_simulator.cpp
 *
 *  Created on: Sep 27, 2017
 *      Author: magnus
 */

#include "ros/ros.h"
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <random>
#include "std_msgs/Int32MultiArray.h"
#include "visualization_msgs/MarkerArray.h"
#include "dart_msgs/cone_list.h"

void OnMapRecieve(std_msgs::Int32MultiArray cones);

std::vector<int> map;

std_msgs::ColorRGBA getColorFromID(int id) {
    std_msgs::ColorRGBA color;
    switch (id) {
        case 0:
            color.a = 1;
            color.r = 1;
            color.g = 1;
            color.b = 0;
            break;
        case 1:
            color.a = 1;
            color.r = 0.2;
            color.g = 0.4;
            color.b = 1;
            break;
        case 2:
            color.a = 1;
            color.r = 1;
            color.g = 0.6;
            color.b = 0;
            break;
        case 3:
            color.a = 1;
            color.r = 1;
            color.g = 0.6;
            color.b = 0;
            break;
        default:
            ROS_ERROR("could not recognize id %d", id);
    }
    return color;
}

int main(int argc, char **argv) {
    //init ros
    ros::init(argc, argv, "simulation2d_conesensor_simulator");
    ros::NodeHandle n;
    ros::NodeHandle nh("~");
    tf::TransformBroadcaster br;
    tf::TransformListener listener;

    double sensor_range = nh.param<double>("sensor_range", 30);
    int update_freq = nh.param<int>("update_freq", 20);

    //init pubs and subs
    ros::Subscriber map_sub = n.subscribe("cone", 1, OnMapRecieve);
    ros::Publisher measurement_publisher = n
            .advertise<visualization_msgs::MarkerArray>(nh.param<std::string>("name", "\noFrameSet") + "_measure_raw",
                                                        100);  //set third argument to true to latch message!
    ros::Publisher cone_publisher = n
            .advertise<dart_msgs::cone_list>("simulated_cones", 100);  //set third argument to true to latch message!

    //random number generators
    std::default_random_engine generator;
    double std_depth = nh.param<double>("std_depth", 0.1);
    double std_yaw_deg = nh.param<double>("std_yaw_deg", 0.5);
    std::normal_distribution<double> distributionDepth(0, std_depth);
    std::normal_distribution<double> distributionYaw(0, std_yaw_deg * 3.1415926 / 180);

    ros::Rate update_rate(update_freq);
    while (ros::ok()) {
        ros::spinOnce();

        //lookup ground truth, compute Tground_sensor
        tf::StampedTransform Tsensor_world;
        try {
            listener.lookupTransform(nh.param<std::string>("name", "noFrameSet"), "/world",
                                     ros::Time(0), Tsensor_world);
        } catch (tf::TransformException &ex) {
            ROS_ERROR("%s", ex.what());
            ros::Duration(1.0).sleep();
        }


        visualization_msgs::MarkerArray cone_measurements;
        visualization_msgs::Marker cone_measure_visual_arrow;
        cone_measure_visual_arrow.header.frame_id = nh.param<std::string>("name", "\noFrameSet");
        cone_measure_visual_arrow.header.stamp = ros::Time::now();
        cone_measure_visual_arrow.ns = "map";
        cone_measure_visual_arrow.action = visualization_msgs::Marker::ADD;
        cone_measure_visual_arrow.type = visualization_msgs::Marker::ARROW;
        cone_measure_visual_arrow.scale.y = 0.05;
        cone_measure_visual_arrow.scale.z = 0.05;
        cone_measure_visual_arrow.color.a = 1;
        cone_measure_visual_arrow.color.r = 1;
        cone_measure_visual_arrow.lifetime = ros::Duration(update_rate.cycleTime());

        visualization_msgs::Marker cone_measure_visual_point;
        cone_measure_visual_point.header.frame_id = nh.param<std::string>("name", "\noFrameSet");
        cone_measure_visual_point.header.stamp = ros::Time::now();
        cone_measure_visual_point.ns = "map";
        cone_measure_visual_point.action = visualization_msgs::Marker::ADD;
        cone_measure_visual_point.type = visualization_msgs::Marker::CUBE;
        cone_measure_visual_point.scale.x = 0.2;
        cone_measure_visual_point.scale.y = 0.2;
        cone_measure_visual_point.scale.z = 0.2;
        cone_measure_visual_point.color.a = 1;
        cone_measure_visual_point.color.r = 1;
        cone_measure_visual_point.lifetime = ros::Duration(update_rate.cycleTime());

        dart_msgs::cone_list cone_list;
        cone_list.header.stamp = ros::Time::now();
        cone_list.header.frame_id = nh.param<std::string>("name", "\noFrameSet");



        //iterate over all cones in the map
        for (int i = 0; i + 2 < map.size(); i += 3) {
            //compute relative cone position to sensor
            tf::Vector3 cone_measure = Tsensor_world
                                       * tf::Vector3(0.001 * map[i], 0.001 * map[i + 1], 0);

            //compute ground truth yaw in rad
            double yaw = atan2(cone_measure.y(), cone_measure.x());

            //restrict sensor range and observation yaw angle
            if (cone_measure.length() < sensor_range && abs(yaw) < 3.141592 / 180 * 45) {

                //generate noise
                tf::Vector3 depthNoise = cone_measure * (distributionDepth(generator) / cone_measure.length());
                tf::Vector3 yawNoise = cone_measure.cross(tf::Vector3(0, 0, 1));
                yawNoise *= (cone_measure.length() * distributionYaw(generator)) / yawNoise.length();
                cone_measure += depthNoise + yawNoise;

                //compute noised yaw
                double yawWithNoise = atan2(cone_measure.y(), cone_measure.x());

                //set geometry pose of visual markers
                //arrows
                cone_measure_visual_arrow.pose.orientation =
                        tf::createQuaternionMsgFromRollPitchYaw(0, 0, yawWithNoise);
                cone_measure_visual_arrow.scale.x = cone_measure.length();
                cone_measure_visual_arrow.id = 2 * i;

                //points (cubes)
                cone_measure_visual_point.pose.position.x = cone_measure.x();
                cone_measure_visual_point.pose.position.y = cone_measure.y();
                cone_measure_visual_point.id = 2 * i + 1;
                cone_measure_visual_point.color = getColorFromID(map[i + 2]);


                dart_msgs::cone cone;
                cone.position.x = cone_measure.x();
                cone.position.y = cone_measure.y();
                cone.type = map[i + 2];


                //add dart_msgs::cone to dart_msgs::cone_list
                cone_list.cones.push_back(cone);
                cone_measurements.markers.push_back(cone_measure_visual_arrow);
                cone_measurements.markers.push_back(cone_measure_visual_point);
            }

        }

        //TODO compute shadow regions
        //TODO probabilistically delete some cones

        cone_publisher.publish(cone_list);
        measurement_publisher.publish(cone_measurements);
        update_rate.sleep();
    };
    return 0;
}

void OnMapRecieve(std_msgs::Int32MultiArray cones) {
    map = cones.data;
}
