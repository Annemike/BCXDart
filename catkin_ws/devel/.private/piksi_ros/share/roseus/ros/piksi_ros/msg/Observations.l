;; Auto-generated. Do not edit!


(when (boundp 'piksi_ros::Observations)
  (if (not (find-package "PIKSI_ROS"))
    (make-package "PIKSI_ROS"))
  (shadow 'Observations (find-package "PIKSI_ROS")))
(unless (find-package "PIKSI_ROS::OBSERVATIONS")
  (make-package "PIKSI_ROS::OBSERVATIONS"))

(in-package "ROS")
;;//! \htmlinclude Observations.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass piksi_ros::Observations
  :super ros::object
  :slots (_header _tow _wn _n_obs _obs ))

(defmethod piksi_ros::Observations
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:tow __tow) 0)
    ((:wn __wn) 0)
    ((:n_obs __n_obs) 0)
    ((:obs __obs) (let (r) (dotimes (i 0) (push (instance piksi_ros::Obs :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _tow (round __tow))
   (setq _wn (round __wn))
   (setq _n_obs (round __n_obs))
   (setq _obs __obs)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:tow
   (&optional __tow)
   (if __tow (setq _tow __tow)) _tow)
  (:wn
   (&optional __wn)
   (if __wn (setq _wn __wn)) _wn)
  (:n_obs
   (&optional __n_obs)
   (if __n_obs (setq _n_obs __n_obs)) _n_obs)
  (:obs
   (&rest __obs)
   (if (keywordp (car __obs))
       (send* _obs __obs)
     (progn
       (if __obs (setq _obs (car __obs)))
       _obs)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _tow
    4
    ;; uint16 _wn
    2
    ;; uint8 _n_obs
    1
    ;; piksi_ros/Obs[] _obs
    (apply #'+ (send-all _obs :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _tow
       (write-long _tow s)
     ;; uint16 _wn
       (write-word _wn s)
     ;; uint8 _n_obs
       (write-byte _n_obs s)
     ;; piksi_ros/Obs[] _obs
     (write-long (length _obs) s)
     (dolist (elem _obs)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _tow
     (setq _tow (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _wn
     (setq _wn (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _n_obs
     (setq _n_obs (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; piksi_ros/Obs[] _obs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obs (let (r) (dotimes (i n) (push (instance piksi_ros::Obs :init) r)) r))
     (dolist (elem- _obs)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get piksi_ros::Observations :md5sum-) "e53a651b9eb94ee6416715c723ccbfb6")
(setf (get piksi_ros::Observations :datatype-) "piksi_ros/Observations")
(setf (get piksi_ros::Observations :definition-)
      "Header header # ROS header

uint32 tow # Milliseconds since start of GPS week
uint16 wn # GPS week number
uint8 n_obs # Total number of observations

piksi_ros/Obs[] obs # Observations

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

================================================================================
MSG: piksi_ros/Obs
uint32 P # Psueudorange observation [cm]
piksi_ros/CarrierPhase L # Carrier phase [cycles]
uint8 cn0 # Carrier-to-Noise density [dB Hz * 4]
uint16 lock # Lock indicator. This value changes whenever a satellite signal has lost and regained lock, indicating that the carrier phase ambiguity may have changed
piksi_ros/Sid sid # Satellite identifier

================================================================================
MSG: piksi_ros/CarrierPhase
# Carrier phase observation here is represented as a 40-bit fixed
# point number with Q32.8 layout (i.e. 32-bits of whole cycles and 8-bits of fractional cycles).

int32 i # Carrier phase whole cycles [cycles]
uint8 f # Carrier phase fractional part [cycles/256]

================================================================================
MSG: piksi_ros/Sid
uint16 sat # Constellation-specific satellite identifier
uint8 band # Signal band
uint8 constellation # Constellation to which the satellite belongs

")



(provide :piksi_ros/Observations "e53a651b9eb94ee6416715c723ccbfb6")


