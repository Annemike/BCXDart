

#include <iostream>
#include <ros/ros.h>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"


#include <image_transport/image_transport.h>
#include <image_transport/subscriber_filter.h>

#include <cv_bridge/cv_bridge.h>

#include <message_filters/sync_policies/approximate_time.h>

#include <chrono>
#include "dart_msgs/cv_cone_list.h"
#include "dart_msgs/colors.h"
#include "dart_msgs/cone_list.h"
#include "sensor_msgs/CameraInfo.h"
#include "dart_msgs/point2d_list.h"

#include "std_msgs/Int32MultiArray.h"

#include <opencv/cv.hpp>


using namespace cv;
using namespace std;

std_msgs::Int32MultiArray dat;
ros::Publisher pub;
ros::Subscriber camera_info_sub;
ros::Subscriber lidar_cone_sub;
cv::Mat K;

static void projectPoint3D(dart_msgs::cone_list::ConstPtr lidarCones){

    if(lidarCones->cones.size()<=0){
        return;
    }
    std::vector<cv::Point3f> objVector;
    for(const dart_msgs::cone& cone : lidarCones->cones){

        cv::Point3f obj(cone.position.x, cone.position.y, cone.position.z);

        objVector.push_back(obj);
    }
    std::vector<cv::Point2f> projectedPoints;

    cv::projectPoints(objVector, Mat::zeros(1,3,CV_64F), Mat::zeros(1,3,CV_64F), K,Mat::zeros(1,4,CV_64F),  projectedPoints);

    dart_msgs::point2d_list points;


    for(const cv::Point2f& point : projectedPoints){
        geometry_msgs::Point dart_point;
        dart_point.x = point.x;
        dart_point.y = point.y;
        points.points.push_back(dart_point);
    }
    pub.publish(points);


}

static void cameraInfoCallback(sensor_msgs::CameraInfo::ConstPtr info){
   // K = (Mat_<float>(3, 3) << info->K[0],info->K[1],info->K[2],info->K[3],info->K[4],info->K[5],info->K[6],info->K[7],info->K[8]);
//std::cout << K;
    camera_info_sub.shutdown();
}


void readParams(ros::NodeHandle &n) {

    K = (Mat_<float>(3, 3) << 697.996826171875, 0.0, 646.3035888671875, 0.0, 697.996826171875, 368.5094909667969, 0.0, 0.0, 1.0);
	std::cout << K;
}


int main(int argc, char **argv) {

    ros::init(argc, argv, "camera_lidar_fusion_node");
    ros::NodeHandle nh;
    readParams(nh);

    camera_info_sub = nh.subscribe("/left/camera_info_sub", 1, cameraInfoCallback);//TODO
    lidar_cone_sub = nh.subscribe("/lidar_cones", 1, projectPoint3D);

    pub = nh.advertise<dart_msgs::point2d_list>("projected_cones", 100);

    cout << "started\n";

    ros::spin();

    return 0;
}

