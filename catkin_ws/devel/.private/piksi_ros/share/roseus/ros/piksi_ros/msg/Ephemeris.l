;; Auto-generated. Do not edit!


(when (boundp 'piksi_ros::Ephemeris)
  (if (not (find-package "PIKSI_ROS"))
    (make-package "PIKSI_ROS"))
  (shadow 'Ephemeris (find-package "PIKSI_ROS")))
(unless (find-package "PIKSI_ROS::EPHEMERIS")
  (make-package "PIKSI_ROS::EPHEMERIS"))

(in-package "ROS")
;;//! \htmlinclude Ephemeris.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass piksi_ros::Ephemeris
  :super ros::object
  :slots (_header _tgd _c_rs _c_rc _c_uc _c_us _c_ic _c_is _dn _m0 _ecc _sqrta _omega0 _omegadot _w _inc _inc_dot _af0 _af1 _af2 _toe_tow _toe_wn _toc_tow _toc_wn _valid _healthy _sid _iode _iodc ))

(defmethod piksi_ros::Ephemeris
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:tgd __tgd) 0.0)
    ((:c_rs __c_rs) 0.0)
    ((:c_rc __c_rc) 0.0)
    ((:c_uc __c_uc) 0.0)
    ((:c_us __c_us) 0.0)
    ((:c_ic __c_ic) 0.0)
    ((:c_is __c_is) 0.0)
    ((:dn __dn) 0.0)
    ((:m0 __m0) 0.0)
    ((:ecc __ecc) 0.0)
    ((:sqrta __sqrta) 0.0)
    ((:omega0 __omega0) 0.0)
    ((:omegadot __omegadot) 0.0)
    ((:w __w) 0.0)
    ((:inc __inc) 0.0)
    ((:inc_dot __inc_dot) 0.0)
    ((:af0 __af0) 0.0)
    ((:af1 __af1) 0.0)
    ((:af2 __af2) 0.0)
    ((:toe_tow __toe_tow) 0.0)
    ((:toe_wn __toe_wn) 0)
    ((:toc_tow __toc_tow) 0.0)
    ((:toc_wn __toc_wn) 0)
    ((:valid __valid) 0)
    ((:healthy __healthy) 0)
    ((:sid __sid) (instance piksi_ros::Sid :init))
    ((:iode __iode) 0)
    ((:iodc __iodc) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _tgd (float __tgd))
   (setq _c_rs (float __c_rs))
   (setq _c_rc (float __c_rc))
   (setq _c_uc (float __c_uc))
   (setq _c_us (float __c_us))
   (setq _c_ic (float __c_ic))
   (setq _c_is (float __c_is))
   (setq _dn (float __dn))
   (setq _m0 (float __m0))
   (setq _ecc (float __ecc))
   (setq _sqrta (float __sqrta))
   (setq _omega0 (float __omega0))
   (setq _omegadot (float __omegadot))
   (setq _w (float __w))
   (setq _inc (float __inc))
   (setq _inc_dot (float __inc_dot))
   (setq _af0 (float __af0))
   (setq _af1 (float __af1))
   (setq _af2 (float __af2))
   (setq _toe_tow (float __toe_tow))
   (setq _toe_wn (round __toe_wn))
   (setq _toc_tow (float __toc_tow))
   (setq _toc_wn (round __toc_wn))
   (setq _valid (round __valid))
   (setq _healthy (round __healthy))
   (setq _sid __sid)
   (setq _iode (round __iode))
   (setq _iodc (round __iodc))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:tgd
   (&optional __tgd)
   (if __tgd (setq _tgd __tgd)) _tgd)
  (:c_rs
   (&optional __c_rs)
   (if __c_rs (setq _c_rs __c_rs)) _c_rs)
  (:c_rc
   (&optional __c_rc)
   (if __c_rc (setq _c_rc __c_rc)) _c_rc)
  (:c_uc
   (&optional __c_uc)
   (if __c_uc (setq _c_uc __c_uc)) _c_uc)
  (:c_us
   (&optional __c_us)
   (if __c_us (setq _c_us __c_us)) _c_us)
  (:c_ic
   (&optional __c_ic)
   (if __c_ic (setq _c_ic __c_ic)) _c_ic)
  (:c_is
   (&optional __c_is)
   (if __c_is (setq _c_is __c_is)) _c_is)
  (:dn
   (&optional __dn)
   (if __dn (setq _dn __dn)) _dn)
  (:m0
   (&optional __m0)
   (if __m0 (setq _m0 __m0)) _m0)
  (:ecc
   (&optional __ecc)
   (if __ecc (setq _ecc __ecc)) _ecc)
  (:sqrta
   (&optional __sqrta)
   (if __sqrta (setq _sqrta __sqrta)) _sqrta)
  (:omega0
   (&optional __omega0)
   (if __omega0 (setq _omega0 __omega0)) _omega0)
  (:omegadot
   (&optional __omegadot)
   (if __omegadot (setq _omegadot __omegadot)) _omegadot)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:inc
   (&optional __inc)
   (if __inc (setq _inc __inc)) _inc)
  (:inc_dot
   (&optional __inc_dot)
   (if __inc_dot (setq _inc_dot __inc_dot)) _inc_dot)
  (:af0
   (&optional __af0)
   (if __af0 (setq _af0 __af0)) _af0)
  (:af1
   (&optional __af1)
   (if __af1 (setq _af1 __af1)) _af1)
  (:af2
   (&optional __af2)
   (if __af2 (setq _af2 __af2)) _af2)
  (:toe_tow
   (&optional __toe_tow)
   (if __toe_tow (setq _toe_tow __toe_tow)) _toe_tow)
  (:toe_wn
   (&optional __toe_wn)
   (if __toe_wn (setq _toe_wn __toe_wn)) _toe_wn)
  (:toc_tow
   (&optional __toc_tow)
   (if __toc_tow (setq _toc_tow __toc_tow)) _toc_tow)
  (:toc_wn
   (&optional __toc_wn)
   (if __toc_wn (setq _toc_wn __toc_wn)) _toc_wn)
  (:valid
   (&optional __valid)
   (if __valid (setq _valid __valid)) _valid)
  (:healthy
   (&optional __healthy)
   (if __healthy (setq _healthy __healthy)) _healthy)
  (:sid
   (&rest __sid)
   (if (keywordp (car __sid))
       (send* _sid __sid)
     (progn
       (if __sid (setq _sid (car __sid)))
       _sid)))
  (:iode
   (&optional __iode)
   (if __iode (setq _iode __iode)) _iode)
  (:iodc
   (&optional __iodc)
   (if __iodc (setq _iodc __iodc)) _iodc)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _tgd
    8
    ;; float64 _c_rs
    8
    ;; float64 _c_rc
    8
    ;; float64 _c_uc
    8
    ;; float64 _c_us
    8
    ;; float64 _c_ic
    8
    ;; float64 _c_is
    8
    ;; float64 _dn
    8
    ;; float64 _m0
    8
    ;; float64 _ecc
    8
    ;; float64 _sqrta
    8
    ;; float64 _omega0
    8
    ;; float64 _omegadot
    8
    ;; float64 _w
    8
    ;; float64 _inc
    8
    ;; float64 _inc_dot
    8
    ;; float64 _af0
    8
    ;; float64 _af1
    8
    ;; float64 _af2
    8
    ;; float64 _toe_tow
    8
    ;; uint16 _toe_wn
    2
    ;; float64 _toc_tow
    8
    ;; uint16 _toc_wn
    2
    ;; uint8 _valid
    1
    ;; uint8 _healthy
    1
    ;; piksi_ros/Sid _sid
    (send _sid :serialization-length)
    ;; uint8 _iode
    1
    ;; uint16 _iodc
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _tgd
       (sys::poke _tgd (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _c_rs
       (sys::poke _c_rs (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _c_rc
       (sys::poke _c_rc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _c_uc
       (sys::poke _c_uc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _c_us
       (sys::poke _c_us (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _c_ic
       (sys::poke _c_ic (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _c_is
       (sys::poke _c_is (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dn
       (sys::poke _dn (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _m0
       (sys::poke _m0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ecc
       (sys::poke _ecc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sqrta
       (sys::poke _sqrta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _omega0
       (sys::poke _omega0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _omegadot
       (sys::poke _omegadot (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _w
       (sys::poke _w (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _inc
       (sys::poke _inc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _inc_dot
       (sys::poke _inc_dot (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _af0
       (sys::poke _af0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _af1
       (sys::poke _af1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _af2
       (sys::poke _af2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _toe_tow
       (sys::poke _toe_tow (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16 _toe_wn
       (write-word _toe_wn s)
     ;; float64 _toc_tow
       (sys::poke _toc_tow (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16 _toc_wn
       (write-word _toc_wn s)
     ;; uint8 _valid
       (write-byte _valid s)
     ;; uint8 _healthy
       (write-byte _healthy s)
     ;; piksi_ros/Sid _sid
       (send _sid :serialize s)
     ;; uint8 _iode
       (write-byte _iode s)
     ;; uint16 _iodc
       (write-word _iodc s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _tgd
     (setq _tgd (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _c_rs
     (setq _c_rs (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _c_rc
     (setq _c_rc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _c_uc
     (setq _c_uc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _c_us
     (setq _c_us (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _c_ic
     (setq _c_ic (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _c_is
     (setq _c_is (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dn
     (setq _dn (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _m0
     (setq _m0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ecc
     (setq _ecc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sqrta
     (setq _sqrta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _omega0
     (setq _omega0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _omegadot
     (setq _omegadot (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _w
     (setq _w (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _inc
     (setq _inc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _inc_dot
     (setq _inc_dot (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _af0
     (setq _af0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _af1
     (setq _af1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _af2
     (setq _af2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _toe_tow
     (setq _toe_tow (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _toe_wn
     (setq _toe_wn (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _toc_tow
     (setq _toc_tow (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _toc_wn
     (setq _toc_wn (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _valid
     (setq _valid (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _healthy
     (setq _healthy (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; piksi_ros/Sid _sid
     (send _sid :deserialize buf ptr-) (incf ptr- (send _sid :serialization-length))
   ;; uint8 _iode
     (setq _iode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _iodc
     (setq _iodc (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get piksi_ros::Ephemeris :md5sum-) "28a7e20deec95d3746abb19bb2db1355")
(setf (get piksi_ros::Ephemeris :datatype-) "piksi_ros/Ephemeris")
(setf (get piksi_ros::Ephemeris :definition-)
      "Header header

float64 tgd # Group delay differential between L1 and L2 [s]

float64 c_rs # Amplitude of the sine harmonic correction term to the orbit radius [m]
float64 c_rc # Amplitude of the cosine harmonic correction term to the orbit radius [m]
float64 c_uc # Amplitude of the cosine harmonic correction term to the argument of latitude [rad]
float64 c_us # Amplitude of the sine harmonic correction term to the argument of latitude [rad]
float64 c_ic # Amplitude of the cosine harmonic correction term to the angle of inclination [rad]
float64 c_is # Amplitude of the sine harmonic correction term to the angle of inclination [rad]

float64 dn # Mean motion difference [rad/s]

float64 m0 # Mean anomaly at reference time [rad]

float64 ecc # Eccentricity of satellite orbit
float64 sqrta # Square root of the semi-major axis of orbit [m^(1/2)]

float64 omega0 # Longitude of ascending node of orbit plane at weekly epoch [rad]
float64 omegadot # Rate of right ascension [rad/s]

float64 w # Argument of perigee []

float64 inc # Inclination
float64 inc_dot # Inclination first derivative

float64 af0 # Polynomial clock correction coefficient (clock bias)
float64 af1 # Polynomial clock correction coefficient (clock drift)
float64 af2 # Polynomial clock correction coefficient (rate of clock drift)

float64 toe_tow # Time of week
uint16 toe_wn # Week number

float64 toc_tow # Clock reference time of week
uint16 toc_wn # Clock reference week number

uint8 valid # Is valid?
uint8 healthy # Satellite is healthy?

piksi_ros/Sid sid

uint8 iode # Issue of ephemeris data
uint16 iodc # Issue of clock data

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
MSG: piksi_ros/Sid
uint16 sat # Constellation-specific satellite identifier
uint8 band # Signal band
uint8 constellation # Constellation to which the satellite belongs

")



(provide :piksi_ros/Ephemeris "28a7e20deec95d3746abb19bb2db1355")


