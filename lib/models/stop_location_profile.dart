import 'address.dart';
import 'contact.dart';
import 'coordinates.dart';

class StopLocationProfile {
  String id;
  String locationName;
  Coordinates coordinates;
  Address address;
  Contact operationalContact;
  Contact schedulingContact;
  String notes;

  StopLocationProfile({Map<String, dynamic> json}) {
    id = json['id'] ?? '';
    locationName = json['location_name'] ?? '';
    coordinates = Coordinates(json: json['coordinates']);
    address = Address(json: json['address']);
    operationalContact = Contact(json: json['operational_contact']);
    schedulingContact = Contact(json: json['scheduling_contact']);
    notes = json['notes'] ?? '';
  }
}
