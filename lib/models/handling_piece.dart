import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/constants/enums/piece_type.dart';

class HandlingPiece {
  PieceType pieceType;
  int pieceCount;

  HandlingPiece({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    pieceType = PieceType.values.firstWhere(
        (e) => describeEnum(e) == json['piece_type'],
        orElse: () => null);
    pieceCount = json['piece_count'] ?? 0;
  }
}
