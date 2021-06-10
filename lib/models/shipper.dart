import 'package:freightcab_shipper/models/user.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';

import 'carrier_address.dart';
import 'carrier_contact.dart';
import 'document.dart';

class Shipper {
  int id;
  String name;
  String tinEinNumber;
  bool verified;
  CarrierAddress address;
  CarrierAddress billingAddress;
  CarrierContact primaryContact;
  CarrierContact billingContact;
  List<Document> documents;
  List<User> users;

  Shipper({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    id = castToInt(json['id'] ?? 0);
    name = json['name'] ?? '';
    tinEinNumber = json['tin_ein_number'] ?? '';
    verified = json['verified'] ?? false;
    address = CarrierAddress(json: json['address']);
    billingAddress = CarrierAddress(json: json['billing_address']);
    primaryContact = CarrierContact(json: json['primary_contact']);
    billingContact = CarrierContact(json: json['billing_contact']);
    documents = List.from(((json['documents'] ?? []) as List<dynamic>)
        .map((json) => Document(json: json)));
    users = List.from(((json['users'] ?? []) as List<dynamic>)
        .map((json) => User(json: json)));
  }
}
