#include <iostream>
#include <ros/ros.h>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"


#include <image_transport/image_transport.h>
#include <image_transport/subscriber_filter.h>
#include <sensor_msgs/image_encodings.h>
#include <cv_bridge/cv_bridge.h>

#include <message_filters/sync_policies/approximate_time.h>
#include <message_filters/sync_policies/exact_time.h>
#include <message_filters/subscriber.h>
#include <opencv/cv.hpp>
#include <dart_msgs/point2d_list.h>
#include "dart_msgs/cv_cone_list.h"
#include "dart_msgs/colors.h"
#include "dart_msgs/cone_list.h"



using namespace cv;
using namespace std;

ros::Publisher pub;


cv_bridge::CvImagePtr imgOriginal;


void GrabRGB(const sensor_msgs::ImageConstPtr &msgRGB);
void grabPoints(const dart_msgs::point2d_listConstPtr &msgPoints);

int main(int argc, char **argv) {

    ros::init(argc, argv, "image_listener");
    ros::NodeHandle nh;

    /*message_filters::Subscriber<sensor_msgs::Image> rgb_sub(nh, "/left/image_rect_color", 1);
    message_filters::Subscriber<dart_msgs::point2d_list> projected_cones_sub(nh, "/projected_cones", 1);
    typedef message_filters::sync_policies::ApproximateTime<
            sensor_msgs::Image,dart_msgs::point2d_list > sync_pol;

    message_filters::Synchronizer<sync_pol> sync(sync_pol(10), rgb_sub,
                                                 projected_cones_sub);

    sync.registerCallback(
            boost::bind(&GrabRGB, _1, _2));
*/
    ros::Subscriber sub1 = nh.subscribe("/left/image_rect_color", 1, GrabRGB);
    ros::Subscriber sub2 = nh.subscribe("/projected_cones", 1, grabPoints);


    pub = nh.advertise<sensor_msgs::Image>("lidar_vision_fusion_visual", 100);

    cout << "started\n";

    ros::spin();

    return 0;
}

void grabPoints(const dart_msgs::point2d_listConstPtr &msgPoints){
cv::circle(imgOriginal->image,cv::Point(0, 0),20,cv::Scalar(0,0,255),-1);
    for(const geometry_msgs::Point& point: msgPoints->points){
        cv::circle(imgOriginal->image,cv::Point(point.x, point.y),5,cv::Scalar(0,0,255),-1);
    }
    pub.publish(imgOriginal->toImageMsg());
}
void GrabRGB(const sensor_msgs::ImageConstPtr &msgRGB) {
    imgOriginal = cv_bridge::toCvCopy(msgRGB,"bgr8");
}


