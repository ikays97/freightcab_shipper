import 'package:freightcab_shipper/ui/shared/extensions.dart';

import 'coordinates.dart';

class Path {
  String shipmentUuid;
  int id;
  int orderIndex;
  Coordinates coordinates;
  DateTime createdAt;

  Path({Map<String, dynamic> json}) {
    shipmentUuid = json['shipment_uuid'] ?? '';
    id = castToInt(json['id'] ?? 0);
    orderIndex = json['order_index'] ?? 0;
    coordinates = Coordinates(json: json['coordinates']);
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
  }
}
