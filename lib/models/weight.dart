import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/constants/enums/weight_unit.dart';

class Weight {
  int weight;
  WeightUnit unit;

  Weight({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    weight = json['weight'] ?? 0;
    unit = WeightUnit.values.firstWhere(
        (e) => describeEnum(e) == json['weight_unit'],
        orElse: () => null);
  }
}
