import 'package:flutter/material.dart';
import 'package:freightcab_shipper/ui/widgets/drawer.dart';

class IndexProvider with ChangeNotifier {
  // initial drawer index
  DrawerItem _drawerItem = drawerGroups.first.items.first;

  // getter
  DrawerItem get getDrawerSelectedIndex => this._drawerItem;

  // setter
  set setDrawerSelectedIndex(DrawerItem value) {
    this._drawerItem = value;
    notifyListeners();
  }

  resetRoutes() {
    this._drawerItem = drawerGroups.first.items.first;
    notifyListeners();
  }
}
