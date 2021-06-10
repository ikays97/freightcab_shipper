import 'package:flutter/foundation.dart';

enum UserRole {
  CARRIER_DRIVER,
  CARRIER_OWNER_OPERATOR,
  CARRIER_DISPATCH_OFFICE,
}

extension CatExtension on UserRole {
  String get describe => describeEnum(this).toString();

  String get name {
    switch (this) {
      case UserRole.CARRIER_DRIVER:
        return 'Driver';
      case UserRole.CARRIER_OWNER_OPERATOR:
        return 'Owner operator';
      case UserRole.CARRIER_DISPATCH_OFFICE:
        return 'Dispatch office';
      default:
        return null;
    }
  }

  List<String> get features {
    switch (this) {
      case UserRole.CARRIER_DRIVER:
        return [
          'Location tracking during shipments',
          'Upload BOLs',
          'Report issue through Freight app',
        ];
      case UserRole.CARRIER_OWNER_OPERATOR:
        return [
          'View Rates / Receive Rate Con',
          'Place bids',
          'Accept shipments',
          'Location tracking during shipments',
          'Upload BOLs',
          'Report issue through Freight app',
        ];
      case UserRole.CARRIER_DISPATCH_OFFICE:
        return [
          'View Rates / Receive Rate Con',
          'Place bids',
          'Accept shipments',
          'Add Drivers / View Fleet',
          'Assign drivers to shipments',
          'View other users\' shipments',
          'Upload BOLs',
          'Report issue through Freight app',
        ];
      default:
        return [];
    }
  }
}
