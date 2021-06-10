class Address {
  String full;
  String city;
  String state;
  String street;
  int streetNumber;
  String placeId;

  Address({Map<String, dynamic> json}) {
    full = json['full'] ?? '';
    city = json['city'] ?? '';
    state = json['state'] ?? '';
    street = json['street'] ?? '';
    streetNumber = json['street_number'] ?? 0;
    placeId = json['place_id'] ?? '';
  }
}
