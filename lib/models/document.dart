import 'package:freightcab_shipper/models/stop.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';

class Document {
  int id;
  int stopId;
  String shipmentUuid;
  int carrierId;
  int userId;
  String url;
  String name;
  String fileType;
  String mimeType;
  bool approved;
  Stop stop;
  DateTime createdAt;

  Document({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    id = castToInt(json['id'] ?? 0);
    stopId = castToInt(json['stop_id'] ?? 0);
    shipmentUuid = json['shipment_uuid'] ?? '';
    carrierId = castToInt(json['carrier_id'] ?? 0);
    userId = castToInt(json['user_id'] ?? 0);
    url = json['url'] ?? '';
    name = json['name'] ?? '';
    fileType = json['file_type'] ?? '';
    mimeType = json['mime_type'] ?? '';
    approved = json['approved'] ?? false;
    stop = Stop(json: json['stop']);
    createdAt = DateTime.tryParse(json['created_at']);
  }
}
