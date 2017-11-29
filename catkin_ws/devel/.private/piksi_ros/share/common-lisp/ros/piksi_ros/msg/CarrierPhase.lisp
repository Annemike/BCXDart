; Auto-generated. Do not edit!


(cl:in-package piksi_ros-msg)


;//! \htmlinclude CarrierPhase.msg.html

(cl:defclass <CarrierPhase> (roslisp-msg-protocol:ros-message)
  ((i
    :reader i
    :initarg :i
    :type cl:integer
    :initform 0)
   (f
    :reader f
    :initarg :f
    :type cl:fixnum
    :initform 0))
)

(cl:defclass CarrierPhase (<CarrierPhase>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CarrierPhase>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CarrierPhase)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name piksi_ros-msg:<CarrierPhase> is deprecated: use piksi_ros-msg:CarrierPhase instead.")))

(cl:ensure-generic-function 'i-val :lambda-list '(m))
(cl:defmethod i-val ((m <CarrierPhase>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:i-val is deprecated.  Use piksi_ros-msg:i instead.")
  (i m))

(cl:ensure-generic-function 'f-val :lambda-list '(m))
(cl:defmethod f-val ((m <CarrierPhase>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:f-val is deprecated.  Use piksi_ros-msg:f instead.")
  (f m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CarrierPhase>) ostream)
  "Serializes a message object of type '<CarrierPhase>"
  (cl:let* ((signed (cl:slot-value msg 'i)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'f)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CarrierPhase>) istream)
  "Deserializes a message object of type '<CarrierPhase>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'f)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CarrierPhase>)))
  "Returns string type for a message object of type '<CarrierPhase>"
  "piksi_ros/CarrierPhase")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarrierPhase)))
  "Returns string type for a message object of type 'CarrierPhase"
  "piksi_ros/CarrierPhase")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CarrierPhase>)))
  "Returns md5sum for a message object of type '<CarrierPhase>"
  "03e7515b70723eadfe3c0e1e43e29e21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CarrierPhase)))
  "Returns md5sum for a message object of type 'CarrierPhase"
  "03e7515b70723eadfe3c0e1e43e29e21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CarrierPhase>)))
  "Returns full string definition for message of type '<CarrierPhase>"
  (cl:format cl:nil "# Carrier phase observation here is represented as a 40-bit fixed~%# point number with Q32.8 layout (i.e. 32-bits of whole cycles and 8-bits of fractional cycles).~%~%int32 i # Carrier phase whole cycles [cycles]~%uint8 f # Carrier phase fractional part [cycles/256]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CarrierPhase)))
  "Returns full string definition for message of type 'CarrierPhase"
  (cl:format cl:nil "# Carrier phase observation here is represented as a 40-bit fixed~%# point number with Q32.8 layout (i.e. 32-bits of whole cycles and 8-bits of fractional cycles).~%~%int32 i # Carrier phase whole cycles [cycles]~%uint8 f # Carrier phase fractional part [cycles/256]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CarrierPhase>))
  (cl:+ 0
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CarrierPhase>))
  "Converts a ROS message object to a list"
  (cl:list 'CarrierPhase
    (cl:cons ':i (i msg))
    (cl:cons ':f (f msg))
))
