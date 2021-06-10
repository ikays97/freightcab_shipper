import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/views/view_facility.dart';

import 'roundedInputBorder.dart';

class StopCard2 extends StatefulWidget {
  const StopCard2({
    Key key,
    @required this.point,
    @required this.label,
    this.childIndex,
  }) : super(key: key);

  final String label;
  final UserShipment$Query$UserShipment$Stops point;
  final int childIndex;

  @override
  _StopCard2State createState() => _StopCard2State();
}

class _StopCard2State extends State<StopCard2> {
  TextEditingController _dateController1;
  TextEditingController _dateController2;
  ContactInput operationalInfo;
  ContactInput schedulingInfo;

  @override
  void initState() {
    super.initState();
    _dateController1 = TextEditingController(text: widget.point.startTime);
    _dateController2 = TextEditingController(text: widget.point.endTime);
    // operationalInfo = widget.point.operationsInput;
    // schedulingInfo = widget.point.schedulingInput;
  }

  @override
  Widget build(BuildContext context) {
    var city = widget.point.locationProfile.address.city +
        ', ' +
        getFirstLetters(widget.point.locationProfile.address.state);
    AppointmentTypesEnum appointmentType = widget.point.appointmentType;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 20, left: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label ?? 'Stop Location - ${widget.childIndex}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              iconSize: 0,
              hint: Text(city),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 12),
                border: const RoundedInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              items: null,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField(
              hint: Text(
                appointmentType.toString(), //getText,
                maxLines: 1,
              ),
              iconSize: 0,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 12),
                border: const RoundedInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                prefixIcon:
                    Icon(Icons.watch_later, color: Colors.black, size: 18),
              ),
              items: null,
            ),
            const SizedBox(height: 8),
            DateTimePicker(
              type: DateTimePickerType.dateTimeSeparate,
              dateMask: 'dd/MM/yyyy',
              controller: _dateController1,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Start time',
              timeLabelText: "Hour",
              enabled: false,
              use24HourFormat: false,
            ),
            if (widget.point.appointmentType == AppointmentTypesEnum.toBeMade)
              const SizedBox(height: 8),
            if (widget.point.appointmentType == AppointmentTypesEnum.toBeMade)
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'dd/MM/yyyy',
                controller: _dateController2,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'End time',
                timeLabelText: "Hour",
                enabled: false,
                use24HourFormat: false,
              ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    return widget.point.locationProfile == null
                        ? Color(0xff0F57FB).withOpacity(0.6)
                        : Theme.of(context).accentColor;
                  }),
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                          (states) {
                    return EdgeInsets.symmetric(vertical: 14);
                  }),
                ),
                child: Text(
                  'View Facility Info',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: widget.point.locationProfile == null
                    ? () {}
                    : () => buildEditDialog(widget.point.locationProfile),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  buildEditDialog(
    UserShipment$Query$UserShipment$Stops$LocationProfile location,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 24.0,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ViewFacilityCreateShipment(
            location: location,
          ),
        );
      },
    );
  }
}
