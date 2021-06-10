import 'package:freightcab_shipper/ui/shared/extensions.dart';

import 'carrier.dart';

class Region {
  int id;
  String region;
  String subRegion;
  bool selected = false;

  Region({Map<String, dynamic> json, Carrier carrier}) {
    if (json == null) {
      return;
    }

    id = castToInt(json['id'] ?? 0);
    region = json['region'] ?? '';
    subRegion = json['sub_region'] ?? '';

    if (carrier != null) {
      selected = carrier.operatingRegions.contains(subRegion);
    }
  }

  String get formattedRegion {
    return region[0].toUpperCase() +
        region.replaceAll('_', ' ').substring(1).toLowerCase();
  }

  String get formattedSubRegion {
    return subRegion[0].toUpperCase() +
        subRegion.replaceAll('_', ' ').substring(1).toLowerCase();
  }
}
