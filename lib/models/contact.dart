class Contact {
  String name;
  String email;
  String phoneNumber;
  String notes;

  Contact({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    name = json['contact_name'] ?? '';
    email = json['email'] ?? '';
    phoneNumber = json['phone_number'] ?? '';
    notes = json['notes'] ?? '';
  }
}
