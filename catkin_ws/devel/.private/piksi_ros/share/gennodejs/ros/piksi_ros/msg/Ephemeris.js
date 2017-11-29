// Auto-generated. Do not edit!

// (in-package piksi_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Sid = require('./Sid.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Ephemeris {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.tgd = null;
      this.c_rs = null;
      this.c_rc = null;
      this.c_uc = null;
      this.c_us = null;
      this.c_ic = null;
      this.c_is = null;
      this.dn = null;
      this.m0 = null;
      this.ecc = null;
      this.sqrta = null;
      this.omega0 = null;
      this.omegadot = null;
      this.w = null;
      this.inc = null;
      this.inc_dot = null;
      this.af0 = null;
      this.af1 = null;
      this.af2 = null;
      this.toe_tow = null;
      this.toe_wn = null;
      this.toc_tow = null;
      this.toc_wn = null;
      this.valid = null;
      this.healthy = null;
      this.sid = null;
      this.iode = null;
      this.iodc = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('tgd')) {
        this.tgd = initObj.tgd
      }
      else {
        this.tgd = 0.0;
      }
      if (initObj.hasOwnProperty('c_rs')) {
        this.c_rs = initObj.c_rs
      }
      else {
        this.c_rs = 0.0;
      }
      if (initObj.hasOwnProperty('c_rc')) {
        this.c_rc = initObj.c_rc
      }
      else {
        this.c_rc = 0.0;
      }
      if (initObj.hasOwnProperty('c_uc')) {
        this.c_uc = initObj.c_uc
      }
      else {
        this.c_uc = 0.0;
      }
      if (initObj.hasOwnProperty('c_us')) {
        this.c_us = initObj.c_us
      }
      else {
        this.c_us = 0.0;
      }
      if (initObj.hasOwnProperty('c_ic')) {
        this.c_ic = initObj.c_ic
      }
      else {
        this.c_ic = 0.0;
      }
      if (initObj.hasOwnProperty('c_is')) {
        this.c_is = initObj.c_is
      }
      else {
        this.c_is = 0.0;
      }
      if (initObj.hasOwnProperty('dn')) {
        this.dn = initObj.dn
      }
      else {
        this.dn = 0.0;
      }
      if (initObj.hasOwnProperty('m0')) {
        this.m0 = initObj.m0
      }
      else {
        this.m0 = 0.0;
      }
      if (initObj.hasOwnProperty('ecc')) {
        this.ecc = initObj.ecc
      }
      else {
        this.ecc = 0.0;
      }
      if (initObj.hasOwnProperty('sqrta')) {
        this.sqrta = initObj.sqrta
      }
      else {
        this.sqrta = 0.0;
      }
      if (initObj.hasOwnProperty('omega0')) {
        this.omega0 = initObj.omega0
      }
      else {
        this.omega0 = 0.0;
      }
      if (initObj.hasOwnProperty('omegadot')) {
        this.omegadot = initObj.omegadot
      }
      else {
        this.omegadot = 0.0;
      }
      if (initObj.hasOwnProperty('w')) {
        this.w = initObj.w
      }
      else {
        this.w = 0.0;
      }
      if (initObj.hasOwnProperty('inc')) {
        this.inc = initObj.inc
      }
      else {
        this.inc = 0.0;
      }
      if (initObj.hasOwnProperty('inc_dot')) {
        this.inc_dot = initObj.inc_dot
      }
      else {
        this.inc_dot = 0.0;
      }
      if (initObj.hasOwnProperty('af0')) {
        this.af0 = initObj.af0
      }
      else {
        this.af0 = 0.0;
      }
      if (initObj.hasOwnProperty('af1')) {
        this.af1 = initObj.af1
      }
      else {
        this.af1 = 0.0;
      }
      if (initObj.hasOwnProperty('af2')) {
        this.af2 = initObj.af2
      }
      else {
        this.af2 = 0.0;
      }
      if (initObj.hasOwnProperty('toe_tow')) {
        this.toe_tow = initObj.toe_tow
      }
      else {
        this.toe_tow = 0.0;
      }
      if (initObj.hasOwnProperty('toe_wn')) {
        this.toe_wn = initObj.toe_wn
      }
      else {
        this.toe_wn = 0;
      }
      if (initObj.hasOwnProperty('toc_tow')) {
        this.toc_tow = initObj.toc_tow
      }
      else {
        this.toc_tow = 0.0;
      }
      if (initObj.hasOwnProperty('toc_wn')) {
        this.toc_wn = initObj.toc_wn
      }
      else {
        this.toc_wn = 0;
      }
      if (initObj.hasOwnProperty('valid')) {
        this.valid = initObj.valid
      }
      else {
        this.valid = 0;
      }
      if (initObj.hasOwnProperty('healthy')) {
        this.healthy = initObj.healthy
      }
      else {
        this.healthy = 0;
      }
      if (initObj.hasOwnProperty('sid')) {
        this.sid = initObj.sid
      }
      else {
        this.sid = new Sid();
      }
      if (initObj.hasOwnProperty('iode')) {
        this.iode = initObj.iode
      }
      else {
        this.iode = 0;
      }
      if (initObj.hasOwnProperty('iodc')) {
        this.iodc = initObj.iodc
      }
      else {
        this.iodc = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Ephemeris
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [tgd]
    bufferOffset = _serializer.float64(obj.tgd, buffer, bufferOffset);
    // Serialize message field [c_rs]
    bufferOffset = _serializer.float64(obj.c_rs, buffer, bufferOffset);
    // Serialize message field [c_rc]
    bufferOffset = _serializer.float64(obj.c_rc, buffer, bufferOffset);
    // Serialize message field [c_uc]
    bufferOffset = _serializer.float64(obj.c_uc, buffer, bufferOffset);
    // Serialize message field [c_us]
    bufferOffset = _serializer.float64(obj.c_us, buffer, bufferOffset);
    // Serialize message field [c_ic]
    bufferOffset = _serializer.float64(obj.c_ic, buffer, bufferOffset);
    // Serialize message field [c_is]
    bufferOffset = _serializer.float64(obj.c_is, buffer, bufferOffset);
    // Serialize message field [dn]
    bufferOffset = _serializer.float64(obj.dn, buffer, bufferOffset);
    // Serialize message field [m0]
    bufferOffset = _serializer.float64(obj.m0, buffer, bufferOffset);
    // Serialize message field [ecc]
    bufferOffset = _serializer.float64(obj.ecc, buffer, bufferOffset);
    // Serialize message field [sqrta]
    bufferOffset = _serializer.float64(obj.sqrta, buffer, bufferOffset);
    // Serialize message field [omega0]
    bufferOffset = _serializer.float64(obj.omega0, buffer, bufferOffset);
    // Serialize message field [omegadot]
    bufferOffset = _serializer.float64(obj.omegadot, buffer, bufferOffset);
    // Serialize message field [w]
    bufferOffset = _serializer.float64(obj.w, buffer, bufferOffset);
    // Serialize message field [inc]
    bufferOffset = _serializer.float64(obj.inc, buffer, bufferOffset);
    // Serialize message field [inc_dot]
    bufferOffset = _serializer.float64(obj.inc_dot, buffer, bufferOffset);
    // Serialize message field [af0]
    bufferOffset = _serializer.float64(obj.af0, buffer, bufferOffset);
    // Serialize message field [af1]
    bufferOffset = _serializer.float64(obj.af1, buffer, bufferOffset);
    // Serialize message field [af2]
    bufferOffset = _serializer.float64(obj.af2, buffer, bufferOffset);
    // Serialize message field [toe_tow]
    bufferOffset = _serializer.float64(obj.toe_tow, buffer, bufferOffset);
    // Serialize message field [toe_wn]
    bufferOffset = _serializer.uint16(obj.toe_wn, buffer, bufferOffset);
    // Serialize message field [toc_tow]
    bufferOffset = _serializer.float64(obj.toc_tow, buffer, bufferOffset);
    // Serialize message field [toc_wn]
    bufferOffset = _serializer.uint16(obj.toc_wn, buffer, bufferOffset);
    // Serialize message field [valid]
    bufferOffset = _serializer.uint8(obj.valid, buffer, bufferOffset);
    // Serialize message field [healthy]
    bufferOffset = _serializer.uint8(obj.healthy, buffer, bufferOffset);
    // Serialize message field [sid]
    bufferOffset = Sid.serialize(obj.sid, buffer, bufferOffset);
    // Serialize message field [iode]
    bufferOffset = _serializer.uint8(obj.iode, buffer, bufferOffset);
    // Serialize message field [iodc]
    bufferOffset = _serializer.uint16(obj.iodc, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Ephemeris
    let len;
    let data = new Ephemeris(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [tgd]
    data.tgd = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [c_rs]
    data.c_rs = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [c_rc]
    data.c_rc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [c_uc]
    data.c_uc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [c_us]
    data.c_us = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [c_ic]
    data.c_ic = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [c_is]
    data.c_is = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dn]
    data.dn = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [m0]
    data.m0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ecc]
    data.ecc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sqrta]
    data.sqrta = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [omega0]
    data.omega0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [omegadot]
    data.omegadot = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [w]
    data.w = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [inc]
    data.inc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [inc_dot]
    data.inc_dot = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [af0]
    data.af0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [af1]
    data.af1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [af2]
    data.af2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [toe_tow]
    data.toe_tow = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [toe_wn]
    data.toe_wn = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [toc_tow]
    data.toc_tow = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [toc_wn]
    data.toc_wn = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [valid]
    data.valid = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [healthy]
    data.healthy = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [sid]
    data.sid = Sid.deserialize(buffer, bufferOffset);
    // Deserialize message field [iode]
    data.iode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [iodc]
    data.iodc = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 181;
  }

  static datatype() {
    // Returns string type for a message object
    return 'piksi_ros/Ephemeris';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '28a7e20deec95d3746abb19bb2db1355';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Ephemeris(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.tgd !== undefined) {
      resolved.tgd = msg.tgd;
    }
    else {
      resolved.tgd = 0.0
    }

    if (msg.c_rs !== undefined) {
      resolved.c_rs = msg.c_rs;
    }
    else {
      resolved.c_rs = 0.0
    }

    if (msg.c_rc !== undefined) {
      resolved.c_rc = msg.c_rc;
    }
    else {
      resolved.c_rc = 0.0
    }

    if (msg.c_uc !== undefined) {
      resolved.c_uc = msg.c_uc;
    }
    else {
      resolved.c_uc = 0.0
    }

    if (msg.c_us !== undefined) {
      resolved.c_us = msg.c_us;
    }
    else {
      resolved.c_us = 0.0
    }

    if (msg.c_ic !== undefined) {
      resolved.c_ic = msg.c_ic;
    }
    else {
      resolved.c_ic = 0.0
    }

    if (msg.c_is !== undefined) {
      resolved.c_is = msg.c_is;
    }
    else {
      resolved.c_is = 0.0
    }

    if (msg.dn !== undefined) {
      resolved.dn = msg.dn;
    }
    else {
      resolved.dn = 0.0
    }

    if (msg.m0 !== undefined) {
      resolved.m0 = msg.m0;
    }
    else {
      resolved.m0 = 0.0
    }

    if (msg.ecc !== undefined) {
      resolved.ecc = msg.ecc;
    }
    else {
      resolved.ecc = 0.0
    }

    if (msg.sqrta !== undefined) {
      resolved.sqrta = msg.sqrta;
    }
    else {
      resolved.sqrta = 0.0
    }

    if (msg.omega0 !== undefined) {
      resolved.omega0 = msg.omega0;
    }
    else {
      resolved.omega0 = 0.0
    }

    if (msg.omegadot !== undefined) {
      resolved.omegadot = msg.omegadot;
    }
    else {
      resolved.omegadot = 0.0
    }

    if (msg.w !== undefined) {
      resolved.w = msg.w;
    }
    else {
      resolved.w = 0.0
    }

    if (msg.inc !== undefined) {
      resolved.inc = msg.inc;
    }
    else {
      resolved.inc = 0.0
    }

    if (msg.inc_dot !== undefined) {
      resolved.inc_dot = msg.inc_dot;
    }
    else {
      resolved.inc_dot = 0.0
    }

    if (msg.af0 !== undefined) {
      resolved.af0 = msg.af0;
    }
    else {
      resolved.af0 = 0.0
    }

    if (msg.af1 !== undefined) {
      resolved.af1 = msg.af1;
    }
    else {
      resolved.af1 = 0.0
    }

    if (msg.af2 !== undefined) {
      resolved.af2 = msg.af2;
    }
    else {
      resolved.af2 = 0.0
    }

    if (msg.toe_tow !== undefined) {
      resolved.toe_tow = msg.toe_tow;
    }
    else {
      resolved.toe_tow = 0.0
    }

    if (msg.toe_wn !== undefined) {
      resolved.toe_wn = msg.toe_wn;
    }
    else {
      resolved.toe_wn = 0
    }

    if (msg.toc_tow !== undefined) {
      resolved.toc_tow = msg.toc_tow;
    }
    else {
      resolved.toc_tow = 0.0
    }

    if (msg.toc_wn !== undefined) {
      resolved.toc_wn = msg.toc_wn;
    }
    else {
      resolved.toc_wn = 0
    }

    if (msg.valid !== undefined) {
      resolved.valid = msg.valid;
    }
    else {
      resolved.valid = 0
    }

    if (msg.healthy !== undefined) {
      resolved.healthy = msg.healthy;
    }
    else {
      resolved.healthy = 0
    }

    if (msg.sid !== undefined) {
      resolved.sid = Sid.Resolve(msg.sid)
    }
    else {
      resolved.sid = new Sid()
    }

    if (msg.iode !== undefined) {
      resolved.iode = msg.iode;
    }
    else {
      resolved.iode = 0
    }

    if (msg.iodc !== undefined) {
      resolved.iodc = msg.iodc;
    }
    else {
      resolved.iodc = 0
    }

    return resolved;
    }
};

module.exports = Ephemeris;
