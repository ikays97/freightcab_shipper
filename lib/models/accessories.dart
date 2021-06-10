import 'package:freightcab_shipper/constants/enums/accessory.dart';

class Accessories {
  bool isChecked;
  Accessory type;
  String label;
  Accessories({this.type, this.label, this.isChecked = false});
}
