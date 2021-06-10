import 'package:flutter/foundation.dart';

enum NotificationsType {
  QUOTE_REQUESTED,
  PRICE_DEFINED,
  PRICE_ACCEPTED,
  CARRIER_ACCEPTED_OFFER,
  CARRIER_ASSIGNED,
  DRIVER_ASSIGNED,
  DRIVER_UNASSIGNED,
  SHIPMENT_DISPATCHED,
  SHIPMENT_REJECTED,
  SHIPMENT_AT_PICKUP,
  SHIPMENT_IN_TRANSIT,
  SHIPMENT_AT_DROPOFF,
  SHIPMENT_DELIVERED,
  SHIPMENT_FINISHED,
  SHIPMENT_COMPLETED,
  COMPANY_DOCUMENT_VERIFICATION_REQUESTED,
  PAYMENT_IN_PROGRESS,
}

extension ShipmentStatusDescriber on NotificationsType {
  String get describe => describeEnum(this).toString();
}
