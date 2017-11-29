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

class Sid {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sat = null;
      this.band = null;
      this.constellation = null;
    }
    else {
      if (initObj.hasOwnProperty('sat')) {
        this.sat = initObj.sat
      }
      else {
        this.sat = 0;
      }
      if (initObj.hasOwnProperty('band')) {
        this.band = initObj.band
      }
      else {
        this.band = 0;
      }
      if (initObj.hasOwnProperty('constellation')) {
        this.constellation = initObj.constellation
      }
      else {
        this.constellation = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Sid
    // Serialize message field [sat]
    bufferOffset = _serializer.uint16(obj.sat, buffer, bufferOffset);
    // Serialize message field [band]
    bufferOffset = _serializer.uint8(obj.band, buffer, bufferOffset);
    // Serialize message field [constellation]
    bufferOffset = _serializer.uint8(obj.constellation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Sid
    let len;
    let data = new Sid(null);
    // Deserialize message field [sat]
    data.sat = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [band]
    data.band = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [constellation]
    data.constellation = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'piksi_ros/Sid';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5d0865629d1d86dcdf3df8f0aa144e51';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Sid(null);
    if (msg.sat !== undefined) {
      resolved.sat = msg.sat;
    }
    else {
      resolved.sat = 0
    }

    if (msg.band !== undefined) {
      resolved.band = msg.band;
    }
    else {
      resolved.band = 0
    }

    if (msg.constellation !== undefined) {
      resolved.constellation = msg.constellation;
    }
    else {
      resolved.constellation = 0
    }

    return resolved;
    }
};

module.exports = Sid;
