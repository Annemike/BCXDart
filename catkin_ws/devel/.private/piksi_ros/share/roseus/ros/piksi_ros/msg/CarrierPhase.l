;; Auto-generated. Do not edit!


(when (boundp 'piksi_ros::CarrierPhase)
  (if (not (find-package "PIKSI_ROS"))
    (make-package "PIKSI_ROS"))
  (shadow 'CarrierPhase (find-package "PIKSI_ROS")))
(unless (find-package "PIKSI_ROS::CARRIERPHASE")
  (make-package "PIKSI_ROS::CARRIERPHASE"))

(in-package "ROS")
;;//! \htmlinclude CarrierPhase.msg.html


(defclass piksi_ros::CarrierPhase
  :super ros::object
  :slots (_i _f ))

(defmethod piksi_ros::CarrierPhase
  (:init
   (&key
    ((:i __i) 0)
    ((:f __f) 0)
    )
   (send-super :init)
   (setq _i (round __i))
   (setq _f (round __f))
   self)
  (:i
   (&optional __i)
   (if __i (setq _i __i)) _i)
  (:f
   (&optional __f)
   (if __f (setq _f __f)) _f)
  (:serialization-length
   ()
   (+
    ;; int32 _i
    4
    ;; uint8 _f
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _i
       (write-long _i s)
     ;; uint8 _f
       (write-byte _f s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _i
     (setq _i (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _f
     (setq _f (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get piksi_ros::CarrierPhase :md5sum-) "03e7515b70723eadfe3c0e1e43e29e21")
(setf (get piksi_ros::CarrierPhase :datatype-) "piksi_ros/CarrierPhase")
(setf (get piksi_ros::CarrierPhase :definition-)
      "# Carrier phase observation here is represented as a 40-bit fixed
# point number with Q32.8 layout (i.e. 32-bits of whole cycles and 8-bits of fractional cycles).

int32 i # Carrier phase whole cycles [cycles]
uint8 f # Carrier phase fractional part [cycles/256]

")



(provide :piksi_ros/CarrierPhase "03e7515b70723eadfe3c0e1e43e29e21")


