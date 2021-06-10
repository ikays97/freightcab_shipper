import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/constants/enums/item_unit.dart';

class Unit {
  ItemUnit type;
  int count;

  Unit({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    type = ItemUnit.values.firstWhere(
        (e) => describeEnum(e) == json['unit_type'],
        orElse: () => null);
    count = json['unit_count'] ?? 0;
  }
}
