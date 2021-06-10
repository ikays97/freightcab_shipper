import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/constants/enums/accessory.dart';
import 'package:freightcab_shipper/constants/enums/shipment_status.dart';
import 'package:freightcab_shipper/constants/enums/truck_type.dart';
import 'package:freightcab_shipper/models/path.dart';
import 'package:freightcab_shipper/models/shipper.dart';
import 'package:freightcab_shipper/models/stop.dart';
import 'package:freightcab_shipper/models/trailer.dart';
import 'package:freightcab_shipper/models/user.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';

import 'carrier.dart';
import 'document.dart';
import 'item.dart';
import 'offer.dart';

class Shipment {
  int id;
  String shortName;
  String uuid;
  int shipperId;
  int driverId;
  int carrierId;
  bool carrierAssigned;
  bool driverAssigned;
  List<Item> items;
  double routeDistanceMiles;
  int routeDurationMinutes;
  List<TruckType> requestedTruckTypes;
  Trailer trailer;
  List<Accessory> accessories;
  String loadDescription;
  ShipmentStatus status;
  DateTime archivedAt;
  Shipper shipper;
  Carrier carrier;
  User driver;
  Offer offer;
  List<Stop> stops;
  List<Path> path;
  List<Document> documents;

  Shipment({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    id = castToInt(json['id']);
    shortName = json['short_name'] ?? '';
    uuid = json['uuid'] ?? '';
    shipperId = castToInt(json['shipper_id']);
    driverId = castToInt(json['driver_id']);
    carrierId = castToInt(json['carrier_id']);
    carrierAssigned = json['carrier_assigned'] ?? false;
    driverAssigned = json['driver_assigned'] ?? false;
    items = List.from(((json['items'] ?? []) as List<dynamic>)
        .map((json) => Item(json: json)));
    routeDistanceMiles =
        double.tryParse(json['route_distance_miles'].toString()) ?? 0.0;
    routeDurationMinutes = json['route_duration_minutes'] ?? 0;
    requestedTruckTypes = List.from(
      ((json['requested_truck_types'] ?? []) as List<dynamic>).map(
        (s) => TruckType.values
            .firstWhere((e) => describeEnum(e) == s, orElse: () => null),
      ),
    );
    trailer = Trailer(json: json['trailer']);
    accessories = List.from(
      ((json['accessorials'] ?? []) as List<dynamic>).map(
        (s) => Accessory.values
            .firstWhere((e) => describeEnum(e) == s, orElse: () => null),
      ),
    );
    loadDescription = json['load_description'] ?? '';
    status = ShipmentStatus.values
        .firstWhere((e) => e.describe == json['state'], orElse: () => null);
    archivedAt = DateTime.tryParse(json['archived_at'] ?? '');
    shipper = Shipper(json: json['shipper']);
    carrier = Carrier(json: json['carrier']);
    driver = User(json: json['driver']);
    offer = Offer(json: json['offer']);
    stops = List.from(((json['stops'] ?? []) as List<dynamic>)
        .map((json) => Stop(json: json)));
    path = List.from(((json['path'] ?? []) as List<dynamic>)
        .map((json) => Path(json: json)));
    documents = List.from(((json['documents'] ?? []) as List<dynamic>)
        .map((json) => Document(json: json)));

    documents.forEach((document) {
      var stop = stops.firstWhere((el) => document.stopId == el.id,
          orElse: () => null);
      stop?.document = document;
    });

    for (var i = 0; i < stops.length; i++) {
      stops[i].canUploadDocument = true;
      if (stops[i].startedAt == null || stops[i].completedAt == null) {
        stops[i].canUploadDocument = stops[i].startedAt != null;
        stops[i].jobActionEnabled = true;
        break;
      }
    }
  }

  bool get isInProgress {
    return [
      ShipmentStatus.DISPATCHED,
      ShipmentStatus.AT_PICKUP,
      ShipmentStatus.IN_TRANSIT,
      ShipmentStatus.AT_DELIVERY,
    ].contains(status);
  }

  String equipments() {
    return requestedTruckTypes.map((e) => e.name).join(', ');
  }

  String pickupFormatted() {
    return '${stops.first.locationProfile.address.city}, ${stops.first.locationProfile.address.state}\n${stops.first.startTime.format('dd MMMM, HH:mm')}';
  }

  String dropOffFormatted() {
    return '${stops.last.locationProfile.address.city}, ${stops.last.locationProfile.address.state}\n${stops.last.startTime.format('dd MMMM, HH:mm')}';
  }
}
