import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/constants/enums/bid_type.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';

import 'carrier.dart';
import 'offer.dart';

class Bid {
  int id;
  BidType type;
  String cents;
  String offerUuid;
  int carrierId;
  Carrier carrier;
  Offer offer;

  Bid({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    id = json['id'] ?? 0;
    type = BidType.values
        .firstWhere((e) => describeEnum(e) == json['type'], orElse: () => null);
    cents = json['cents'] ?? '';
    offerUuid = json['offer_uuid'] ?? '';
    carrierId = castToInt(json['carrier_id'] ?? 0);
    carrier = Carrier(json: json['carrier']);
    offer = Offer(json: json['offer']);
  }
}
