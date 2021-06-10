import 'package:freightcab_shipper/models/shipment.dart';
import 'package:freightcab_shipper/models/unit.dart';
import 'package:freightcab_shipper/models/weight.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'handling_piece.dart';
import 'offer.dart';

class Item {
  int id;
  String shipmentUuid;
  HandlingPiece handlingPiece;
  Unit unit;
  Weight weight;
  String description;
  Shipment shipment;
  Offer offer;

  Item({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    id = castToInt(json['id'] ?? 0);
    shipmentUuid = json['shipment_uuid'] ?? '';
    handlingPiece = HandlingPiece(json: json['handling_piece']);
    unit = Unit(json: json['units']);
    weight = Weight(json: json['weight']);
    description = json['description'] ?? '';
    shipment = Shipment(json: json['shipment']);
    offer = Offer(json: json['offer']);
  }
}
