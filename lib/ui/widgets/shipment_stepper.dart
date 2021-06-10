import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:freightcab_shipper/constants/enums/shipment_status.dart';
import 'package:freightcab_shipper/ui/shared/options.dart';

class ShipmentStepper extends StatelessWidget {
  final ShipmentStatus shipmentStatus;

  const ShipmentStepper(
    this.shipmentStatus, {
    Key key,
  }) : super(key: key);

  Widget dot() {
    return Icon(
      Icons.circle,
      size: 12,
      color: Color(0xff49BA9C6),
    );
  }

  Widget blueDot() {
    return Icon(
      Icons.circle,
      size: 12,
      color: Color(appPrimaryColorValue),
    );
  }

  Widget activeDot() {
    return CircleAvatar(
      child: Icon(
        Icons.check,
        size: 12,
      ),
      radius: 8,
    );
  }

  Widget line() {
    return FDottedLine(
      color: Color(0xff49BA9C6),
      width: 50,
      strokeWidth: 1,
      dottedLength: 4,
      space: 2,
    );
  }

  Widget blueLine() {
    return FDottedLine(
      color: Color(appPrimaryColorValue),
      height: 1,
      width: 50,
      strokeWidth: 1,
      space: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget dot1 = dot();
    Widget dot2 = dot();
    Widget dot3 = dot();
    Widget dot4 = dot();

    Widget line1 = line();
    Widget line2 = line();
    Widget line3 = line();

    switch (shipmentStatus) {
      case ShipmentStatus.DRIVER_ASSIGNED:
        {
          dot1 = blueDot();
        }
        break;
      case ShipmentStatus.DISPATCHED:
        {
          dot1 = blueDot();
          line1 = blueLine();
        }
        break;
      case ShipmentStatus.AT_PICKUP:
        {
          dot1 = blueDot();
          line1 = blueLine();
          dot2 = blueDot();
        }
        break;
      case ShipmentStatus.IN_TRANSIT:
        {
          dot1 = blueDot();
          line1 = blueLine();
          dot2 = blueDot();
          line2 = blueLine();
        }
        break;
      case ShipmentStatus.AT_DELIVERY:
        {
          dot1 = blueDot();
          line1 = blueLine();
          dot2 = blueDot();
          line2 = blueLine();
          dot3 = blueDot();
        }
        break;
      case ShipmentStatus.DELIVERED:
        {
          dot1 = dot();
          line1 = line();
          dot2 = dot();
          line2 = line();
          dot3 = dot();
          line3 = line();
          dot4 = dot();
        }
        break;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        dot1,
        SizedBox(width: 3),
        line1,
        SizedBox(width: 3),
        dot2,
        SizedBox(width: 3),
        line2,
        SizedBox(width: 3),
        dot3,
        SizedBox(width: 3),
        line3,
        SizedBox(width: 3),
        dot4,
      ],
    );
  }
}
