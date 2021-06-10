import 'package:flutter/foundation.dart';

enum TruckAccessory {
  TWIC_CARD,
  PIPE_STAKES,
  OVERSIZE_PERMIT,
  CNG_AVAILABLE,
}

extension TruckAccessoryExtension on TruckAccessory {
  String get describe => describeEnum(this).toString();

  String get name {
    switch (this) {
      case TruckAccessory.TWIC_CARD:
        return 'Twic card';
      case TruckAccessory.PIPE_STAKES:
        return 'Pipe stakes';
      case TruckAccessory.CNG_AVAILABLE:
        return 'Cng available';
      case TruckAccessory.OVERSIZE_PERMIT:
        return 'Oversize permit';
      default:
        return null;
    }
  }
}
