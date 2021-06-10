import 'package:flutter/material.dart';

class UserSelectedLocationsProvider with ChangeNotifier {
  String routeMile = '';
  String routeDuration = '';

  setDefaults(String mile, String duration) {
    this.routeMile = mile;
    this.routeDuration = duration;
    notifyListeners();
  }
}
