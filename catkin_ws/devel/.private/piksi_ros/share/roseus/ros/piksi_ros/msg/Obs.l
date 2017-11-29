;; Auto-generated. Do not edit!


(when (boundp 'piksi_ros::Obs)
  (if (not (find-package "PIKSI_ROS"))
    (make-package "PIKSI_ROS"))
  (shadow 'Obs (find-package "PIKSI_ROS")))
(unless (find-package "PIKSI_ROS::OBS")
  (make-package "PIKSI_ROS::OBS"))

(in-package "ROS")
;;//! \htmlinclude Obs.msg.html


(defclass piksi_ros::Obs
  :super ros::object
  :slots (_P _L _cn0 _lock _sid ))

(defmethod piksi_ros::Obs
  (:init
   (&key
    ((:P __P) 0)
    ((:L __L) (instance piksi_ros::CarrierPhase :init))
    ((:cn0 __cn0) 0)
    ((:lock __lock) 0)
    ((:sid __sid) (instance piksi_ros::Sid :init))
    )
   (send-super :init)
   (setq _P (round __P))
   (setq _L __L)
   (setq _cn0 (round __cn0))
   (setq _lock (round __lock))
   (setq _sid __sid)
   self)
  (:P
   (&optional __P)
   (if __P (setq _P __P)) _P)
  (:L
   (&rest __L)
   (if (keywordp (car __L))
       (send* _L __L)
     (progn
       (if __L (setq _L (car __L)))
       _L)))
  (:cn0
   (&optional __cn0)
   (if __cn0 (setq _cn0 __cn0)) _cn0)
  (:lock
   (&optional __lock)
   (if __lock (setq _lock __lock)) _lock)
  (:sid
   (&rest __sid)
   (if (keywordp (car __sid))
       (send* _sid __sid)
     (progn
       (if __sid (setq _sid (car __sid)))
       _sid)))
  (:serialization-length
   ()
   (+
    ;; uint32 _P
    4
    ;; piksi_ros/CarrierPhase _L
    (send _L :serialization-length)
    ;; uint8 _cn0
    1
    ;; uint16 _lock
    2
    ;; piksi_ros/Sid _sid
    (send _sid :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _P
       (write-long _P s)
     ;; piksi_ros/CarrierPhase _L
       (send _L :serialize s)
     ;; uint8 _cn0
       (write-byte _cn0 s)
     ;; uint16 _lock
       (write-word _lock s)
     ;; piksi_ros/Sid _sid
       (send _sid :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _P
     (setq _P (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; piksi_ros/CarrierPhase _L
     (send _L :deserialize buf ptr-) (incf ptr- (send _L :serialization-length))
   ;; uint8 _cn0
     (setq _cn0 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _lock
     (setq _lock (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; piksi_ros/Sid _sid
     (send _sid :deserialize buf ptr-) (incf ptr- (send _sid :serialization-length))
   ;;
   self)
  )

(setf (get piksi_ros::Obs :md5sum-) "c4d3fae07ec1003bc792498ae2d73eb8")
(setf (get piksi_ros::Obs :datatype-) "piksi_ros/Obs")
(setf (get piksi_ros::Obs :definition-)
      "uint32 P # Psueudorange observation [cm]
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



(provide :piksi_ros/Obs "c4d3fae07ec1003bc792498ae2d73eb8")


