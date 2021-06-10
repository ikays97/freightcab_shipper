import 'package:flutter/foundation.dart';

enum Accessory {
  DRIVER_ASSIST,
  LOAD_BARS_LOAD_LOCKS,
  TWIC_REQUIRED,
  PPE,
  LOAD_BARS,
  STRAPS,
}

extension Proper on Accessory {
  String get describe => describeEnum(this).toString();

  String get text {
    switch (this) {
      case Accessory.DRIVER_ASSIST:
        return "Driver Assist";
      case Accessory.LOAD_BARS_LOAD_LOCKS:
        return "Load bars load locks";
      case Accessory.TWIC_REQUIRED:
        return "Twic required";
      case Accessory.PPE:
        return "PPE";
      case Accessory.LOAD_BARS:
        return "Load Bars";
      case Accessory.STRAPS:
        return "Straps";
      default:
        throw Exception();
    }
  }
}
