import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/constants/enums/user_role.dart';
import 'package:freightcab_shipper/models/shipper.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';

import 'drivers_meta.dart';

class User {
  int id;
  int companyId;
  Shipper shipper;
  String firstname;
  String lastname;
  String email;
  String phone;
  UserRole role;
  DriversMeta meta;
  String token;

  // RequestLoads loads;

  User({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    token = json['token'] ?? '';
    id = castToInt(json['id'] ?? 0);
    companyId = castToInt(json['company_id'] ?? 0);
    shipper = Shipper(json: json['shipper']);
    firstname = json['firstname'] ?? '';
    lastname = json['lastname'] ?? '';
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    role = UserRole.values
        .firstWhere((e) => describeEnum(e) == json['role'], orElse: () => null);
    meta = DriversMeta(json: json['meta'] ?? Map<String, dynamic>());
  }

  String roleName() {
    return role != null ? describeEnum(role) : '';
  }

  String get greet {
    final partsOfDay = [
      {'from': 0, 'to': 4, 'message': "Good night"},
      {'from': 5, 'to': 11, 'message': "Good morning"},
      {'from': 12, 'to': 17, 'message': "Good afternoon"},
      {'from': 18, 'to': 24, 'message': "Good evening"},
    ];

    final hour = DateTime.now().hour;

    return partsOfDay.firstWhere(
        (e) => (e['from'] as int) <= hour && hour <= e['to'])['message'];
  }
}
