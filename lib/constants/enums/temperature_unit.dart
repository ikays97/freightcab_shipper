import 'package:flutter/foundation.dart';

enum TemperatureUnit { F, C }

extension Props on TemperatureUnit {
  String get describe => describeEnum(this).toString();

  String get text {
    switch (this) {
      case TemperatureUnit.C:
        return '°C';
      case TemperatureUnit.F:
        return '°F';
      default:
        throw Exception();
    }
  }
}
