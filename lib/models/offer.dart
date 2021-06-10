import 'package:freightcab_shipper/constants/enums/bid_type.dart';
import 'package:freightcab_shipper/models/shipment.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'bid.dart';

class Offer {
  int id;
  String uuid;
  String shipperId;
  String state;
  Shipment shipment;
  List<Bid> bid;
  bool driverAssigned;

  Offer({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    id = castToInt(json['id'] ?? 0);
    uuid = json['uuid'] ?? '';
    shipperId = json['shipper_id'] ?? '';
    state = json['state'] ?? '';
    shipment = Shipment(json: json['shipment']);
    bid = List.from(
        ((json['bid'] ?? []) as List<dynamic>).map((json) => Bid(json: json)));
    driverAssigned = json['driver_assigned'] ?? false;
  }

  String adminPrice() {
    return '\$' +
            (double.tryParse(bid
                        .firstWhere((Bid e) => e.type == BidType.ADMIN_PRICE,
                            orElse: () => null)
                        ?.cents) /
                    100)
                ?.toStringAsFixed(2) ??
        '';
  }
}
