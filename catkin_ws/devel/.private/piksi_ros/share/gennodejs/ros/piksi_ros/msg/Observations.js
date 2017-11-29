// Auto-generated. Do not edit!

// (in-package piksi_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Obs = require('./Obs.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Observations {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.tow = null;
      this.wn = null;
      this.n_obs = null;
      this.obs = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('tow')) {
        this.tow = initObj.tow
      }
      else {
        this.tow = 0;
      }
      if (initObj.hasOwnProperty('wn')) {
        this.wn = initObj.wn
      }
      else {
        this.wn = 0;
      }
      if (initObj.hasOwnProperty('n_obs')) {
        this.n_obs = initObj.n_obs
      }
      else {
        this.n_obs = 0;
      }
      if (initObj.hasOwnProperty('obs')) {
        this.obs = initObj.obs
      }
      else {
        this.obs = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Observations
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [tow]
    bufferOffset = _serializer.uint32(obj.tow, buffer, bufferOffset);
    // Serialize message field [wn]
    bufferOffset = _serializer.uint16(obj.wn, buffer, bufferOffset);
    // Serialize message field [n_obs]
    bufferOffset = _serializer.uint8(obj.n_obs, buffer, bufferOffset);
    // Serialize message field [obs]
    // Serialize the length for message field [obs]
    bufferOffset = _serializer.uint32(obj.obs.length, buffer, bufferOffset);
    obj.obs.forEach((val) => {
      bufferOffset = Obs.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Observations
    let len;
    let data = new Observations(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [tow]
    data.tow = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [wn]
    data.wn = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [n_obs]
    data.n_obs = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [obs]
    // Deserialize array length for message field [obs]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obs = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obs[i] = Obs.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 16 * object.obs.length;
    return length + 11;
  }

  static datatype() {
    // Returns string type for a message object
    return 'piksi_ros/Observations';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e53a651b9eb94ee6416715c723ccbfb6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header # ROS header
    
    uint32 tow # Milliseconds since start of GPS week
    uint16 wn # GPS week number
    uint8 n_obs # Total number of observations
    
    piksi_ros/Obs[] obs # Observations
    
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
    MSG: piksi_ros/Obs
    uint32 P # Psueudorange observation [cm]
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Observations(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.tow !== undefined) {
      resolved.tow = msg.tow;
    }
    else {
      resolved.tow = 0
    }

    if (msg.wn !== undefined) {
      resolved.wn = msg.wn;
    }
    else {
      resolved.wn = 0
    }

    if (msg.n_obs !== undefined) {
      resolved.n_obs = msg.n_obs;
    }
    else {
      resolved.n_obs = 0
    }

    if (msg.obs !== undefined) {
      resolved.obs = new Array(msg.obs.length);
      for (let i = 0; i < resolved.obs.length; ++i) {
        resolved.obs[i] = Obs.Resolve(msg.obs[i]);
      }
    }
    else {
      resolved.obs = []
    }

    return resolved;
    }
};

module.exports = Observations;
