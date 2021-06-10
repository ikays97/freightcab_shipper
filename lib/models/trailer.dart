import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/constants/enums/temperature_unit.dart';

class Trailer {
  int temperatureMax;
  int temperatureMin;
  TemperatureUnit temperatureUnit;

  Trailer({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    temperatureMax = json['temperature_max'] ?? 0;
    temperatureMin = json['temperature_min'] ?? 0;
    temperatureUnit = TemperatureUnit.values.firstWhere(
        (e) => describeEnum(e) == json['temperature_unit'],
        orElse: () => null);
  }
}
