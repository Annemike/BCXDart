;; Auto-generated. Do not edit!


(when (boundp 'piksi_ros::SignalStatus)
  (if (not (find-package "PIKSI_ROS"))
    (make-package "PIKSI_ROS"))
  (shadow 'SignalStatus (find-package "PIKSI_ROS")))
(unless (find-package "PIKSI_ROS::SIGNALSTATUS")
  (make-package "PIKSI_ROS::SIGNALSTATUS"))

(in-package "ROS")
;;//! \htmlinclude SignalStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass piksi_ros::SignalStatus
  :super ros::object
  :slots (_header _num_sats _mean_cn0 _median_cn0 _robust_mean_cn0 ))

(defmethod piksi_ros::SignalStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:num_sats __num_sats) 0)
    ((:mean_cn0 __mean_cn0) 0.0)
    ((:median_cn0 __median_cn0) 0.0)
    ((:robust_mean_cn0 __robust_mean_cn0) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _num_sats (round __num_sats))
   (setq _mean_cn0 (float __mean_cn0))
   (setq _median_cn0 (float __median_cn0))
   (setq _robust_mean_cn0 (float __robust_mean_cn0))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:num_sats
   (&optional __num_sats)
   (if __num_sats (setq _num_sats __num_sats)) _num_sats)
  (:mean_cn0
   (&optional __mean_cn0)
   (if __mean_cn0 (setq _mean_cn0 __mean_cn0)) _mean_cn0)
  (:median_cn0
   (&optional __median_cn0)
   (if __median_cn0 (setq _median_cn0 __median_cn0)) _median_cn0)
  (:robust_mean_cn0
   (&optional __robust_mean_cn0)
   (if __robust_mean_cn0 (setq _robust_mean_cn0 __robust_mean_cn0)) _robust_mean_cn0)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _num_sats
    4
    ;; float32 _mean_cn0
    4
    ;; float32 _median_cn0
    4
    ;; float32 _robust_mean_cn0
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _num_sats
       (write-long _num_sats s)
     ;; float32 _mean_cn0
       (sys::poke _mean_cn0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _median_cn0
       (sys::poke _median_cn0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _robust_mean_cn0
       (sys::poke _robust_mean_cn0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _num_sats
     (setq _num_sats (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _mean_cn0
     (setq _mean_cn0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _median_cn0
     (setq _median_cn0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _robust_mean_cn0
     (setq _robust_mean_cn0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get piksi_ros::SignalStatus :md5sum-) "0e5693267b8a40f28e0cb8ae142b2ffb")
(setf (get piksi_ros::SignalStatus :datatype-) "piksi_ros/SignalStatus")
(setf (get piksi_ros::SignalStatus :definition-)
      "Header header # ROS header

int32 num_sats

float32 mean_cn0
float32 median_cn0
float32 robust_mean_cn0

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :piksi_ros/SignalStatus "0e5693267b8a40f28e0cb8ae142b2ffb")


