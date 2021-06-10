import 'package:flutter/material.dart';
import 'package:freightcab_shipper/constants/enums/accessory.dart';
import 'package:freightcab_shipper/constants/enums/item_unit.dart';
import 'package:freightcab_shipper/constants/enums/piece_type.dart';
import 'package:freightcab_shipper/constants/enums/stop_type.dart';
import 'package:freightcab_shipper/constants/enums/temperature_unit.dart';
import 'package:freightcab_shipper/constants/enums/truck_type.dart';
import 'package:freightcab_shipper/models/accessories.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/models/shipment.dart';
import 'package:freightcab_shipper/models/stop.dart';
import 'package:freightcab_shipper/models/stopPoint.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class EditShipmentProvider with ChangeNotifier {
  String uuid;
  UserShipment$Query$UserShipment shipment;

  // booleans
  bool isMultipleStops = false;
  bool isReefer = false;
  bool estimate = false;

  // textfield saved
  String maxSaved = '';
  String minSaved = '';
  String descSaved = '';
  String shortSaved = '';
  String weightSaved = '';
  String quantitySaved = '';
  String packingSaved = '';
  String loadDescSaved = '';
  String opNameSaved = '';
  String opPhoneSaved = '';
  String opEmailSaved = '';
  String schNameSaved = '';
  String schPhoneSaved = '';
  String schEmailSaved = '';

  // textfield errors
  String maxError;
  String minError;
  String descError;
  String shortError;
  String weightError;
  String quantityError;
  String packingError;
  String loadDescError;
  String opNameError;
  String opPhoneError;
  String opEmailError;
  String schNameError;
  String schPhoneError;
  String schEmailError;

  // dropdown selected
  TemperatureUnit selectedTempType;
  ItemUnit selectedQuantityType;
  PieceType selectedPackageType;

  // stop points
  List<StopPoint> stopPoints = [
    StopPoint(
      label: 'Pick up location',
      stopType: StopType.PICKUP,
    ),
    StopPoint(
      label: 'Drop off location',
      stopType: StopType.DROPOFF,
    ),
  ];

  // distance info
  double distanceMile = 0.0;
  int transitionTime = 0;

  // accessories
  List<Accessories> accessoriesList = [];

  // EditShipmentProvider() {
  //   this.selectedQuantityType = ItemUnit.UNITS;
  //   this.selectedPackageType = PieceType.PALLETS;
  // }

  // getters

  /// setters
  set setUUId(String v) {
    this.uuid = v;
    this.notifyListeners();
  }

  /// set multiple stop or not
  set setMultipleOrNot(bool v) {
    this.isMultipleStops = v;
    this.notifyListeners();
  }

  /// set reefer or not
  set setReeferOrNot(bool v) {
    this.isReefer = v;
    this.notifyListeners();
  }

  /// set temperature type
  set setTemperatureType(TemperatureUnit v) {
    this.selectedTempType = v;
    this.notifyListeners();
  }

  /// set max temperature
  /// which user enters
  set setMax(String v) {
    this.maxSaved = v;
    this.notifyListeners();
  }

  /// set max error (String)
  set setMaxError(String v) {
    this.maxError = v;
    this.notifyListeners();
  }

  /// set min temperature
  /// which user enters
  set setMin(String v) {
    this.minSaved = v;
    this.notifyListeners();
  }

  /// set min temperature
  set setMinError(String v) {
    this.minError = v;
    this.notifyListeners();
  }

  /// set (save) description
  /// (commodity info) which
  /// user enters
  set setDesc(String v) {
    this.descSaved = v;
    this.notifyListeners();
  }

  /// set description error
  set setDescError(String v) {
    this.descError = v;
    this.notifyListeners();
  }

  set setTrackID(String v) {
    this.shortSaved = v;
    this.notifyListeners();
  }

  set setTrackIDError(String v) {
    this.shortError = v;
    this.notifyListeners();
  }

  set setWeight(String v) {
    this.weightSaved = v;
    this.notifyListeners();
  }

  set setWeightError(String v) {
    this.weightError = v;
    this.notifyListeners();
  }

  set setQuantity(String v) {
    this.quantitySaved = v;
    this.notifyListeners();
  }

  set setQuantityError(String v) {
    this.quantityError = v;
    this.notifyListeners();
  }

  set setQuantityType(ItemUnit v) {
    this.selectedQuantityType = v;
    this.notifyListeners();
  }

  set setPacking(String v) {
    this.packingSaved = v;
    this.notifyListeners();
  }

  set setPackingError(String v) {
    this.packingError = v;
    this.notifyListeners();
  }

  set setPackingType(PieceType v) {
    this.selectedPackageType = v;
    this.notifyListeners();
  }

  set setLoadDesc(String v) {
    this.loadDescSaved = v;
    this.notifyListeners();
  }

  set setLoadDescError(String v) {
    this.loadDescError = v;
    this.notifyListeners();
  }

  set setEstimate(bool v) {
    this.estimate = v;
    this.notifyListeners();
  }

  // class functions

  /// add stop point to existing stop point
  /// list (available only for multiple stops)
  void onAddStopPointTap() {
    if (this.stopPoints.length == 2) {
      this.stopPoints.insert(1, StopPoint());
    } else if (this.stopPoints.length > 2) {
      this.stopPoints.insert(this.stopPoints.length - 2, StopPoint());
    }
    this.notifyListeners();
  }

  /// remove stop point from existing stop point
  /// list (available only for multiple stops)
  void onRemoveStopPointTap(int index) {
    stopPoints.removeAt(index);
    this.notifyListeners();
  }

  /// insert stop point to existing stop point
  /// list (available only for multiple stops)
  void onInsertStopPointTap(int newIndex, StopPoint item) {
    this.stopPoints.insert(newIndex, item);
  }

  resetAll() {
    uuid = null;
    shipment = null;

    // booleans
    isMultipleStops = false;
    isReefer = false;
    estimate = false;

    // textfield saved
    maxSaved = '';
    minSaved = '';
    descSaved = '';
    shortSaved = '';
    weightSaved = '';
    quantitySaved = '';
    packingSaved = '';
    loadDescSaved = '';
    opNameSaved = '';
    opPhoneSaved = '';
    opEmailSaved = '';
    schNameSaved = '';
    schPhoneSaved = '';
    schEmailSaved = '';

    // textfield errors
    maxError = null;
    minError = null;
    descError = null;
    shortError = null;
    weightError = null;
    quantityError = null;
    packingError = null;
    loadDescError = null;
    opNameError = null;
    opPhoneError = null;
    opEmailError = null;
    schNameError = null;
    schPhoneError = null;
    schEmailError = null;

    accessoriesList = [];

    // distance info
    distanceMile = 0.0;
    transitionTime = 0;

    this.selectedQuantityType = ItemUnit.UNITS;
    this.selectedPackageType = PieceType.PALLETS;
    stopPoints = [
      StopPoint(
        label: 'Pick up location',
        stopType: StopType.PICKUP,
      ),
      StopPoint(
        label: 'Drop off location',
        stopType: StopType.DROPOFF,
      ),
    ];
  }

  /// returns Text widget includes empty
  /// String or fetched calculated mile
  /// and transition from the backend
  Widget getEstimation(bool isMile) {
    final locations = this.stopPoints.map((e) {
      if (e.location != null) return e.location;
    }).toList();
    return locations.isEmpty || !locations.contains(null)
        ? Query(
            options: WatchQueryOptions(
              document: GetEstimationQuery().document,
              variables: {
                "locations": List.generate(locations.length, (index) {
                  return LocationCollectionInput(
                    coordinates: CoordinatesInput(
                      lat: locations[index].coordinates.lat,
                      lng: locations[index].coordinates.lng,
                    ),
                  );
                }),
              },
            ),
            builder: (result, {refetch, fetchMore}) {
              if (result.hasException) {
                return GestureDetector(
                  onTap: () => refetch(),
                  child: Center(child: Text('')),
                );
              }

              if (result.isLoading && result.data == null) return Text('');

              final resultData = GetEstimation$Query.fromJson(result.data);
              setDurationAndTime(
                resultData.getEstimations.routeDistanceMiles,
                resultData.getEstimations.routeDurationMinutes,
              );

              var distance = resultData.getEstimations.routeDistanceMiles
                  .toStringAsFixed(2);
              var duration = convertMintoDay(
                resultData.getEstimations.routeDurationMinutes.toString(),
              );
              return isMile ? Text("$distance miles") : Text(duration);
            },
          )
        : Text('');
  }

  setDurationAndTime(double mile, int time) {
    this.distanceMile = mile;
    this.transitionTime = time;
    // this.notifyListeners();
  }

  setOpName(int index, value) {
    this.stopPoints[index].location.operationalContact.contactName = value;
    this.notifyListeners();
  }

  setOpPhone(int index, value) {
    this.stopPoints[index].location.operationalContact.phoneNumber = value;
    this.notifyListeners();
  }

  setOpEmail(int index, value) {
    this.stopPoints[index].location.operationalContact.email = value;
    this.notifyListeners();
  }

  setSchedName(int index, value) {
    this.stopPoints[index].location.schedulingContact.contactName = value;
    this.notifyListeners();
  }

  setSchedPhone(int index, value) {
    this.stopPoints[index].location.schedulingContact.phoneNumber = value;
    this.notifyListeners();
  }

  setSchedEmail(int index, value) {
    this.stopPoints[index].location.schedulingContact.email = value;
    this.notifyListeners();
  }

  void setAll(Shipment shipment) {
    final item = shipment.items[0];

    uuid = shipment.uuid;
    isMultipleStops = shipment.stops.length > 2;
    isReefer = shipment.requestedTruckTypes.first == TruckType.REEFER;
    minSaved = shipment.trailer.temperatureMin.toString();
    maxSaved = shipment.trailer.temperatureMax.toString();
    descSaved = item.description;
    shortSaved = shipment.shortName;
    weightSaved = item.weight.weight.toString();
    quantitySaved = item.unit.count.toString();
    selectedQuantityType = item.unit.type;
    packingSaved = item.handlingPiece.pieceCount.toString();
    selectedPackageType = item.handlingPiece.pieceType;
    accessoriesList = Accessory.values
        .map((e) => Accessories(
            type: e,
            label: e.text,
            isChecked: shipment.accessories
                    .firstWhere((el) => el == e, orElse: () => null) !=
                null))
        .toList();

    stopPoints = shipment.stops
        .map((Stop el) => StopPoint(
            location: el.locationProfile,
            startTime: el.startTime,
            endTime: el.endTime,
            label: el.type.text,
            stopType: el.type,
            appointmentType: el.appointmentType))
        .toList();

    selectedPackageType = item.handlingPiece.pieceType;
    distanceMile = shipment.routeDistanceMiles;
    transitionTime = shipment.routeDurationMinutes;

    this.notifyListeners();

    //   List<StopPoint> stops = [];

    //   this.uuid = shipment.uuid;
    //   this.isMultipleStops = shipment.stops.length > 2;
    //   this.isReefer = shipment.requestedTruckTypes.first == TruckType.REEFER;
    //   this.maxSaved = shipment.trailer?.temperatureMax.toString();
    //   this.minSaved = shipment.trailer?.temperatureMin.toString();
    //   this.descSaved = shipment.items.first.description;
    //   this.shortSaved = shipment.shortName;
    //   this.weightSaved = shipment.items.first.weight.weight.toString();
    //   this.quantitySaved = shipment.items.first.units.unitCount.toString();
    //   this.packingSaved =
    //       shipment.items.first.handlingPiece.pieceCount.toString();
    //   // TODO: accessorials
    //   // this.
    //   this.loadDescSaved = shipment.loadDescription;
    //   for (var point in shipment.stops) {
    //     stops.add(StopPoint(
    //       label: point.type.toString(), //text,
    //       location: UserLocations$Query$ShipperLocationProfiles$Data.fromJson(
    //           point.locationProfile.toJson()),
    //       startTime: DateTime.tryParse(point.startTime),
    //       endTime: DateTime.tryParse(point.endTime),
    //       stopType: point.type,
    //     ));
    //   }
    //   this.stopPoints = stops;
    //   this.distanceMile = shipment.routeDistanceMiles;
    //   this.transitionTime = shipment.routeDistanceMiles.toInt();
    //   // this.notifyListeners();
  }
}
