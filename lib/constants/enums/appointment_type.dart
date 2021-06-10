import 'package:flutter/foundation.dart';

enum AppointmentType {
  FIRST_COME_FIRST_TAKE,
  ALREADY_MADE,
  TO_BE_MADE,
}

extension AppointmentTypeExtension on AppointmentType {
  String get describe => describeEnum(this).toString();

  String get name {
    switch (this) {
      case AppointmentType.FIRST_COME_FIRST_TAKE:
        return 'First come - First served';
      case AppointmentType.ALREADY_MADE:
        return 'Appointment already, scheduled';
      case AppointmentType.TO_BE_MADE:
        return 'Appointment to be scheduled';
      default:
        return null;
    }
  }
}
