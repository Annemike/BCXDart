// Auto-generated. Do not edit!

// (in-package piksi_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class CarrierPhase {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.i = null;
      this.f = null;
    }
    else {
      if (initObj.hasOwnProperty('i')) {
        this.i = initObj.i
      }
      else {
        this.i = 0;
      }
      if (initObj.hasOwnProperty('f')) {
        this.f = initObj.f
      }
      else {
        this.f = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CarrierPhase
    // Serialize message field [i]
    bufferOffset = _serializer.int32(obj.i, buffer, bufferOffset);
    // Serialize message field [f]
    bufferOffset = _serializer.uint8(obj.f, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CarrierPhase
    let len;
    let data = new CarrierPhase(null);
    // Deserialize message field [i]
    data.i = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [f]
    data.f = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'piksi_ros/CarrierPhase';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '03e7515b70723eadfe3c0e1e43e29e21';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Carrier phase observation here is represented as a 40-bit fixed
    # point number with Q32.8 layout (i.e. 32-bits of whole cycles and 8-bits of fractional cycles).
    
    int32 i # Carrier phase whole cycles [cycles]
    uint8 f # Carrier phase fractional part [cycles/256]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CarrierPhase(null);
    if (msg.i !== undefined) {
      resolved.i = msg.i;
    }
    else {
      resolved.i = 0
    }

    if (msg.f !== undefined) {
      resolved.f = msg.f;
    }
    else {
      resolved.f = 0
    }

    return resolved;
    }
};

module.exports = CarrierPhase;
