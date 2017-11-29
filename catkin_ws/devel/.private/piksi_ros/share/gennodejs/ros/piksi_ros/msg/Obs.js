// Auto-generated. Do not edit!

// (in-package piksi_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CarrierPhase = require('./CarrierPhase.js');
let Sid = require('./Sid.js');

//-----------------------------------------------------------

class Obs {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.P = null;
      this.L = null;
      this.cn0 = null;
      this.lock = null;
      this.sid = null;
    }
    else {
      if (initObj.hasOwnProperty('P')) {
        this.P = initObj.P
      }
      else {
        this.P = 0;
      }
      if (initObj.hasOwnProperty('L')) {
        this.L = initObj.L
      }
      else {
        this.L = new CarrierPhase();
      }
      if (initObj.hasOwnProperty('cn0')) {
        this.cn0 = initObj.cn0
      }
      else {
        this.cn0 = 0;
      }
      if (initObj.hasOwnProperty('lock')) {
        this.lock = initObj.lock
      }
      else {
        this.lock = 0;
      }
      if (initObj.hasOwnProperty('sid')) {
        this.sid = initObj.sid
      }
      else {
        this.sid = new Sid();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Obs
    // Serialize message field [P]
    bufferOffset = _serializer.uint32(obj.P, buffer, bufferOffset);
    // Serialize message field [L]
    bufferOffset = CarrierPhase.serialize(obj.L, buffer, bufferOffset);
    // Serialize message field [cn0]
    bufferOffset = _serializer.uint8(obj.cn0, buffer, bufferOffset);
    // Serialize message field [lock]
    bufferOffset = _serializer.uint16(obj.lock, buffer, bufferOffset);
    // Serialize message field [sid]
    bufferOffset = Sid.serialize(obj.sid, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Obs
    let len;
    let data = new Obs(null);
    // Deserialize message field [P]
    data.P = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [L]
    data.L = CarrierPhase.deserialize(buffer, bufferOffset);
    // Deserialize message field [cn0]
    data.cn0 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lock]
    data.lock = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [sid]
    data.sid = Sid.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'piksi_ros/Obs';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c4d3fae07ec1003bc792498ae2d73eb8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Obs(null);
    if (msg.P !== undefined) {
      resolved.P = msg.P;
    }
    else {
      resolved.P = 0
    }

    if (msg.L !== undefined) {
      resolved.L = CarrierPhase.Resolve(msg.L)
    }
    else {
      resolved.L = new CarrierPhase()
    }

    if (msg.cn0 !== undefined) {
      resolved.cn0 = msg.cn0;
    }
    else {
      resolved.cn0 = 0
    }

    if (msg.lock !== undefined) {
      resolved.lock = msg.lock;
    }
    else {
      resolved.lock = 0
    }

    if (msg.sid !== undefined) {
      resolved.sid = Sid.Resolve(msg.sid)
    }
    else {
      resolved.sid = new Sid()
    }

    return resolved;
    }
};

module.exports = Obs;
