import 'package:flutter/foundation.dart';

enum ShipmentDocumentType {
  INVOICE,
  PROOF_OF_DELIVERY,
  BILL_OF_LOAD,
}

extension ShipmentDocumentTypeExtension on ShipmentDocumentType {
  String get describe => describeEnum(this).toString();
}
