import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/constants/enums/appointment_type.dart';
import 'package:freightcab_shipper/constants/enums/stop_type.dart';
import 'package:freightcab_shipper/models/shipment.dart';
import 'package:freightcab_shipper/models/stop_location_profile.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';

import 'document.dart';

class Stop {
  int id;
  String shipmentUuid;
  int locationProfileId;
  int shipperId;
  int orderIndex;
  AppointmentType appointmentType;
  DateTime startTime;
  DateTime endTime;
  DateTime startedAt;
  DateTime completedAt;
  StopType type;
  String loadingType;
  Shipment shipment;
  StopLocationProfile locationProfile;
  Document document;

  bool canUploadDocument = false;
  bool jobActionEnabled = false;

  Stop({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    id = castToInt(json['id'] ?? 0);
    shipmentUuid = json['shipment_uuid'] ?? '';
    locationProfileId = castToInt(json['location_profile_id']) ?? 0;
    shipperId = json['shipper_id'] ?? 0;
    orderIndex = json['order_index'] ?? 0;
    appointmentType = AppointmentType.values.firstWhere(
        (e) => e.describe == json['appointment_type'],
        orElse: () => null);
    startTime = DateTime.tryParse(json['start_time']);
    endTime = DateTime.tryParse(json['end_time']);
    startedAt = DateTime.tryParse(json['started_at'] ?? '');
    completedAt = DateTime.tryParse(json['completed_at'] ?? '');
    type = StopType.values.firstWhere((e) => describeEnum(e) == (json['type']),
        orElse: () => null);
    loadingType = json['loading_type'] ?? '';
    shipment = Shipment(json: json['shipment']);
    locationProfile = StopLocationProfile(json: json['location_profile']);
  }
}
