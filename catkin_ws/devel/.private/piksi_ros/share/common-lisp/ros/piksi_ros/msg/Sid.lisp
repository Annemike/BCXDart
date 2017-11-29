; Auto-generated. Do not edit!


(cl:in-package piksi_ros-msg)


;//! \htmlinclude Sid.msg.html

(cl:defclass <Sid> (roslisp-msg-protocol:ros-message)
  ((sat
    :reader sat
    :initarg :sat
    :type cl:fixnum
    :initform 0)
   (band
    :reader band
    :initarg :band
    :type cl:fixnum
    :initform 0)
   (constellation
    :reader constellation
    :initarg :constellation
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Sid (<Sid>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Sid>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Sid)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name piksi_ros-msg:<Sid> is deprecated: use piksi_ros-msg:Sid instead.")))

(cl:ensure-generic-function 'sat-val :lambda-list '(m))
(cl:defmethod sat-val ((m <Sid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:sat-val is deprecated.  Use piksi_ros-msg:sat instead.")
  (sat m))

(cl:ensure-generic-function 'band-val :lambda-list '(m))
(cl:defmethod band-val ((m <Sid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:band-val is deprecated.  Use piksi_ros-msg:band instead.")
  (band m))

(cl:ensure-generic-function 'constellation-val :lambda-list '(m))
(cl:defmethod constellation-val ((m <Sid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:constellation-val is deprecated.  Use piksi_ros-msg:constellation instead.")
  (constellation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Sid>) ostream)
  "Serializes a message object of type '<Sid>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sat)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sat)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'band)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'constellation)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Sid>) istream)
  "Deserializes a message object of type '<Sid>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sat)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sat)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'band)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'constellation)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Sid>)))
  "Returns string type for a message object of type '<Sid>"
  "piksi_ros/Sid")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sid)))
  "Returns string type for a message object of type 'Sid"
  "piksi_ros/Sid")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Sid>)))
  "Returns md5sum for a message object of type '<Sid>"
  "5d0865629d1d86dcdf3df8f0aa144e51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Sid)))
  "Returns md5sum for a message object of type 'Sid"
  "5d0865629d1d86dcdf3df8f0aa144e51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Sid>)))
  "Returns full string definition for message of type '<Sid>"
  (cl:format cl:nil "uint16 sat # Constellation-specific satellite identifier~%uint8 band # Signal band~%uint8 constellation # Constellation to which the satellite belongs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Sid)))
  "Returns full string definition for message of type 'Sid"
  (cl:format cl:nil "uint16 sat # Constellation-specific satellite identifier~%uint8 band # Signal band~%uint8 constellation # Constellation to which the satellite belongs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Sid>))
  (cl:+ 0
     2
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Sid>))
  "Converts a ROS message object to a list"
  (cl:list 'Sid
    (cl:cons ':sat (sat msg))
    (cl:cons ':band (band msg))
    (cl:cons ':constellation (constellation msg))
))
