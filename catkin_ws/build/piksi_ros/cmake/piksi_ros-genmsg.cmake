# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "piksi_ros: 6 messages, 0 services")

set(MSG_I_FLAGS "-Ipiksi_ros:/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(piksi_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg" NAME_WE)
add_custom_target(_piksi_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "piksi_ros" "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg" "piksi_ros/Sid:piksi_ros/Obs:std_msgs/Header:piksi_ros/CarrierPhase"
)

get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg" NAME_WE)
add_custom_target(_piksi_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "piksi_ros" "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg" ""
)

get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg" NAME_WE)
add_custom_target(_piksi_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "piksi_ros" "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg" "piksi_ros/Sid:piksi_ros/CarrierPhase"
)

get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg" NAME_WE)
add_custom_target(_piksi_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "piksi_ros" "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg" ""
)

get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg" NAME_WE)
add_custom_target(_piksi_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "piksi_ros" "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg" NAME_WE)
add_custom_target(_piksi_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "piksi_ros" "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg" "piksi_ros/Sid:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_ros
)
_generate_msg_cpp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_ros
)
_generate_msg_cpp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_ros
)
_generate_msg_cpp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_ros
)
_generate_msg_cpp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_ros
)
_generate_msg_cpp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_ros
)

### Generating Services

### Generating Module File
_generate_module_cpp(piksi_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(piksi_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(piksi_ros_generate_messages piksi_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_cpp _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_cpp _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_cpp _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_cpp _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_cpp _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_cpp _piksi_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(piksi_ros_gencpp)
add_dependencies(piksi_ros_gencpp piksi_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS piksi_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_ros
)
_generate_msg_eus(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_ros
)
_generate_msg_eus(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_ros
)
_generate_msg_eus(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_ros
)
_generate_msg_eus(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_ros
)
_generate_msg_eus(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_ros
)

### Generating Services

### Generating Module File
_generate_module_eus(piksi_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(piksi_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(piksi_ros_generate_messages piksi_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_eus _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_eus _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_eus _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_eus _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_eus _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_eus _piksi_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(piksi_ros_geneus)
add_dependencies(piksi_ros_geneus piksi_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS piksi_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_ros
)
_generate_msg_lisp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_ros
)
_generate_msg_lisp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_ros
)
_generate_msg_lisp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_ros
)
_generate_msg_lisp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_ros
)
_generate_msg_lisp(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_ros
)

### Generating Services

### Generating Module File
_generate_module_lisp(piksi_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(piksi_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(piksi_ros_generate_messages piksi_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_lisp _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_lisp _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_lisp _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_lisp _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_lisp _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_lisp _piksi_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(piksi_ros_genlisp)
add_dependencies(piksi_ros_genlisp piksi_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS piksi_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_ros
)
_generate_msg_nodejs(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_ros
)
_generate_msg_nodejs(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_ros
)
_generate_msg_nodejs(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_ros
)
_generate_msg_nodejs(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_ros
)
_generate_msg_nodejs(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_ros
)

### Generating Services

### Generating Module File
_generate_module_nodejs(piksi_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(piksi_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(piksi_ros_generate_messages piksi_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_nodejs _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_nodejs _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_nodejs _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_nodejs _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_nodejs _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_nodejs _piksi_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(piksi_ros_gennodejs)
add_dependencies(piksi_ros_gennodejs piksi_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS piksi_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_ros
)
_generate_msg_py(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_ros
)
_generate_msg_py(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_ros
)
_generate_msg_py(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_ros
)
_generate_msg_py(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_ros
)
_generate_msg_py(piksi_ros
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg"
  "${MSG_I_FLAGS}"
  "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_ros
)

### Generating Services

### Generating Module File
_generate_module_py(piksi_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(piksi_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(piksi_ros_generate_messages piksi_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Observations.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_py _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Sid.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_py _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Obs.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_py _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/CarrierPhase.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_py _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/SignalStatus.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_py _piksi_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_ros/msg/Ephemeris.msg" NAME_WE)
add_dependencies(piksi_ros_generate_messages_py _piksi_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(piksi_ros_genpy)
add_dependencies(piksi_ros_genpy piksi_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS piksi_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(piksi_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(piksi_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(piksi_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(piksi_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(piksi_ros_generate_messages_py std_msgs_generate_messages_py)
endif()
