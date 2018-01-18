cmake_minimum_required(VERSION 2.8.3)
project(camera_lidar_fusion)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  dart_msgs
  roscpp
  rospy
  sensor_msgs
  std_msgs
  message_filters
  cv_bridge
  geometry_msgs
  image_transport
  image_geometry
  tf
)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)
find_package(OpenCV REQUIRED)

catkin_package(
#  INCLUDE_DIRS include
  LIBRARIES camera_lidar_fusion
#  CATKIN_DEPENDS dart_msgs roscpp rospy sensor_msgs std_msgs
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
 include
  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
)

add_executable(${PROJECT_NAME}_node src/camera_lidar_fusion_node.cpp)
add_executable(${PROJECT_NAME}_visualization_node src/camera_lidar_fusion_visualization_node.cpp)

 add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
 add_dependencies(${PROJECT_NAME}_visualization_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
 target_link_libraries(${PROJECT_NAME}_node
   ${catkin_LIBRARIES}
   ${OpenCV_LIBS}
 )
 target_link_libraries(${PROJECT_NAME}_visualization_node
   ${catkin_LIBRARIES}
   ${OpenCV_LIBS}
 )













