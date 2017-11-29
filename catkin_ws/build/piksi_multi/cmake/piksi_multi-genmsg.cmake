# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(FATAL_ERROR "Could not find messages which '/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Ephemeris.msg' depends on. Did you forget to specify generate_messages(DEPENDENCIES ...)?
Cannot locate message [Sid]: unknown package [piksi_ros] on search path [{'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'piksi_multi': ['/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg']}]")
message(FATAL_ERROR "Could not find messages which '/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Obs.msg' depends on. Did you forget to specify generate_messages(DEPENDENCIES ...)?
Cannot locate message [CarrierPhase]: unknown package [piksi_ros] on search path [{'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'piksi_multi': ['/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg']}]")
message(FATAL_ERROR "Could not find messages which '/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Observations.msg' depends on. Did you forget to specify generate_messages(DEPENDENCIES ...)?
Cannot locate message [Obs]: unknown package [piksi_ros] on search path [{'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'piksi_multi': ['/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg']}]")
message(STATUS "piksi_multi: 6 messages, 0 services")

set(MSG_I_FLAGS "-Ipiksi_multi:/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(piksi_multi_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg" NAME_WE)
add_custom_target(_piksi_multi_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "piksi_multi" "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg" ""
)

get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg" NAME_WE)
add_custom_target(_piksi_multi_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "piksi_multi" "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg" NAME_WE)
add_custom_target(_piksi_multi_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "piksi_multi" "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_multi
)
_generate_msg_cpp(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_multi
)
_generate_msg_cpp(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_multi
)

### Generating Services

### Generating Module File
_generate_module_cpp(piksi_multi
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_multi
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(piksi_multi_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(piksi_multi_generate_messages piksi_multi_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_cpp _piksi_multi_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_cpp _piksi_multi_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_cpp _piksi_multi_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(piksi_multi_gencpp)
add_dependencies(piksi_multi_gencpp piksi_multi_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS piksi_multi_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_multi
)
_generate_msg_eus(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_multi
)
_generate_msg_eus(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_multi
)

### Generating Services

### Generating Module File
_generate_module_eus(piksi_multi
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_multi
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(piksi_multi_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(piksi_multi_generate_messages piksi_multi_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_eus _piksi_multi_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_eus _piksi_multi_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_eus _piksi_multi_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(piksi_multi_geneus)
add_dependencies(piksi_multi_geneus piksi_multi_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS piksi_multi_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_multi
)
_generate_msg_lisp(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_multi
)
_generate_msg_lisp(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_multi
)

### Generating Services

### Generating Module File
_generate_module_lisp(piksi_multi
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_multi
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(piksi_multi_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(piksi_multi_generate_messages piksi_multi_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_lisp _piksi_multi_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_lisp _piksi_multi_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_lisp _piksi_multi_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(piksi_multi_genlisp)
add_dependencies(piksi_multi_genlisp piksi_multi_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS piksi_multi_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_multi
)
_generate_msg_nodejs(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_multi
)
_generate_msg_nodejs(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_multi
)

### Generating Services

### Generating Module File
_generate_module_nodejs(piksi_multi
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_multi
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(piksi_multi_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(piksi_multi_generate_messages piksi_multi_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_nodejs _piksi_multi_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_nodejs _piksi_multi_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_nodejs _piksi_multi_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(piksi_multi_gennodejs)
add_dependencies(piksi_multi_gennodejs piksi_multi_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS piksi_multi_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_multi
)
_generate_msg_py(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_multi
)
_generate_msg_py(piksi_multi
  "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_multi
)

### Generating Services

### Generating Module File
_generate_module_py(piksi_multi
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_multi
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(piksi_multi_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(piksi_multi_generate_messages piksi_multi_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/Sid.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_py _piksi_multi_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/SignalStatus.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_py _piksi_multi_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/christian/DARTFSD/catkin_ws/src/piksi_multi/msg/CarrierPhase.msg" NAME_WE)
add_dependencies(piksi_multi_generate_messages_py _piksi_multi_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(piksi_multi_genpy)
add_dependencies(piksi_multi_genpy piksi_multi_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS piksi_multi_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_multi)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/piksi_multi
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(piksi_multi_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_multi)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/piksi_multi
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(piksi_multi_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_multi)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/piksi_multi
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(piksi_multi_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_multi)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/piksi_multi
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(piksi_multi_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_multi)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_multi\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/piksi_multi
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(piksi_multi_generate_messages_py std_msgs_generate_messages_py)
endif()
