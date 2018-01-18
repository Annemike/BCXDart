

#include <iostream>
#include <ros/ros.h>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"


#include <image_transport/image_transport.h>
#include <image_transport/subscriber_filter.h>

#include <cv_bridge/cv_bridge.h>

#include <message_filters/sync_policies/approximate_time.h>
#include <message_filters/synchronizer.h>

#include <chrono>
#include "dart_msgs/cv_cone_list.h"
#include "dart_msgs/colors.h"
#include "dart_msgs/cone_list.h"
#include "sensor_msgs/CameraInfo.h"
#include "dart_msgs/point2d_list.h"
#include <image_geometry/pinhole_camera_model.h>
#include "std_msgs/Int32MultiArray.h"

#include <opencv/cv.hpp>
#include <message_filters/subscriber.h>
#include "tf/transform_datatypes.h"
#include <tf/transform_listener.h>
using namespace cv;
using namespace std;

std_msgs::Int32MultiArray dat;
ros::Publisher pub;
ros::Subscriber camera_info_sub;
ros::Subscriber lidar_cone_sub;
cv::Mat K;
image_geometry::PinholeCameraModel cam_model_;
tf::TransformListener* TFlistener;


ros::Publisher annotated_cones_cones;

static void fuseCones(const dart_msgs::cone_list::ConstPtr& lidarCones){
    if(lidarCones->cones.size()<=0 || !cam_model_.initialized()){
        return;
    }


    tf::StampedTransform transform;
    try{

        TFlistener->lookupTransform("/ZED_left_camera", "/velodyne",
                                 ros::Time(0), transform);
    }
    catch (tf::TransformException ex){
        ROS_ERROR("%s",ex.what());
        ros::Duration(1.0).sleep();
    }

    std::vector<cv::Point2f> projectedPoints;
    //std::vector<cv::Point3f> objVector;
    for(const dart_msgs::cone& cone : lidarCones->cones){

        tf::Point point(cone.position.x, cone.position.y, cone.position.z);
        point = transform * point;
        cv::Point3f obj(-point.y(), -point.z(), point.x());
        if(obj.z>0) {
            projectedPoints.push_back(cam_model_.project3dToPixel(obj));
        }
        //objVector.push_back(obj);
    }

    ROS_ERROR("projecting...");

    //cv::projectPoints(objVector, Mat::zeros(1,3,CV_64F), Mat::zeros(1,3,CV_64F), K,Mat::zeros(1,4,CV_64F),  projectedPoints);

    dart_msgs::point2d_list points;

    dart_msgs::cone_list annotated_cones;

    for(int i =0; i<projectedPoints.size();i++){
        cv::Point2f point = projectedPoints[i];
        geometry_msgs::Point dart_point;
        dart_point.x = point.x;
        dart_point.y = point.y;
        points.points.push_back(dart_point);
        /*
        for(const dart_msgs::cv_cone box:cv_cones->cones){
            if(std::abs(box.x-point.x)<=(box.width/2) && std::abs(box.y-point.y)<=(box.height/2) ){
                dart_msgs::cone annotatedCone = lidarCones->cones[i];
                annotatedCone.type = box.type;
                annotated_cones.cones.push_back(annotatedCone);
                break;
            }
        }
         */

    }
    pub.publish(points);
}

static void cameraInfoCallback(sensor_msgs::CameraInfo::ConstPtr info){
    K = cv::Mat(3, 3, CV_32F, info->K[0]);

    camera_info_sub.shutdown();
    cam_model_.fromCameraInfo(info);
    tf::Point testpoint(2,0,0);

    tf::StampedTransform transform;
    try{

        TFlistener->lookupTransform("/ZED_left_camera", "/velodyne",
                                    ros::Time(0), transform);
    }
    catch (tf::TransformException ex){
        ROS_ERROR("%s",ex.what());
        ros::Duration(1.0).sleep();
    }
    testpoint = transform*testpoint;
    cv::Point3f cvPt(-testpoint.y(), -testpoint.z(), testpoint.x());
    std::cout<<"point:";
    std::cout<<testpoint;
    std::cout<<"transformed point:";
    std::cout<<cvPt;
    std::cout<<"P matrix:";
    std::cout<<cam_model_.fullProjectionMatrix();
    std::cout<<"projected testpoint";
    std::cout<<cam_model_.project3dToPixel(cvPt);
}


int main(int argc, char **argv) {

    ros::init(argc, argv, "camera_lidar_fusion_node");
    ros::NodeHandle nh;

    TFlistener = new tf::TransformListener();

    camera_info_sub = nh.subscribe("/left/camera_info_sub", 1, cameraInfoCallback);//TODO
    lidar_cone_sub = nh.subscribe("/lidar_cones", 1, fuseCones);

    pub = nh.advertise<dart_msgs::point2d_list>("projected_cones", 100);
    annotated_cones_cones = nh.advertise<dart_msgs::cone_list>("fused_cones", 10);

    ROS_INFO("cone_fusion started");
    ros::spin();
    return 0;
}

