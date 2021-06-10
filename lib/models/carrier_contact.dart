class CarrierContact {
  String phone;
  String email;
  String fullname;

  CarrierContact({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    phone = json['phone'] ?? '';
    email = json['email'] ?? '';
    fullname = json['fullname'] ?? '';
  }
}
