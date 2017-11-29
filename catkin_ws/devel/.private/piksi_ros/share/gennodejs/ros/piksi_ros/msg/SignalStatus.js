// Auto-generated. Do not edit!

// (in-package piksi_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SignalStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.num_sats = null;
      this.mean_cn0 = null;
      this.median_cn0 = null;
      this.robust_mean_cn0 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('num_sats')) {
        this.num_sats = initObj.num_sats
      }
      else {
        this.num_sats = 0;
      }
      if (initObj.hasOwnProperty('mean_cn0')) {
        this.mean_cn0 = initObj.mean_cn0
      }
      else {
        this.mean_cn0 = 0.0;
      }
      if (initObj.hasOwnProperty('median_cn0')) {
        this.median_cn0 = initObj.median_cn0
      }
      else {
        this.median_cn0 = 0.0;
      }
      if (initObj.hasOwnProperty('robust_mean_cn0')) {
        this.robust_mean_cn0 = initObj.robust_mean_cn0
      }
      else {
        this.robust_mean_cn0 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SignalStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [num_sats]
    bufferOffset = _serializer.int32(obj.num_sats, buffer, bufferOffset);
    // Serialize message field [mean_cn0]
    bufferOffset = _serializer.float32(obj.mean_cn0, buffer, bufferOffset);
    // Serialize message field [median_cn0]
    bufferOffset = _serializer.float32(obj.median_cn0, buffer, bufferOffset);
    // Serialize message field [robust_mean_cn0]
    bufferOffset = _serializer.float32(obj.robust_mean_cn0, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SignalStatus
    let len;
    let data = new SignalStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [num_sats]
    data.num_sats = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [mean_cn0]
    data.mean_cn0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [median_cn0]
    data.median_cn0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [robust_mean_cn0]
    data.robust_mean_cn0 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'piksi_ros/SignalStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0e5693267b8a40f28e0cb8ae142b2ffb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header # ROS header
    
    int32 num_sats
    
    float32 mean_cn0
    float32 median_cn0
    float32 robust_mean_cn0
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SignalStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.num_sats !== undefined) {
      resolved.num_sats = msg.num_sats;
    }
    else {
      resolved.num_sats = 0
    }

    if (msg.mean_cn0 !== undefined) {
      resolved.mean_cn0 = msg.mean_cn0;
    }
    else {
      resolved.mean_cn0 = 0.0
    }

    if (msg.median_cn0 !== undefined) {
      resolved.median_cn0 = msg.median_cn0;
    }
    else {
      resolved.median_cn0 = 0.0
    }

    if (msg.robust_mean_cn0 !== undefined) {
      resolved.robust_mean_cn0 = msg.robust_mean_cn0;
    }
    else {
      resolved.robust_mean_cn0 = 0.0
    }

    return resolved;
    }
};

module.exports = SignalStatus;
