import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freightcab_shipper/constants/enums/bid_type.dart';
import 'package:freightcab_shipper/constants/enums/shipment_status.dart';
import 'package:freightcab_shipper/constants/enums/appointment_type.dart';
import 'package:freightcab_shipper/constants/enums/item_unit.dart';
import 'package:freightcab_shipper/constants/enums/piece_type.dart';
import 'package:freightcab_shipper/constants/enums/stop_type.dart';
import 'package:freightcab_shipper/constants/enums/accessory.dart';
import 'package:freightcab_shipper/constants/enums/truck_type.dart';
import 'package:freightcab_shipper/constants/enums/temperature_unit.dart';
import 'package:freightcab_shipper/models/bid.dart';
import 'package:freightcab_shipper/models/carrier.dart';
import 'package:freightcab_shipper/models/coordinates.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.graphql.dart';
import 'package:freightcab_shipper/models/offer.dart';
import 'package:freightcab_shipper/models/shipment.dart';
import 'package:freightcab_shipper/models/shipper.dart';
import 'package:freightcab_shipper/models/stop.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/shared/options.dart';
import 'package:freightcab_shipper/ui/views/rejectShipmentButton.dart';
import 'package:freightcab_shipper/ui/views/unverified_card.dart';
import 'package:freightcab_shipper/ui/widgets/buttons.dart';
import 'package:freightcab_shipper/ui/widgets/carrier_info.dart';
import 'package:freightcab_shipper/ui/widgets/dotted_line.dart';
import 'package:freightcab_shipper/ui/widgets/facility_info.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'book_shipment.dart';
import 'getQuote.dart';

class ViewShipmentPage extends StatefulWidget {
  final String uuid;
  final Function refetchParent;

  const ViewShipmentPage(this.uuid, {Key key, this.refetchParent})
      : super(key: key);

  @override
  _ViewShipmentPageState createState() => _ViewShipmentPageState();
}

class _ViewShipmentPageState extends State<ViewShipmentPage> {
  Offer offer;
  Shipper shipper;
  DocumentNode doc;

  Completer<GoogleMapController> _controller = Completer();
  List<Coordinates> coordinates = [];
  List<LatLng> locations = [];

  // Markers to show points on the map
  Map<MarkerId, Marker> markers = {};

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  static final LatLng _kMapCenter = LatLng(
    19.018255973653343,
    72.84793849278007,
  );

  // This method will add markers to the map based on the LatLng position
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _getPolyline(List<Coordinates> data) async {
    List<PolylineWayPoint> points = [];
    if (data.length > 2) {
      for (int i = 1; i < data.length - 1; i++) {
        points.add(PolylineWayPoint(location: '${data[i].lat},${data[i].lng}'));
      }
    }
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapApiKey,
      PointLatLng(data.first.lat, data.first.lng),
      PointLatLng(data.last.lat, data.last.lng),
      travelMode: TravelMode.driving,
      wayPoints: points,
      optimizeWaypoints: true,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  _addPolyLine() {
    polylines.clear();
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Color(0xff0f57fb).withOpacity(0.5),
      points: polylineCoordinates,
      width: 5,
    );
    polylines[id] = polyline;
  }

  Widget _buildIconTextCard(IconData icon, String label,
      [bool bgLinear = false]) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        gradient: bgLinear
            ? LinearGradient(
                begin: new Alignment(0.8, 0.5),
                end: new Alignment(0.74, 0.9),
                colors: [
                  Color(0xfff6f7f9),
                  Color(0xfff6f7f9),
                  Color(0xfff6f7f9),
                  Color(0xfff6f7f9),
                  Color(0xffe2e5ea),
                  Color(0xffe2e5ea),
                  Color(0xffe2e5ea),
                  Color(0xffe2e5ea),
                ],
                tileMode: TileMode.repeated,
              )
            : null,
        color: bgLinear ? null : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade400, width: 0.5),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceCard(Offer offer) {
    List definition = offer.shipment.status.definition(offer);
    final String title = definition[0];
    final String subtitle = definition[1];

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(appPrimaryColorValue),
            ),
          ),
          const SizedBox(height: 4),
          Text(subtitle),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Review shipment",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Query(
        options: QueryOptions(
          document: OfferQuery().document,
          fetchPolicy: FetchPolicy.networkOnly,
          variables: {
            'uuid': widget.uuid,
          },
        ),
        builder: (QueryResult result, {Refetch refetch, FetchMore fetchMore}) {
          if (result.isLoading && result.data == null) {
            //TODO loading widget
            return Center(child: CircularProgressIndicator());
          }

          if (result.hasException) {
            print(result.exception);

            return GestureDetector(
              onTap: refetch,
              child: Center(
                child: Text('Something went wrong, tap to try again'),
              ),
            );
          }

          offer = Offer(json: result.data['offer']);
          shipper = offer.shipment.shipper;

          coordinates = offer.shipment.stops
              .map((e) => e.locationProfile.coordinates)
              .toList();

          for (var stop in coordinates) {
            var id = coordinates.indexOf(stop);
            var latLng = LatLng(stop.lat, stop.lng);
            _addMarker(latLng, id.toString(),
                BitmapDescriptor.defaultMarkerWithHue(222));
            locations.add(latLng);
          }

          _getPolyline(coordinates);

          print('shipment status');
          print(offer.shipment.status);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMap(),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildPriceCard(offer),
                      _buildStops(offer.shipment, refetch),
                      _buildShipmentInfo(offer),
                      _buildCargoInfo(offer),
                      _buildAccessories(offer),
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Load's information",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 12),
                            Text(offer.shipment.loadDescription),
                          ],
                        ),
                      ),
                      if ([
                        ShipmentStatus.UNASSIGNED,
                        ShipmentStatus.CARRIER_ASSIGNED
                      ].contains(offer.shipment.status))
                        _buildCarrierSelect(refetch),
                      shipper.verified
                          ? getButtonsByState(offer.shipment)
                          : UnverifiedCard(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCarrierSelect(Refetch refetch) {
    List<Carrier> carriers = offer.bid
        .where((Bid e) => e.type == BidType.ACCEPT)
        .map((e) => e.carrier)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select carrier',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        Container(
          height: 300,
          margin: EdgeInsets.only(top: 16),
          child: ListView(
            children: carriers.map((Carrier user) {
              print(offer.shipment.carrierId == user.id);

              return Container(
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CarrierInformation(
                          shipment: offer.shipment,
                          carrier: user,
                          onSelected: refetch,
                        );
                      },
                    );
                  },
                  child: ListTile(
                    selected: offer.shipment.carrierId == user.id,
                    title: Text(user.name,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(
                      user.mcDotNumber.substring(0, 2) +
                          ": " +
                          user.mcDotNumber.substring(3),
                    ),
                    trailing: IconButton(
                      icon: Icon(offer.shipment.carrierId == user.id
                          ? Icons.remove_circle_outline
                          : Icons.add_circle_outline),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            bool isAssigned =
                                offer.shipment.carrierId == user.id;
                            doc = isAssigned
                                ? UnAssignCarrierToShipmentMutation().document
                                : AssignCarrierToShipmentMutation().document;
                            return Mutation(
                              options: MutationOptions(
                                document: doc,
                                onCompleted: (dynamic result) {
                                  if (result != null) {
                                    Navigator.pop(context);
                                    refetch();
                                  }
                                },
                                onError: (OperationException e) {
                                  print(e);
                                  if (e.linkException != null) {
                                    showSnackbar(
                                        context,
                                        'Something went wrong, please check your network connection and try again.',
                                        false);
                                  } else if (e.graphqlErrors.isNotEmpty) {
                                    Navigator.pop(context);
                                    showSnackbar(
                                        context,
                                        e.graphqlErrors[0].message ??
                                            'Something went wrong',
                                        false);
                                  } else {
                                    Navigator.pop(context);
                                    showSnackbar(
                                        context, 'Something went wrong', false);
                                  }
                                },
                              ),
                              builder: (RunMutation runMutation,
                                  QueryResult mutationResult) {
                                return mutationResult.isLoading
                                    ? Center(child: CircularProgressIndicator())
                                    : Dialog(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Attention!",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                  'Do you really want to ${isAssigned ? 'unassing' : 'assign'} this carrier?',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              const SizedBox(height: 16),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ElevatedWhiteButton(
                                                      title: "No",
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child:
                                                        ElevatedPrimaryButton(
                                                      title: "Yes",
                                                      isLoading: mutationResult
                                                          .isLoading,
                                                      onPressed: () {
                                                        hideKeyboard();

                                                        if (mutationResult
                                                            .isLoading) {
                                                          return;
                                                        }

                                                        runMutation({
                                                          'uuid': offer
                                                              .shipment.uuid,
                                                          'carrier_id': user.id
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildStops(Shipment shipment, Refetch refetch) {
    var stops = shipment.stops;

    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 113,
          bottom: 135,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(stops.length, (index) {
              return (index == 0
                      ? <Widget>[]
                      : <Widget>[
                          Expanded(
                            child: DottedLine(
                              direction: Axis.vertical,
                              dashRadius: 2.5,
                              dashLength: 5,
                              lineThickness: 5,
                              dashGapLength: 7.66,
                              dashColor: const Color(appPrimaryColorValue),
                            ),
                          )
                        ]) +
                  <Widget>[
                    index + 1 == stops.length
                        ? Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Icon(Icons.location_on_outlined,
                                color: Color(appPrimaryColorValue)),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: Text((index + 1).toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: const Color(appPrimaryColorValue))),
                          )
                  ];
            }).expand((i) => i).toList(),
          ),
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Column(
                children: stops.map((Stop e) {
                  return Container(
                    margin: EdgeInsets.only(left: 36, bottom: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.type.text,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        _buildIconTextCard(
                            Icons.location_on, e.locationProfile.address.full),
                        _buildIconTextCard(Icons.label, e.appointmentType.name),
                        _buildIconTextCard(Icons.watch_later,
                            e.startTime.format('dd MMMM, HH:mm')),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color(appPrimaryColorValue),
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return FacilityInformation(e.locationProfile);
                                },
                              );
                            },
                            child: Text('View facility'),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildShipmentInfo(Offer offer) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipment information',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Text.rich(TextSpan(text: 'ID number : ', children: [
            TextSpan(
                text: "#${offer.shipment.shortName ?? ''}",
                style: TextStyle(fontWeight: FontWeight.bold))
          ])),
          const SizedBox(height: 8),
          Text.rich(TextSpan(text: 'Shipment type: ', children: [
            TextSpan(
                text: offer.shipment.stops.length == 2
                    ? 'Point-to-Point'
                    : 'Multiple Point',
                style: TextStyle(fontWeight: FontWeight.bold))
          ])),
          const SizedBox(height: 8),
          Text.rich(TextSpan(text: 'Equipment type : ', children: [
            TextSpan(
              text: offer.shipment.requestedTruckTypes.first.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (offer.shipment.requestedTruckTypes.first == TruckType.REEFER)
              TextSpan(
                text:
                    "  (${offer.shipment.trailer.temperatureMin}, ${offer.shipment.trailer.temperatureMax} ${offer.shipment.trailer.temperatureUnit.text})",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
          ])),
          const SizedBox(height: 8),
          Text.rich(TextSpan(text: 'Shipment distance : ', children: [
            TextSpan(
                text: offer.shipment.routeDistanceMiles.toString() + " miles",
                style: TextStyle(fontWeight: FontWeight.bold))
          ])),
          const SizedBox(height: 8),
          Text.rich(TextSpan(text: 'Minimum transit time : ', children: [
            TextSpan(
                text: convertMintoDay(
                  offer.shipment.routeDurationMinutes.toString(),
                ),
                style: TextStyle(fontWeight: FontWeight.bold))
          ])),
        ],
      ),
    );
  }

  Widget _buildCargoInfo(Offer offer) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cargo information",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text.rich(TextSpan(text: 'Description : ', children: [
            TextSpan(
                text: offer.shipment.items[0]?.description ?? '',
                style: TextStyle(fontWeight: FontWeight.bold))
          ])),
          const SizedBox(height: 8),
          Text.rich(TextSpan(text: 'Weight (LB) : ', children: [
            TextSpan(
                text: offer.shipment.items[0].weight?.weight?.toString(),
                style: TextStyle(fontWeight: FontWeight.bold))
          ])),
          const SizedBox(height: 8),
          Text.rich(TextSpan(text: 'Item quantity : ', children: [
            TextSpan(
                text:
                    "${offer.shipment?.items[0]?.unit?.count ?? ''} ${offer.shipment?.items[0]?.unit?.type?.text ?? ''}",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ])),
          const SizedBox(height: 8),
          Text.rich(TextSpan(text: 'Item packaging :  ', children: [
            TextSpan(
                text:
                    "${offer.shipment.items[0].handlingPiece?.pieceCount ?? ''} ${offer.shipment.items[0].handlingPiece?.pieceType?.text ?? ''}",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ])),
        ],
      ),
    );
  }

  Widget _buildAccessories(Offer offer) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Accessories & Credentials',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          if (offer.shipment.accessories == null ||
              offer.shipment.accessories.isEmpty)
            Text(''),
          if (offer.shipment.accessories != null &&
              offer.shipment.accessories.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: offer.shipment.accessories
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text(e.text),
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }

  // Widget _buildStartCompleteButton(
  //     Stop stop, Shipment shipment, Refetch refetch) {
  //   if (!shipment.isInProgress) {
  //     return SizedBox.shrink();
  //   }

  //   bool _buttonEnabled = false;
  //   String label = 'Start';
  //   IconData icon = Icons.arrow_circle_up;
  //   String document = GqlOffer.startJob;

  //   if (stop.startedAt == null) {
  //     _buttonEnabled = stop.jobActionEnabled;
  //   } else if (stop.completedAt == null) {
  //     label = 'Complete';
  //     document = GqlOffer.completeJob;
  //     icon = Icons.check_circle_outline_rounded;
  //     _buttonEnabled = stop.jobActionEnabled;
  //   } else {
  //     label = 'Completed';
  //     icon = Icons.check_circle_outline_rounded;
  //     _buttonEnabled = false;
  //   }

  //   return Mutation(
  //     options: MutationOptions(
  //       document: gql(document),
  //       onCompleted: (dynamic result) {
  //         if (result != null) {
  //           refetch();
  //         }
  //       },
  //       onError: (OperationException e) {
  //         print(e);
  //         if (e.linkException != null) {
  //           showSnackbar(
  //               context,
  //               'Something went wrong, please check your network connection and try again.',
  //               false);
  //         } else if (e.graphqlErrors.isNotEmpty) {
  //           showSnackbar(context,
  //               e.graphqlErrors[0].message ?? 'Something went wrong', false);
  //         } else {
  //           showSnackbar(context, 'Something went wrong', false);
  //         }
  //       },
  //     ),
  //     builder: (RunMutation runMutation, QueryResult mutationResult) {
  //       return Container(
  //         height: 48,
  //         width: double.infinity,
  //         margin: EdgeInsets.only(top: 8),
  //         child: TextButton.icon(
  //           onPressed: _buttonEnabled
  //               ? () {
  //                   showDialog(
  //                     context: context,
  //                     barrierDismissible: false,
  //                     builder: (BuildContext context) {
  //                       return AlertDialog(
  //                         title: Text('Are you sure ?'),
  //                         actions: [
  //                           TextButton(
  //                             child: Text('No'),
  //                             onPressed: () => Navigator.pop(context),
  //                           ),
  //                           TextButton(
  //                             child: Text('Yes'),
  //                             onPressed: () {
  //                               Navigator.pop(context);
  //                               runMutation({
  //                                 'stop_id': stop.id,
  //                               });
  //                             },
  //                           ),
  //                         ],
  //                       );
  //                     },
  //                   );
  //                 }
  //               : null,
  //           icon: mutationResult.isLoading ? SizedBox.shrink() : Icon(icon),
  //           style: TextButton.styleFrom(
  //             backgroundColor: Color(0xff38c172),
  //             primary: Colors.white,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(6),
  //             ),
  //           ),
  //           label: mutationResult.isLoading
  //               ? Center(child: const ProgressIndicatorSmall())
  //               : Text(label),
  //         ),
  //       );
  //     },
  //   );
  // }

  getButtonsByState(Shipment shipment) {
    switch (shipment.status) {
      case ShipmentStatus.CREATED:
        return GetQuote(uuid: widget.uuid);
      case ShipmentStatus.REQUEST_IN_PROGRESS:
      case ShipmentStatus.PRICE_ACCEPTED:
      case ShipmentStatus.UNASSIGNED:
      case ShipmentStatus.CARRIER_ASSIGNED:
      case ShipmentStatus.DRIVER_ASSIGNED:
      case ShipmentStatus.DISPATCHED:
        return ElevatedPrimaryButton(
            title: "Reject Shipment",
            onPressed: () => buildDialog(RejectShipment(uuid: widget.uuid)),
            isLoading: false,
            bgColor: Colors.redAccent);
      case ShipmentStatus.PRICE_DEFINED:
        return Row(
          children: [
            Expanded(
              child: ElevatedPrimaryButton(
                  title: "Reject Shipment",
                  onPressed: () =>
                      buildDialog(RejectShipment(uuid: widget.uuid)),
                  isLoading: false,
                  bgColor: Colors.redAccent),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedPrimaryButton(
                title: "Book Shipment",
                onPressed: () => buildDialog(BookShipment(uuid: widget.uuid)),
                isLoading: false,
              ),
            ),
          ],
        );
      case ShipmentStatus.REJECTED_BY_SHIPPER:
      case ShipmentStatus.AT_PICKUP:
      case ShipmentStatus.IN_TRANSIT:
      case ShipmentStatus.AT_DELIVERY:
      case ShipmentStatus.DELIVERED:
        return Container();
      default:
        throw Exception();
    }
  }

  buildDialog(Widget child) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          child: child,
        );
      },
    );
  }

  // Widget _buildDocumentButton(Stop stop, Shipment shipment, Refetch refetch) {
  //   if (!shipment.isInProgress) {
  //     return SizedBox.shrink();
  //   }
  //   return Container(
  //     margin: EdgeInsets.only(top: 8),
  //     height: 48,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Mutation(
  //           options: MutationOptions(
  //             document: gql(GqlOffer.uploadShipmentDocument),
  //             onCompleted: (dynamic result) {
  //               if (result != null) {
  //                 refetch();
  //                 showSnackbar(context, 'Uploaded successfully', true);
  //               }
  //             },
  //             onError: (OperationException e) {
  //               print(e);
  //               if (e.linkException != null) {
  //                 showSnackbar(
  //                     context,
  //                     'Something went wrong, please check your network connection and try again.',
  //                     false);
  //               } else if (e.graphqlErrors.isNotEmpty) {
  //                 showSnackbar(
  //                     context,
  //                     e.graphqlErrors[0].message ?? 'Something went wrong',
  //                     false);
  //               } else {
  //                 showSnackbar(context, 'Something went wrong', false);
  //               }
  //             },
  //           ),
  //           builder: (RunMutation runMutation, QueryResult mutationResult) {
  //             return IconButton(
  //               icon: mutationResult.isLoading
  //                   ? ProgressIndicatorSmall()
  //                   : Icon(Icons.upload_rounded),
  //               onPressed: stop.canUploadDocument
  //                   ? () async {
  //                       final file =
  //                           await FilePicker.getFile(type: FileType.ANY);

  //                       if (file != null) {
  //                         var filename = file.path.split('/').last;
  //                         var byteData = file.readAsBytesSync();
  //                         var multipartFile = MultipartFile.fromBytes(
  //                             'file', byteData,
  //                             filename: filename);
  //                         runMutation({
  //                           'uuid': shipment.uuid,
  //                           'stop_id': stop.id,
  //                           'file': multipartFile,
  //                           'type': stop.type == StopType.PICKUP
  //                               ? ShipmentDocumentType.BILL_OF_LOAD.describe
  //                               : ShipmentDocumentType
  //                                   .PROOF_OF_DELIVERY.describe,
  //                           'name': filename,
  //                         });
  //                       }
  //                     }
  //                   : null,
  //             );
  //           },
  //         ),
  //         VerticalDivider(
  //             color: Colors.grey.shade300,
  //             thickness: 1,
  //             indent: 6,
  //             endIndent: 6),
  //         IconButton(
  //           icon: Icon(Icons.download_rounded),
  //           onPressed: stop.document == null
  //               ? null
  //               : () async {
  //                   if (await canLaunch(stop.document.url)) {
  //                     launch(stop.document.url);
  //                   } else {
  //                     print("Couldn't launch " + stop.document.url);
  //                   }
  //                 },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildMap() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      height: 280,
      width: double.infinity,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _kMapCenter,
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          Future.delayed(
              Duration(milliseconds: 200),
              () => controller.animateCamera(CameraUpdate.newLatLngBounds(
                  boundsFromLatLngList(locations), 50)));
        },
        polylines: Set<Polyline>.of(polylines.values),
        markers: Set<Marker>.of(markers.values),
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
      ),
    );
  }
}
