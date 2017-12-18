#include "ros/ros.h"
#include "dart_msgs/cone_list.h"

#include "visualization_msgs/MarkerArray.h"
#include "visualization_msgs/Marker.h"
#include "NearestSameColor.h"
#include <algorithm>
ros::Publisher demarcationLinePublisher;
void newCones(dart_msgs::cone_list cones)
{
    if(cones.cones.size()==0){
        return;
    }
    //assure algorithm is working by shuffling incomming cones first

    std::random_shuffle(cones.cones.begin(), cones.cones.end());

    dart_msgs::cone_list leftCones, rightCones;
    NearestSameColor solver;
    solver.solve(cones, leftCones, rightCones);
    //TODO
    //sort cones

    //visualize ordering
    visualization_msgs::MarkerArray demarcationLine;
    visualization_msgs::Marker line;
    line.header.frame_id = cones.header.frame_id;
    line.header.stamp = ros::Time::now();
    line.type = visualization_msgs::Marker::LINE_STRIP;
    line.id = 0;
    line.color.a=1;
    line.color.r=1;
    line.color.g=1;
    line.color.b=1;
    //line.lifetime.fromSec(20);
    line.scale.x = 0.1;

    demarcationLine.markers.push_back(line);
    line.id = 1;
    demarcationLine.markers.push_back(line);
    line.id = 2;
    for(auto& cone: leftCones.cones) {
        demarcationLine.markers[0].points.push_back(cone.position);
    }

    for(auto& cone: rightCones.cones) {
        demarcationLine.markers[1].points.push_back(cone.position);
    }
    /*demarcationLine.markers.push_back(line);
    line.id = 3;
    demarcationLine.markers.push_back(line);
    for(auto& cone:cones.cones){
        demarcationLine.markers[cone.type].points.push_back(cone.position);
    }*/


    demarcationLinePublisher.publish(demarcationLine);
    //ROS_INFO("I heard: [%s]", msg->data.c_str());
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "cone_sequencer");

    ros::NodeHandle n;

    ros::Subscriber sub = n.subscribe("simulated_cones", 1, newCones);
    demarcationLinePublisher = n.advertise<visualization_msgs::MarkerArray>("demarkationLine", 1);
    ros::spin();

    return 0;
}