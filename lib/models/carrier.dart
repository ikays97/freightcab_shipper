import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/constants/enums/truck_accessory.dart';
import 'package:freightcab_shipper/models/truck.dart';
import 'package:freightcab_shipper/models/user.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';

import 'carrier_address.dart';
import 'carrier_contact.dart';
import 'document.dart';

class Carrier {
  int id;
  String name;
  String mcDotNumber;
  List<User> users;
  CarrierContact contact;
  CarrierAddress address;
  List<Truck> trucks;
  List<TruckAccessory> truckAccessories;
  List<String> operatingRegions;
  List<Document> documents;
  bool verified;
  String status;

  Carrier({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    id = castToInt(json['id'] ?? 0);
    name = json['name'] ?? '';
    mcDotNumber = json['mc_dot_number'] ?? '';
    users = List.from(((json['users'] ?? []) as List<dynamic>)
        .map((json) => User(json: json)));
    contact = CarrierContact(json: json['contact']);
    address = CarrierAddress(json: json['address']);
    trucks = List.from(((json['trucks'] ?? []) as List<dynamic>)
        .map((json) => Truck(json: json)));
    truckAccessories = List.from(
      ((json['truck_accessorials'] ?? []) as List<dynamic>).map(
        (s) => TruckAccessory.values
            .firstWhere((e) => describeEnum(e) == s, orElse: () => null),
      ),
    );
    operatingRegions = List.from(json['operating_regions'] ?? [])
        .map((e) => e.toString())
        .toList();
    documents = List.from(((json['documents'] ?? []) as List<dynamic>)
        .map((json) => Document(json: json)));
    verified = json['verified'] ?? false;
    status = json['status'] ?? '';
  }
}
