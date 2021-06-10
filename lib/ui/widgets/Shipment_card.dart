import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freightcab_shipper/constants/enums/shipment_status.dart';
import 'package:freightcab_shipper/models/shipment.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/shared/options.dart';
import 'package:freightcab_shipper/ui/views/edit_shipment_backup.dart';
import 'package:freightcab_shipper/ui/views/view_shipment.dart';
import 'package:freightcab_shipper/ui/widgets/shipment_stepper.dart';

class ShipmentCard extends StatelessWidget {
  final Shipment shipment;
  final Function refetchParent;

  ShipmentCard({this.shipment, this.refetchParent});

  @override
  Widget build(BuildContext context) {
    List definition = shipment.status.definition(shipment.offer);

    final String title = definition[0];
    final String subtitle = definition[1];
    final String svgIcon = definition[2];

    final bool isPointToPoint = shipment.stops.length == 2;
    final String mile = shipment.routeDistanceMiles.toStringAsFixed(1);
    final String boxIcon = shipment.status == ShipmentStatus.REJECTED_BY_SHIPPER
        ? "assets/svg/state/rejectedByShipper.svg"
        : "assets/svg/box.svg";
    final bool isDraft = shipment.status == ShipmentStatus.CREATED;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: () => navigateTo(
            context,
            (_) => isDraft
                ? EditShipment(id: shipment.id, uuid: shipment.uuid)
                : ViewShipmentPage(
                    shipment.uuid,
                    refetchParent: refetchParent,
                  )),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Table(
                columnWidths: {
                  0: const FixedColumnWidth(84),
                  1: const FlexColumnWidth(1.0),
                },
                children: [
                  TableRow(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Stack(
                        children: [
                          SvgPicture.asset(boxIcon, width: 62),
                          Positioned(
                            right: 2,
                            bottom: 4,
                            child: Container(
                              height: 24,
                              width: 24,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(appPrimaryColorValue),
                              ),
                              child: SvgPicture.asset(
                                  'assets/svg/state/$svgIcon.svg',
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6),
                        if (subtitle != null)
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9BA9C6),
                            ),
                          ),
                        SizedBox(height: 8),
                        ShipmentStepper(shipment.status),
                      ],
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Id:',
                          style: TextStyle(
                              color: Color(0xff9BA9C6),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                      child: Text(
                        "#" + shipment.shortName,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Text('Type :',
                        style: TextStyle(
                            color: Color(0xff9BA9C6),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        isPointToPoint ? 'Point-to-Point' : 'Multiple Point',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Text('Miles :',
                        style: TextStyle(
                            color: Color(0xff9BA9C6),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "$mile mile",
                        // plural(shipment.routeDistanceMiles?.toInt()
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Text('Duration: ',
                              style: TextStyle(
                                  color: Color(0xff9BA9C6),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        convertMintoDay(
                                  shipment.routeDurationMinutes
                                      ?.toStringAsFixed(0),
                                ) ==
                                ''
                            ? '0 minute'
                            : convertMintoDay(
                                shipment.routeDurationMinutes
                                    .toStringAsFixed(0),
                              ),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Text('Pickup :',
                        style: TextStyle(
                            color: Color(0xff9BA9C6),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    Text(shipment.pickupFormatted(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Dropoff :',
                          style: TextStyle(
                              color: Color(0xff9BA9C6),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(shipment.dropOffFormatted(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
