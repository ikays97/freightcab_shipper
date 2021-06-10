import 'package:flutter/foundation.dart';

enum TruckType {
  DRY_VAN,
  REEFER,
}

extension TruckTypeExtension on TruckType {
  String get describe => describeEnum(this).toString();

  String get name {
    switch (this) {
      case TruckType.DRY_VAN:
        return 'Dry van';
      case TruckType.REEFER:
        return 'Reefer';
      default:
        return null;
    }
  }
}
