; Auto-generated. Do not edit!


(cl:in-package piksi_ros-msg)


;//! \htmlinclude Observations.msg.html

(cl:defclass <Observations> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (tow
    :reader tow
    :initarg :tow
    :type cl:integer
    :initform 0)
   (wn
    :reader wn
    :initarg :wn
    :type cl:fixnum
    :initform 0)
   (n_obs
    :reader n_obs
    :initarg :n_obs
    :type cl:fixnum
    :initform 0)
   (obs
    :reader obs
    :initarg :obs
    :type (cl:vector piksi_ros-msg:Obs)
   :initform (cl:make-array 0 :element-type 'piksi_ros-msg:Obs :initial-element (cl:make-instance 'piksi_ros-msg:Obs))))
)

(cl:defclass Observations (<Observations>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Observations>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Observations)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name piksi_ros-msg:<Observations> is deprecated: use piksi_ros-msg:Observations instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Observations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:header-val is deprecated.  Use piksi_ros-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'tow-val :lambda-list '(m))
(cl:defmethod tow-val ((m <Observations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:tow-val is deprecated.  Use piksi_ros-msg:tow instead.")
  (tow m))

(cl:ensure-generic-function 'wn-val :lambda-list '(m))
(cl:defmethod wn-val ((m <Observations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:wn-val is deprecated.  Use piksi_ros-msg:wn instead.")
  (wn m))

(cl:ensure-generic-function 'n_obs-val :lambda-list '(m))
(cl:defmethod n_obs-val ((m <Observations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:n_obs-val is deprecated.  Use piksi_ros-msg:n_obs instead.")
  (n_obs m))

(cl:ensure-generic-function 'obs-val :lambda-list '(m))
(cl:defmethod obs-val ((m <Observations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:obs-val is deprecated.  Use piksi_ros-msg:obs instead.")
  (obs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Observations>) ostream)
  "Serializes a message object of type '<Observations>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tow)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'tow)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'tow)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'tow)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wn)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wn)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'n_obs)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Observations>) istream)
  "Deserializes a message object of type '<Observations>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tow)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'tow)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'tow)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'tow)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wn)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wn)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'n_obs)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'piksi_ros-msg:Obs))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Observations>)))
  "Returns string type for a message object of type '<Observations>"
  "piksi_ros/Observations")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Observations)))
  "Returns string type for a message object of type 'Observations"
  "piksi_ros/Observations")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Observations>)))
  "Returns md5sum for a message object of type '<Observations>"
  "e53a651b9eb94ee6416715c723ccbfb6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Observations)))
  "Returns md5sum for a message object of type 'Observations"
  "e53a651b9eb94ee6416715c723ccbfb6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Observations>)))
  "Returns full string definition for message of type '<Observations>"
  (cl:format cl:nil "Header header # ROS header~%~%uint32 tow # Milliseconds since start of GPS week~%uint16 wn # GPS week number~%uint8 n_obs # Total number of observations~%~%piksi_ros/Obs[] obs # Observations~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: piksi_ros/Obs~%uint32 P # Psueudorange observation [cm]~%piksi_ros/CarrierPhase L # Carrier phase [cycles]~%uint8 cn0 # Carrier-to-Noise density [dB Hz * 4]~%uint16 lock # Lock indicator. This value changes whenever a satellite signal has lost and regained lock, indicating that the carrier phase ambiguity may have changed~%piksi_ros/Sid sid # Satellite identifier~%~%================================================================================~%MSG: piksi_ros/CarrierPhase~%# Carrier phase observation here is represented as a 40-bit fixed~%# point number with Q32.8 layout (i.e. 32-bits of whole cycles and 8-bits of fractional cycles).~%~%int32 i # Carrier phase whole cycles [cycles]~%uint8 f # Carrier phase fractional part [cycles/256]~%~%================================================================================~%MSG: piksi_ros/Sid~%uint16 sat # Constellation-specific satellite identifier~%uint8 band # Signal band~%uint8 constellation # Constellation to which the satellite belongs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Observations)))
  "Returns full string definition for message of type 'Observations"
  (cl:format cl:nil "Header header # ROS header~%~%uint32 tow # Milliseconds since start of GPS week~%uint16 wn # GPS week number~%uint8 n_obs # Total number of observations~%~%piksi_ros/Obs[] obs # Observations~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: piksi_ros/Obs~%uint32 P # Psueudorange observation [cm]~%piksi_ros/CarrierPhase L # Carrier phase [cycles]~%uint8 cn0 # Carrier-to-Noise density [dB Hz * 4]~%uint16 lock # Lock indicator. This value changes whenever a satellite signal has lost and regained lock, indicating that the carrier phase ambiguity may have changed~%piksi_ros/Sid sid # Satellite identifier~%~%================================================================================~%MSG: piksi_ros/CarrierPhase~%# Carrier phase observation here is represented as a 40-bit fixed~%# point number with Q32.8 layout (i.e. 32-bits of whole cycles and 8-bits of fractional cycles).~%~%int32 i # Carrier phase whole cycles [cycles]~%uint8 f # Carrier phase fractional part [cycles/256]~%~%================================================================================~%MSG: piksi_ros/Sid~%uint16 sat # Constellation-specific satellite identifier~%uint8 band # Signal band~%uint8 constellation # Constellation to which the satellite belongs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Observations>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     2
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Observations>))
  "Converts a ROS message object to a list"
  (cl:list 'Observations
    (cl:cons ':header (header msg))
    (cl:cons ':tow (tow msg))
    (cl:cons ':wn (wn msg))
    (cl:cons ':n_obs (n_obs msg))
    (cl:cons ':obs (obs msg))
))
