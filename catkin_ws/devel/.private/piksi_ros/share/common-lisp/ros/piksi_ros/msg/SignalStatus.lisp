; Auto-generated. Do not edit!


(cl:in-package piksi_ros-msg)


;//! \htmlinclude SignalStatus.msg.html

(cl:defclass <SignalStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (num_sats
    :reader num_sats
    :initarg :num_sats
    :type cl:integer
    :initform 0)
   (mean_cn0
    :reader mean_cn0
    :initarg :mean_cn0
    :type cl:float
    :initform 0.0)
   (median_cn0
    :reader median_cn0
    :initarg :median_cn0
    :type cl:float
    :initform 0.0)
   (robust_mean_cn0
    :reader robust_mean_cn0
    :initarg :robust_mean_cn0
    :type cl:float
    :initform 0.0))
)

(cl:defclass SignalStatus (<SignalStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SignalStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SignalStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name piksi_ros-msg:<SignalStatus> is deprecated: use piksi_ros-msg:SignalStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SignalStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:header-val is deprecated.  Use piksi_ros-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'num_sats-val :lambda-list '(m))
(cl:defmethod num_sats-val ((m <SignalStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:num_sats-val is deprecated.  Use piksi_ros-msg:num_sats instead.")
  (num_sats m))

(cl:ensure-generic-function 'mean_cn0-val :lambda-list '(m))
(cl:defmethod mean_cn0-val ((m <SignalStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:mean_cn0-val is deprecated.  Use piksi_ros-msg:mean_cn0 instead.")
  (mean_cn0 m))

(cl:ensure-generic-function 'median_cn0-val :lambda-list '(m))
(cl:defmethod median_cn0-val ((m <SignalStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:median_cn0-val is deprecated.  Use piksi_ros-msg:median_cn0 instead.")
  (median_cn0 m))

(cl:ensure-generic-function 'robust_mean_cn0-val :lambda-list '(m))
(cl:defmethod robust_mean_cn0-val ((m <SignalStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:robust_mean_cn0-val is deprecated.  Use piksi_ros-msg:robust_mean_cn0 instead.")
  (robust_mean_cn0 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SignalStatus>) ostream)
  "Serializes a message object of type '<SignalStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'num_sats)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mean_cn0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'median_cn0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'robust_mean_cn0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SignalStatus>) istream)
  "Deserializes a message object of type '<SignalStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_sats) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mean_cn0) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'median_cn0) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'robust_mean_cn0) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SignalStatus>)))
  "Returns string type for a message object of type '<SignalStatus>"
  "piksi_ros/SignalStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SignalStatus)))
  "Returns string type for a message object of type 'SignalStatus"
  "piksi_ros/SignalStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SignalStatus>)))
  "Returns md5sum for a message object of type '<SignalStatus>"
  "0e5693267b8a40f28e0cb8ae142b2ffb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SignalStatus)))
  "Returns md5sum for a message object of type 'SignalStatus"
  "0e5693267b8a40f28e0cb8ae142b2ffb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SignalStatus>)))
  "Returns full string definition for message of type '<SignalStatus>"
  (cl:format cl:nil "Header header # ROS header~%~%int32 num_sats~%~%float32 mean_cn0~%float32 median_cn0~%float32 robust_mean_cn0~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SignalStatus)))
  "Returns full string definition for message of type 'SignalStatus"
  (cl:format cl:nil "Header header # ROS header~%~%int32 num_sats~%~%float32 mean_cn0~%float32 median_cn0~%float32 robust_mean_cn0~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SignalStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SignalStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'SignalStatus
    (cl:cons ':header (header msg))
    (cl:cons ':num_sats (num_sats msg))
    (cl:cons ':mean_cn0 (mean_cn0 msg))
    (cl:cons ':median_cn0 (median_cn0 msg))
    (cl:cons ':robust_mean_cn0 (robust_mean_cn0 msg))
))
