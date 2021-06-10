import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/models/bid.dart';
import 'package:freightcab_shipper/models/carrier.dart';
import 'package:freightcab_shipper/models/offer.dart';

import 'bid_type.dart';

enum ShipmentStatus {
  CREATED,
  REQUEST_IN_PROGRESS,
  REJECTED_BY_SHIPPER,
  PRICE_DEFINED,
  PRICE_ACCEPTED,
  UNASSIGNED,
  CARRIER_ASSIGNED,
  DRIVER_ASSIGNED,
  DISPATCHED,
  AT_PICKUP,
  IN_TRANSIT,
  AT_DELIVERY,
  DELIVERED,
  COMPLETED,
  PENDING,
  FINISHED,
  PAYMENT_IN_PROGRESS,
  IN_PROGRESS,
  ALERTS,
  EXCEPTIONS,
  WARNINGS,
  ALL,
  ARCHIVED,
  TRASH
}

extension ShipmentStatusDescriber on ShipmentStatus {
  String get describe => describeEnum(this).toString();

  List definition(Offer offer) {
    List<Carrier> carriers = offer.bid
        .where((Bid e) => e.type == BidType.ACCEPT)
        .map((e) => e.carrier)
        .toList();

    int acceptedCarriers = carriers.length;

    switch (this) {
      case ShipmentStatus.CREATED:
        return [
          'Draft',
          'Complete your shipment',
          'created',
        ];
      case ShipmentStatus.REQUEST_IN_PROGRESS:
        return [
          'Waiting for price',
          'Your quote is being processed',
          'requestInProgress',
        ];
      case ShipmentStatus.REJECTED_BY_SHIPPER:
        return [
          'Shipment Canceled',
          'Your shipment has been canceled',
          'rejectedByShipper'
        ];
      case ShipmentStatus.PRICE_DEFINED:
        return [
          "Price Defined",
          'Price: ${offer.adminPrice()}',
          "priceDefined"
        ];
      case ShipmentStatus.PRICE_ACCEPTED:
        return [
          "Shipment Booked",
          'Price: ${offer.adminPrice()}',
          "priceAccepted"
        ];
      case ShipmentStatus.UNASSIGNED:
        return [
          "Unassigned",
          '$acceptedCarriers carrier accepted price',
          "unassigned"
        ];
      case ShipmentStatus.CARRIER_ASSIGNED:
        Carrier carrier = carriers
            .firstWhere((Carrier user) => offer.shipment.carrierId == user.id);
        return [
          "Carrier Assigned",
          "${carrier?.name} selected to shipment",
          "carrierAssigned"
        ];
      case ShipmentStatus.DRIVER_ASSIGNED:
        return [
          "Driver assigned",
          '${offer.shipment.driver.firstname} - assigned to the shipment',
          "driverAssigned"
        ];
      case ShipmentStatus.DISPATCHED:
        return [
          'Dispatched',
          '${offer.shipment.driver.firstname} - headed to pick up',
          'dispatched'
        ];
      case ShipmentStatus.AT_PICKUP:
        return ['At pickup', 'Shipment is being loaded', 'atPickup'];
      case ShipmentStatus.IN_TRANSIT:
        return ['Delivering', 'Shipment is being delivered', 'inTransit'];
      case ShipmentStatus.AT_DELIVERY:
        return ['At delivery', 'Shipment is being unloaded', 'atDelivery'];
      case ShipmentStatus.DELIVERED:
        return ['Delivered', 'Shipment is has been delivered', 'delivered'];
      default:
        return ['Delivered', 'Rating 4.0', 'check-circle'];
    }
  }
}
