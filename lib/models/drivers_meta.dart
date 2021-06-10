class DriversMeta {
  double miles;
  int minutes;
  int completedShipment;

  DriversMeta({Map<String, dynamic> json}) {
    miles = json['miles'] ?? 0.0;
    minutes = json['minutes'] ?? 0;
    completedShipment = json['completed_shipment'] ?? 0;
  }
}
