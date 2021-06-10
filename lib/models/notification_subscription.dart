import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/constants/enums/notifications_type.dart';

class NotificationSubscription {
  NotificationsType type;
  String channel;
  bool isSubscribed;

  NotificationSubscription({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    type = NotificationsType.values
        .firstWhere((e) => describeEnum(e) == json['type'], orElse: () => null);
    channel = json['channel'] ?? '';
    isSubscribed = json['is_subscribed'] ?? false;
  }

  static Map<String, dynamic> predefinedNotifications = {
    'PRICE_DEFINED': {
      'name': 'Price defined',
      'roles': ['CARRIER_DISPATCH_OFFICE']
    },
    'CARRIER_ACCEPTED_OFFER': {
      'name': 'Carrier accepted',
      'roles': [
        'CARRIER_DISPATCH_OFFICE',
        'CARRIER_OWNER_OPERATOR',
        'CARRIER_DRIVER'
      ]
    },
    'DRIVER_ASSIGNED': {
      'name': 'Driver assigned',
      'roles': ['CARRIER_DISPATCH_OFFICE'],
    },
    'SHIPMENT_DISPATCHED': {
      'name': 'Shipment started',
      'roles': ['CARRIER_DISPATCH_OFFICE']
    },
    'SHIPMENT_AT_PICKUP': {
      'name': 'Driver at pick up',
      'roles': ['CARRIER_DISPATCH_OFFICE']
    },
    'SHIPMENT_IN_TRANSIT': {
      'name': 'Pick up completed',
      'roles': ['CARRIER_DISPATCH_OFFICE']
    },
    'SHIPMENT_AT_DROPOFF': {
      'name': 'Driver at drop off',
      'roles': ['CARRIER_DISPATCH_OFFICE']
    },
    'SHIPMENT_DELIVERED': {
      'name': 'Delivery completed',
      'roles': ['CARRIER_DISPATCH_OFFICE']
    },
    'PAYMENT_IN_PROGRESS': {
      'name': 'Invoice sent',
      'roles': ['CARRIER_DISPATCH_OFFICE']
    },
  };
}
