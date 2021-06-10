import 'package:flutter/foundation.dart';

enum PieceType {
  PALLETS,
  PALLETS_OVERSIZE,
  BAGS,
  BALES,
  BOXES,
  BUNDLES,
  CONTAINERS,
  CRATES,
  ROLLS,
  TOTES,
  OTHER,
  NOT_PACKAGE,
}

extension Prop on PieceType {
  String get describe => describeEnum(this).toString();

  String get text {
    switch (this) {
      case PieceType.PALLETS:
        return 'Pallets';
      case PieceType.PALLETS_OVERSIZE:
        return 'Pallets Oversize';
      case PieceType.BAGS:
        return 'Bags';
      case PieceType.BALES:
        return 'Bales';
      case PieceType.BOXES:
        return 'Boxes';
      case PieceType.BUNDLES:
        return 'Bundles';
      case PieceType.CONTAINERS:
        return 'Containers';
      case PieceType.CRATES:
        return 'Crates';
      case PieceType.ROLLS:
        return 'Rolls';
      case PieceType.TOTES:
        return 'Totes';
      case PieceType.OTHER:
        return 'Other';
      case PieceType.NOT_PACKAGE:
        return 'NOT PACKAGE';
      default:
        throw Exception();
    }
  }
}
