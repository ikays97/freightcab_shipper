import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiAuth with ChangeNotifier {
  final String token;
  final User authUser;

  User _user;

  ApiAuth({
    this.token,
    this.authUser,
  });

  User get authorizedUser {
    return this._user;
  }

  setAuthorizedUser(User value, [bool notifyListener = true]) {
    this._user = value;
    if (notifyListener) {
      notifyListeners();
    }
  }

  static Future<ApiAuth> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return ApiAuth(
      token: prefs.getString('token'),
      authUser: User(
        json: jsonDecode(
          prefs.getString('user'),
        ),
      ),
    );
  }

  static Future<ApiAuth> login(Map<String, dynamic> payload) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', payload['access_token'] ?? null);
    await prefs.setString('token_expires_at', payload['expires_at'] ?? null);
    await prefs.setString('user', jsonEncode(payload['user']));

    return ApiAuth(
      token: prefs.getString('token'),
      authUser: User(
        json: jsonDecode(
          prefs.getString('user'),
        ),
      ),
    );
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('token_expires_at');
    await prefs.remove('user');
  }
}
