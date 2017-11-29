
(cl:in-package :asdf)

(defsystem "piksi_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CarrierPhase" :depends-on ("_package_CarrierPhase"))
    (:file "_package_CarrierPhase" :depends-on ("_package"))
    (:file "Ephemeris" :depends-on ("_package_Ephemeris"))
    (:file "_package_Ephemeris" :depends-on ("_package"))
    (:file "Obs" :depends-on ("_package_Obs"))
    (:file "_package_Obs" :depends-on ("_package"))
    (:file "Observations" :depends-on ("_package_Observations"))
    (:file "_package_Observations" :depends-on ("_package"))
    (:file "Sid" :depends-on ("_package_Sid"))
    (:file "_package_Sid" :depends-on ("_package"))
    (:file "SignalStatus" :depends-on ("_package_SignalStatus"))
    (:file "_package_SignalStatus" :depends-on ("_package"))
  ))