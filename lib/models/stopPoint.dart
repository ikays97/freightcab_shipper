import 'package:freightcab_shipper/constants/enums/appointment_type.dart';
import 'package:freightcab_shipper/constants/enums/stop_type.dart';
import 'package:freightcab_shipper/models/stop_location_profile.dart';

class StopPoint {
  dynamic location; // dynamic
  String label;
  DateTime startTime;
  DateTime endTime;
  StopType stopType;
  AppointmentType appointmentType;

  StopPoint(
      {this.location,
      this.startTime,
      this.endTime,
      this.label,
      this.stopType,
      this.appointmentType});

  factory StopPoint.fromJson(Map<String, dynamic> json) {
    return StopPoint(
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      stopType: json['type'] == 'DROPOFF' ? StopType.DROPOFF : StopType.PICKUP,
    );
  }
}
