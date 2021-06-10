import 'package:flutter/foundation.dart';

enum StopType {
  PICKUP,
  DROPOFF,
}

extension Props on StopType {
  String get describe => describeEnum(this).toString();

  String get text {
    switch (this) {
      case StopType.DROPOFF:
        return "Drop off";
      case StopType.PICKUP:
        return "Pick up";
      default:
        throw Exception();
    }
  }
}
