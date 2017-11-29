;; Auto-generated. Do not edit!


(when (boundp 'piksi_ros::Sid)
  (if (not (find-package "PIKSI_ROS"))
    (make-package "PIKSI_ROS"))
  (shadow 'Sid (find-package "PIKSI_ROS")))
(unless (find-package "PIKSI_ROS::SID")
  (make-package "PIKSI_ROS::SID"))

(in-package "ROS")
;;//! \htmlinclude Sid.msg.html


(defclass piksi_ros::Sid
  :super ros::object
  :slots (_sat _band _constellation ))

(defmethod piksi_ros::Sid
  (:init
   (&key
    ((:sat __sat) 0)
    ((:band __band) 0)
    ((:constellation __constellation) 0)
    )
   (send-super :init)
   (setq _sat (round __sat))
   (setq _band (round __band))
   (setq _constellation (round __constellation))
   self)
  (:sat
   (&optional __sat)
   (if __sat (setq _sat __sat)) _sat)
  (:band
   (&optional __band)
   (if __band (setq _band __band)) _band)
  (:constellation
   (&optional __constellation)
   (if __constellation (setq _constellation __constellation)) _constellation)
  (:serialization-length
   ()
   (+
    ;; uint16 _sat
    2
    ;; uint8 _band
    1
    ;; uint8 _constellation
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _sat
       (write-word _sat s)
     ;; uint8 _band
       (write-byte _band s)
     ;; uint8 _constellation
       (write-byte _constellation s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _sat
     (setq _sat (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _band
     (setq _band (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _constellation
     (setq _constellation (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get piksi_ros::Sid :md5sum-) "5d0865629d1d86dcdf3df8f0aa144e51")
(setf (get piksi_ros::Sid :datatype-) "piksi_ros/Sid")
(setf (get piksi_ros::Sid :definition-)
      "uint16 sat # Constellation-specific satellite identifier
uint8 band # Signal band
uint8 constellation # Constellation to which the satellite belongs

")



(provide :piksi_ros/Sid "5d0865629d1d86dcdf3df8f0aa144e51")


