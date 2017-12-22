#include <iostream>
#include <ros/ros.h>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <stdlib.h>
#include <stdio.h>
#include <image_transport/image_transport.h>
#include <image_transport/subscriber_filter.h>
#include <sensor_msgs/image_encodings.h>
#include <cv_bridge/cv_bridge.h>

#include <message_filters/sync_policies/approximate_time.h>
#include <message_filters/sync_policies/exact_time.h>
#include <message_filters/subscriber.h>
#include <chrono>

#include <opencv2/core/core.hpp>
#include "std_msgs/Int32MultiArray.h"
#include "std_msgs/MultiArrayDimension.h"
#include "dart_msgs/cv_cone_list.h"

using namespace cv;
using namespace std;

void MatchingMethod(int, void *);


// working zed_HD
//Mat K = (Mat_<float>(3,3) << 1445.2266845703125, 0.0, 976.0119018554688, 0.0,
//1445.2266845703125, 558.0322875976562, 0.0, 0.0, 1.0);

// working zed
Mat K = (Mat_<float>(3, 3) << 699.943, 0.0, 650.156, 0.0,
        699.943, 383.336, 0.0, 0.0, 1.0);

// autonomos
//Mat K = (Mat_<float>(3, 3) << 645.7696953977371, 0.0, 379.2612730767103, 0.0,
//         645.6631371750451, 251.0707518863444, 0.0, 0.0, 1.0);


Mat P = (Mat_<double>(2, 3) << 1, 0, 0, 0, 0, 1);

std_msgs::Int32MultiArray dat;
ros::Publisher pub;


Mat imgOriginal;
Mat imgDepth;
Mat roi;
Mat imgHSV;
Mat imgLines;
Mat imgGray;
int iLowH = 0;
int iHighH = 22;

int iLowS = 169;
int iHighS = 255;

int iLowV = 181;
int iHighV = 255;

int blueLowH = 0;
int blueLowS = 0;
int blueLowV = 0;
int blueHighH = 255;
int blueHighS = 255;
int blueHighV = 255;

int yellowLowH = 0;
int yellowLowS = 0;
int yellowLowV = 0;
int yellowHighH = 255;
int yellowHighS = 255;
int yellowHighV = 255;

int blackLowH = 0;
int blackLowS = 0;
int blackLowV = 0;
int blackHighH = 255;
int blackHighS = 255;
int blackHighV = 255;

int whiteLowH = 0;
int whiteLowS = 0;
int whiteLowV = 0;
int whiteHighH = 255;
int whiteHighS = 255;
int whiteHighV = 255;

void readParams(const ros::NodeHandle& n){
	blueLowH 	= n.param("blueLowH", 0);
	blueLowS 	= n.param("blueLowS", 0);
	blueLowV 	= n.param("blueLowV", 0);
	blueHighH 	= n.param("blueHighH", 0);
	blueHighS 	= n.param("blueHighS", 0);
	blueHighV 	= n.param("blueHighV", 0);
	             
	yellowLowH 	= n.param("yellowLowH", 0);
	yellowLowS 	= n.param("yellowLowS", 0);
	yellowLowV 	= n.param("yellowLowV", 0);
	yellowHighH = n.param("yellowHighH", 0);
	yellowHighS = n.param("yellowHighS", 0);
	yellowHighV = n.param("yellowHighV", 0);
	             
	blackLowH 	= n.param("blackLowH" , 0);
	blackLowS 	= n.param("blackLowS" , 0);
	blackLowV 	= n.param("blackLowV" , 0);
	blackHighH 	= n.param("blackHighH", 0);
	blackHighS 	= n.param("blackHighS", 0);
	blackHighV 	= n.param("blackHighV", 0);
	             
	whiteLowH 	= n.param("whiteLowH" , 0);
	whiteLowS 	= n.param("whiteLowS" , 0);
	whiteLowV 	= n.param("whiteLowV" , 0);
	whiteHighH 	= n.param("whiteHighH", 0);
	whiteHighS 	= n.param("whiteHighS", 0);
	whiteHighV 	= n.param("whiteHighV", 0);
	
	}


/**
 * @param in_K the camera Matrix
 * @param in_P a 2 x 3 Matrix containing the ground unit vectors ex, ey
 * represented in the cameras coordinate system of length 1 as rows, e.g [1 0 0;
 * 0 0 1]
 * @param u_mat matrix containing the u values of the cones
 * @param v_mat matrix containing the v values of the cones
 * @param z_mat matrix containing the z values of the cones
 * @param points2d the resulting 2d points, a 2-channel matrix
 */
static void
groundProjection2D_from_rgbd(const cv::Mat &in_K, const cv::Mat &in_P,
                             const cv::Mat &u_mat, const cv::Mat &v_mat,
                             const cv::Mat &z_mat, cv::Mat &points2d, int print) {

    CV_Assert((u_mat.size() == z_mat.size()) && (v_mat.size() == z_mat.size()));
    if (u_mat.empty())
        return;
    CV_Assert((u_mat.type() == z_mat.type()) && (v_mat.type() == z_mat.type()));

    // grab camera params
    cv::Mat_<float> K;

    if (in_K.depth() == CV_32F)
        K = in_K;
    else
        in_K.convertTo(K, CV_32F);

    // grap ground projection matrix
    cv::Mat_<double> P;

    if (in_P.depth() == CV_64F)
        P = in_P;
    else
        in_P.convertTo(P, CV_64F);

    // compute
    float fx = K(0, 0);
    float fy = K(1, 1);
    float s = K(0, 1);
    float cx = K(0, 2);
    float cy = K(1, 2);

    std::vector<cv::Mat> points3d(3); // = cv::Mat::zeros(3, u_mat.rows, CV_32F);

    points3d[0] = (u_mat - cx) / fx;

    if (s != 0)
        points3d[0] = points3d[0] + (-(s / fy) * v_mat + cy * s / fy) / fx;

    points3d[0] = points3d[0].mul(z_mat);
    points3d[1] = (v_mat - cy).mul(z_mat) * (1. / fy);
    points3d[2] = z_mat;

    // cout << points3d[0].type() << "\n";
    Mat point3dMat; // = Mat(3, u_mat.rows, CV_64F);

    cv::vconcat(points3d[0].t(), points3d[1].t(), point3dMat);
    cv::vconcat(point3dMat, points3d[2].t(), point3dMat);

    if (point3dMat.rows == 3)
        points2d = point3dMat;


}



void GrabRGBD(const sensor_msgs::ImageConstPtr &msgRGB,
              const sensor_msgs::ImageConstPtr &msgD);

int main(int argc, char **argv) {
    namedWindow("out", CV_WINDOW_AUTOSIZE);
    namedWindow("yellow", CV_WINDOW_AUTOSIZE);
    namedWindow("blue", CV_WINDOW_AUTOSIZE);
    namedWindow("black", CV_WINDOW_AUTOSIZE);
    namedWindow("white", CV_WINDOW_AUTOSIZE);
    namedWindow("Control", CV_WINDOW_AUTOSIZE); //create a window called "Control"
    namedWindow("ROI", CV_WINDOW_AUTOSIZE);
    cv::startWindowThread();
    ros::init(argc, argv, "image_listener");
    ros::NodeHandle nh;
    readParams(nh);

    //Create trackbars in "Control" window
    createTrackbar("angle", "Control", &iLowH, 179, MatchingMethod); //Hue (0-179)
    createTrackbar("HighH", "Control", &iHighH, 179, MatchingMethod);

    createTrackbar("LowS", "Control", &iLowS, 255, MatchingMethod);
    //Saturation (0 - 255)
    createTrackbar("HighS", "Control", &iHighS, 255, MatchingMethod);

    createTrackbar("LowV", "Control", &iLowV, 255, MatchingMethod); //Value (0-255)
    createTrackbar("HighV", "Control", &iHighV, 255, MatchingMethod);


    message_filters::Subscriber<sensor_msgs::Image> rgb_sub(nh, "/image_raw", 1);
    message_filters::Subscriber<sensor_msgs::Image> depth_sub(nh, "/image_depth",
                                                              1);
    typedef message_filters::sync_policies::ApproximateTime<
            sensor_msgs::Image, sensor_msgs::Image> sync_pol;
    message_filters::Synchronizer<sync_pol> sync(sync_pol(10), rgb_sub,
                                                 depth_sub);
    sync.registerCallback(
            boost::bind(&GrabRGBD, _1, _2)); //&ImageGrabber::GrabRGBD,&igb,_1,_2));

    pub = nh.advertise<std_msgs::Int32MultiArray>("/cone", 10);

    dat.layout.dim.push_back(std_msgs::MultiArrayDimension());
    dat.layout.dim.push_back(std_msgs::MultiArrayDimension());

    dat.layout.dim[0].label = "length";

    dat.layout.dim[1].label = "channel";
    dat.layout.dim[1].size = 4;
    dat.layout.dim[1].stride = 4;
    dat.layout.data_offset = 0;

    cout << "started\n";
    ros::spin();

    return 0;
}

/**
 * @function MatchingMethod
 * @brief Trackbar callback
 */
void MatchingMethod(int, void *) {
    Mat imgThresholded;
    Mat imgThresholdedBlue;
    Mat imgThresholdedYellow;
    Mat imgThresholdedBlack;
    Mat imgThresholdedWhite;
    Mat imgThresholdedBlueNWhite;
    Mat imgThresholdedYellowNBlack;


    inRange(imgHSV, Scalar(blueLowH, blueLowS, blueLowV), 			Scalar(blueHighH, blueHighS, blueHighV), imgThresholdedBlue); 

    inRange(imgHSV, Scalar(yellowLowH, yellowLowS, yellowLowV), 	Scalar(yellowHighH, yellowHighS, yellowHighV), imgThresholdedYellow);

    inRange(imgHSV, Scalar(blackLowH, blackLowS, blackLowV), 		Scalar(blackHighH, blackHighS, blackHighV), imgThresholdedBlack);

    inRange(imgHSV, Scalar(whiteLowH, whiteLowS, whiteLowV), 		Scalar(whiteHighH, whiteHighS, whiteHighV), imgThresholdedWhite);

    inRange(imgHSV, Scalar(iLowH, iLowS, iLowV), Scalar(iHighH, iHighS, iHighV), imgThresholded);

    // morphological closing (fill small holes in the foreground)
    erode(imgThresholdedBlue, imgThresholdedBlue,
          getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
    dilate(imgThresholdedBlue, imgThresholdedBlue,
           getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
    dilate(imgThresholdedBlue, imgThresholdedBlue,
           getStructuringElement(MORPH_DILATE, Size(5, 10)));
    // erode(imgThresholdedBlue, imgThresholdedBlue,
    // getStructuringElement(MORPH_ELLIPSE, Size(5, 5)) );

    // morphological opening (remove small objects from the foreground)
    erode(imgThresholdedYellow, imgThresholdedYellow,
          getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
    dilate(imgThresholdedYellow, imgThresholdedYellow,
           getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
    dilate(imgThresholdedYellow, imgThresholdedYellow,
           getStructuringElement(MORPH_DILATE, Size(5, 10)));
    // erode(imgThresholdedYellow, imgThresholdedYellow,
    // getStructuringElement(MORPH_ELLIPSE, Size(5, 5)) );

    // morphological closing (fill small holes in the foreground)
    erode(imgThresholdedBlack, imgThresholdedBlack,
          getStructuringElement(MORPH_ELLIPSE, Size(3, 3)));
    dilate(imgThresholdedBlack, imgThresholdedBlack,
           getStructuringElement(MORPH_ELLIPSE, Size(3, 3)));
    dilate(imgThresholdedBlack, imgThresholdedBlack,
           getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
    dilate(imgThresholdedBlack, imgThresholdedBlack,
           getStructuringElement(MORPH_DILATE, Size(5, 10)));
    // erode(imgThresholdedBlack, imgThresholdedBlack,
    // getStructuringElement(MORPH_ELLIPSE, Size(5, 5)) );

    // morphological closing (fill small holes in the foreground)
    erode(imgThresholdedWhite, imgThresholdedWhite,
          getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
    dilate(imgThresholdedWhite, imgThresholdedWhite,
           getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
    dilate(imgThresholdedWhite, imgThresholdedWhite,
           getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
    dilate(imgThresholdedWhite, imgThresholdedWhite,
           getStructuringElement(MORPH_DILATE, Size(5, 10)));

    cv::bitwise_and(imgThresholdedBlue, imgThresholdedWhite,
                    imgThresholdedBlueNWhite);
    cv::bitwise_and(imgThresholdedYellow, imgThresholdedBlack,
                    imgThresholdedYellowNBlack);


    Mat statsWhite, centroidsWhite, statsBlueNWhite, centroidsBlueNWhite;
    Mat labelImage;
    int nLabelsWhite = connectedComponentsWithStats(imgThresholdedWhite,
                                                    labelImage, statsWhite, centroidsWhite);
    int nLabelsBlueNWhite =
            connectedComponentsWithStats(imgThresholdedBlueNWhite, labelImage,
                                         statsBlueNWhite, centroidsBlueNWhite);

    cv::Scalar boundingBoxColorBlue(0, 255, 0);
    cv::Rect boundingBox;
    std::vector<double> conesLeftX, conesLeftY, conesLeftZ;
    std::vector<double> conesRightX, conesRightY, conesRightZ;


    for (int i = 1; i < nLabelsWhite; i++) {
        boundingBox = cv::Rect(statsWhite.at<int>(i, cv::CC_STAT_LEFT),
                               statsWhite.at<int>(i,
                                                  cv::CC_STAT_TOP),
                               statsWhite.at<int>(i,
                                                  cv::CC_STAT_WIDTH),
                               statsWhite.at<int>(i,
                                                  cv::CC_STAT_HEIGHT));

        if (boundingBox.area() < 4900 && boundingBox.height / boundingBox.width < 1.4
            && boundingBox.width / boundingBox.height < 1.4) {
            for (int j = 0; j < nLabelsBlueNWhite; j++) {
                if (boundingBox.contains(
                        Point(
                                centroidsBlueNWhite.at<double>(j, 0),
                                centroidsBlueNWhite.at<double>(j, 1)))) {
                    double x = centroidsWhite.at<double>(i, 0);
                    double y = centroidsWhite.at<double>(i, 1);


                    cv::Rect depthSumWindowROI(cv::Point(x - 2,
                                                         y - 2), cv::Size(5, 5));
                    //cv::Mat depthSumWindowMat =
                    imgDepth(depthSumWindowROI);
                    //double z =
                    cv::sum(depthSumWindowMat)[0] / cv::countNonZero(depthSumWindowMat);
                    double z = imgDepth.at<unsigned short>(y, x);
                    if (!isnan(z) && z < 15000 && z > 1000) {
                        conesRightX.push_back(x * 2);
                        conesRightY.push_back(y * 2 + (imgOriginal.rows >> 1) + 60);
                        conesRightZ.push_back(z);
                        std::ostringstream str;
                        str << "x: " << x << ", y: " << y << ", z:"<<z<<"\n";

                        cv::rectangle(roi, boundingBox,
                                      boundingBoxColorBlue, 2);
                        cv::putText(roi,
                                    cv::String(str.str()), boundingBox.tl(), cv::FONT_HERSHEY_PLAIN, 0.8,
                                    cvScalar(200, 200, 250), 1, CV_AA);
                        break;
                    }
                }
            }
        }
    }

    Mat statsBlack, centroidsBlack, statsYellowNBlack, centroidsYellowNBlack;
    // Mat labelImage;
    int nLabelsBlack = connectedComponentsWithStats(
            imgThresholdedBlack, labelImage, statsBlack, centroidsBlack);
    int nLabelsYellowNBlack =
            connectedComponentsWithStats(imgThresholdedYellowNBlack, labelImage,
                                         statsYellowNBlack, centroidsYellowNBlack);

    cv::Scalar boundingBoxColorYellow(255, 0, 0);
    // cv::Rect boundingBox;

    for (int i = 1; i < nLabelsBlack; i++) {
        boundingBox = cv::Rect(statsBlack.at<int>(i, cv::CC_STAT_LEFT),
                               statsBlack.at<int>(i, cv::CC_STAT_TOP),
                               statsBlack.at<int>(i, cv::CC_STAT_WIDTH),
                               statsBlack.at<int>(i, cv::CC_STAT_HEIGHT));

        if (boundingBox.area() < 4900 &&
            boundingBox.height / boundingBox.width < 1.4 &&
            boundingBox.width / boundingBox.height < 1.4) {
            for (int j = 0; j < nLabelsYellowNBlack; j++) {
                if (boundingBox.contains(Point(centroidsYellowNBlack.at<double>(j, 0),
                                               centroidsYellowNBlack.at<double>(j, 1)))) {
                    double x = centroidsBlack.at<double>(i, 0);
                    double y = centroidsBlack.at<double>(i, 1);

                    cv::Rect depthSumWindowROI(cv::Point(x - 1, y - 1), cv::Size(3, 3));
                    // cv::Mat depthSumWindowMat = imgDepth(depthSumWindowROI);
                    // double z =
                    // cv::sum(depthSumWindowMat)[0]/cv::countNonZero(depthSumWindowMat);
                    double z = imgDepth.at<unsigned short>(y, x);
                    if (!isnan(z) & z < 15000 && z > 1000) {
                        cv::rectangle(roi, boundingBox, boundingBoxColorYellow, 2);
                        conesLeftX.push_back(x * 2);
                        conesLeftY.push_back(y * 2 + (imgOriginal.rows >> 1) + 60);
                        conesLeftZ.push_back(z);

                        std::ostringstream str;
                        str << "x: " << x << ", y: " << y << ", z:" << z << "\n";
                        cv::putText(roi, cv::String(str.str()), boundingBox.tl(),
                                    cv::FONT_HERSHEY_PLAIN, 0.8, cvScalar(200, 200, 250), 1,
                                    CV_AA);
                        break;
                    }
                }
            }
        }
    }

    Mat points2dRight, points2dLeft;

    groundProjection2D_from_rgbd(K, P, Mat(conesRightX), Mat(conesRightY),
                                 Mat(conesRightZ), points2dRight, 1);
    groundProjection2D_from_rgbd(K, P, Mat(conesLeftX), Mat(conesLeftY),
                                 Mat(conesLeftZ), points2dLeft, 1);

    points2dRight.convertTo(points2dRight, CV_32S);
    points2dLeft.convertTo(points2dLeft, CV_32S);

    Mat allCones;

    if (!points2dRight.empty()) {
        hconcat(points2dRight.t(),
                Mat::ones(points2dRight.cols, 1, points2dRight.type()),
                points2dRight);
        if (!points2dLeft.empty()) {
            hconcat(points2dLeft.t(),
                    Mat::zeros(points2dLeft.cols, 1, points2dLeft.type()),
                    points2dLeft);
            vconcat(points2dRight, points2dLeft, allCones);
        } else {
            allCones = points2dRight;
        }
    } else if (!points2dLeft.empty()) {
        hconcat(points2dLeft.t(),
                Mat::zeros(points2dLeft.cols, 1, points2dLeft.type()), allCones);
    } else {

        // return;
    }

    dat.data.clear();

    if (!allCones.empty()) {
        dat.data.assign(allCones.begin<int>(), allCones.end<int>());
    }


    dat.layout.dim[0].size = dat.data.size() / 4;
    dat.layout.dim[0].stride = dat.data.size();

    pub.publish(dat);

    imshow("ROI", roi);
    imshow("blue", imgThresholdedBlue);
    imshow("yellow", imgThresholdedYellow);
    imshow("black", imgThresholdedBlack);
    imshow("white", imgThresholdedWhite);
    imshow("out", imgThresholded);

}

void GrabRGBD(const sensor_msgs::ImageConstPtr &msgRGB,
              const sensor_msgs::ImageConstPtr &msgD) {

    auto start = std::chrono::system_clock::now();

    imgOriginal = cv_bridge::toCvCopy(msgRGB, "bgr8")->image;
    imgDepth = cv_bridge::toCvCopy(msgD, "16UC1")->image;

    roi = Mat(imgOriginal, Rect(0, (imgOriginal.rows >> 1) + 60, imgOriginal.cols,
                                (imgOriginal.rows >> 1) - 60));
    imgDepth = Mat(imgDepth, Rect(0, (imgDepth.rows >> 1) + 60, imgDepth.cols,
                                  (imgDepth.rows >> 1) - 60));
    cv::resize(roi, roi, Size(), 0.5, 0.5, cv::INTER_NEAREST);
    cv::resize(imgDepth, imgDepth, Size(), 0.5, 0.5, cv::INTER_NEAREST);

    cvtColor(roi, imgHSV,
             COLOR_BGR2HSV); // Convert the captured frame from BGR to HSV

    MatchingMethod(0, 0);
    waitKey(1);
    auto end = std::chrono::system_clock::now();

    ROS_INFO("execution time: %d",
             std::chrono::duration_cast<std::chrono::milliseconds>(end - start));
}
