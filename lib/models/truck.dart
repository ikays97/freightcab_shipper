import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/constants/enums/truck_type.dart';

class Truck {
  TruckType type;
  int count;

  Truck({Map<String, dynamic> json}) {
    count = json['count'] ?? 0;
    type = TruckType.values
        .firstWhere((e) => describeEnum(e) == json['type'], orElse: () => null);
  }
}
