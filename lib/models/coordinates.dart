class Coordinates {
  double lat;
  double lng;

  Coordinates({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    lat = json['lat']?.toDouble() ?? 0.0;
    lng = json['lng']?.toDouble() ?? 0.0;
  }
}
