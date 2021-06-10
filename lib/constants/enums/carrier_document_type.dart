import 'package:flutter/foundation.dart';

enum CarrierDocumentType {
  OPERATING_AUTHORITY_LETTER,
  CERTIFICATE_INSURANCE,
  AUTO_LIABILITY_CHANGES,
  CARGO_COVERAGE,
  W_9,
}

extension CarrierDocumentTypeExtension on CarrierDocumentType {
  String get describe => describeEnum(this).toString();

  String get name {
    switch (this) {
      case CarrierDocumentType.OPERATING_AUTHORITY_LETTER:
        return 'Operating Authority letter';
      case CarrierDocumentType.CERTIFICATE_INSURANCE:
        return 'Certificate Insurance';
      case CarrierDocumentType.AUTO_LIABILITY_CHANGES:
        return '\$ 1,000,000 auto liability changes';
      case CarrierDocumentType.CARGO_COVERAGE:
        return '\$ 100,000 cargo coverage';
      case CarrierDocumentType.W_9:
        return 'W-9 document';
      default:
        return null;
    }
  }
}
