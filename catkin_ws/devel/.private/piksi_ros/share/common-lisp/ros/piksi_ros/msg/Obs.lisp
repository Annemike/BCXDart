; Auto-generated. Do not edit!


(cl:in-package piksi_ros-msg)


;//! \htmlinclude Obs.msg.html

(cl:defclass <Obs> (roslisp-msg-protocol:ros-message)
  ((P
    :reader P
    :initarg :P
    :type cl:integer
    :initform 0)
   (L
    :reader L
    :initarg :L
    :type piksi_ros-msg:CarrierPhase
    :initform (cl:make-instance 'piksi_ros-msg:CarrierPhase))
   (cn0
    :reader cn0
    :initarg :cn0
    :type cl:fixnum
    :initform 0)
   (lock
    :reader lock
    :initarg :lock
    :type cl:fixnum
    :initform 0)
   (sid
    :reader sid
    :initarg :sid
    :type piksi_ros-msg:Sid
    :initform (cl:make-instance 'piksi_ros-msg:Sid)))
)

(cl:defclass Obs (<Obs>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Obs>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Obs)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name piksi_ros-msg:<Obs> is deprecated: use piksi_ros-msg:Obs instead.")))

(cl:ensure-generic-function 'P-val :lambda-list '(m))
(cl:defmethod P-val ((m <Obs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:P-val is deprecated.  Use piksi_ros-msg:P instead.")
  (P m))

(cl:ensure-generic-function 'L-val :lambda-list '(m))
(cl:defmethod L-val ((m <Obs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:L-val is deprecated.  Use piksi_ros-msg:L instead.")
  (L m))

(cl:ensure-generic-function 'cn0-val :lambda-list '(m))
(cl:defmethod cn0-val ((m <Obs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:cn0-val is deprecated.  Use piksi_ros-msg:cn0 instead.")
  (cn0 m))

(cl:ensure-generic-function 'lock-val :lambda-list '(m))
(cl:defmethod lock-val ((m <Obs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:lock-val is deprecated.  Use piksi_ros-msg:lock instead.")
  (lock m))

(cl:ensure-generic-function 'sid-val :lambda-list '(m))
(cl:defmethod sid-val ((m <Obs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader piksi_ros-msg:sid-val is deprecated.  Use piksi_ros-msg:sid instead.")
  (sid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Obs>) ostream)
  "Serializes a message object of type '<Obs>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'P)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'P)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'P)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'P)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'L) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cn0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lock)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'lock)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sid) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Obs>) istream)
  "Deserializes a message object of type '<Obs>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'P)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'P)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'P)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'P)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'L) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cn0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lock)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'lock)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sid) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Obs>)))
  "Returns string type for a message object of type '<Obs>"
  "piksi_ros/Obs")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Obs)))
  "Returns string type for a message object of type 'Obs"
  "piksi_ros/Obs")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Obs>)))
  "Returns md5sum for a message object of type '<Obs>"
  "c4d3fae07ec1003bc792498ae2d73eb8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Obs)))
  "Returns md5sum for a message object of type 'Obs"
  "c4d3fae07ec1003bc792498ae2d73eb8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Obs>)))
  "Returns full string definition for message of type '<Obs>"
  (cl:format cl:nil "uint32 P # Psueudorange observation [cm]~%piksi_ros/CarrierPhase L # Carrier phase [cycles]~%uint8 cn0 # Carrier-to-Noise density [dB Hz * 4]~%uint16 lock # Lock indicator. This value changes whenever a satellite signal has lost and regained lock, indicating that the carrier phase ambiguity may have changed~%piksi_ros/Sid sid # Satellite identifier~%~%================================================================================~%MSG: piksi_ros/CarrierPhase~%# Carrier phase observation here is represented as a 40-bit fixed~%# point number with Q32.8 layout (i.e. 32-bits of whole cycles and 8-bits of fractional cycles).~%~%int32 i # Carrier phase whole cycles [cycles]~%uint8 f # Carrier phase fractional part [cycles/256]~%~%================================================================================~%MSG: piksi_ros/Sid~%uint16 sat # Constellation-specific satellite identifier~%uint8 band # Signal band~%uint8 constellation # Constellation to which the satellite belongs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Obs)))
  "Returns full string definition for message of type 'Obs"
  (cl:format cl:nil "uint32 P # Psueudorange observation [cm]~%piksi_ros/CarrierPhase L # Carrier phase [cycles]~%uint8 cn0 # Carrier-to-Noise density [dB Hz * 4]~%uint16 lock # Lock indicator. This value changes whenever a satellite signal has lost and regained lock, indicating that the carrier phase ambiguity may have changed~%piksi_ros/Sid sid # Satellite identifier~%~%================================================================================~%MSG: piksi_ros/CarrierPhase~%# Carrier phase observation here is represented as a 40-bit fixed~%# point number with Q32.8 layout (i.e. 32-bits of whole cycles and 8-bits of fractional cycles).~%~%int32 i # Carrier phase whole cycles [cycles]~%uint8 f # Carrier phase fractional part [cycles/256]~%~%================================================================================~%MSG: piksi_ros/Sid~%uint16 sat # Constellation-specific satellite identifier~%uint8 band # Signal band~%uint8 constellation # Constellation to which the satellite belongs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Obs>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'L))
     1
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sid))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Obs>))
  "Converts a ROS message object to a list"
  (cl:list 'Obs
    (cl:cons ':P (P msg))
    (cl:cons ':L (L msg))
    (cl:cons ':cn0 (cn0 msg))
    (cl:cons ':lock (lock msg))
    (cl:cons ':sid (sid msg))
))
