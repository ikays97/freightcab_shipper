import 'package:flutter/foundation.dart';

enum ItemUnit {
  UNITS,
  CASES,
  CASE_EQUIVALENTS,
  KEGS,
}

extension Exten on ItemUnit {
  String get describe => describeEnum(this).toString();

  String get text {
    switch (this) {
      case ItemUnit.UNITS:
        return 'Units';
      case ItemUnit.CASES:
        return 'Cases';
      case ItemUnit.CASE_EQUIVALENTS:
        return 'Case Equivalents';
      case ItemUnit.KEGS:
        return 'Kegs';
      default:
        throw Exception();
    }
  }
}
