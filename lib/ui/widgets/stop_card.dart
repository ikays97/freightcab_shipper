import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freightcab_shipper/constants/enums/appointment_type.dart';
import 'package:freightcab_shipper/constants/enums/stop_type.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/models/stopPoint.dart';
import 'package:freightcab_shipper/ui/shared/icons.dart';
import 'package:freightcab_shipper/ui/views/edit_facility.dart';
import 'package:freightcab_shipper/viewmodels/create_shipment.dart';
import 'package:provider/provider.dart';

import 'roundedInputBorder.dart';

class StopCard extends StatefulWidget {
  const StopCard({
    Key key,
    @required this.point,
    @required this.label,
    @required this.locations,
    this.isDraggaable = false,
    this.childIndex,
    this.onRemoveTap,
  }) : super(key: key);

  final String label;
  final List<UserLocations$Query$ShipperLocationProfiles$Data> locations;
  final isDraggaable;
  final StopPoint point;
  final int childIndex;
  final void Function() onRemoveTap;

  @override
  _StopCardState createState() => _StopCardState();
}

class _StopCardState extends State<StopCard> {
  TextEditingController _dateController1;
  TextEditingController _dateController2;
  String locationName;

  @override
  void initState() {
    super.initState();
    _dateController1 = TextEditingController(text: DateTime.now().toString());
    _dateController2 = TextEditingController(text: DateTime.now().toString());
    _getValue();
  }

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      widget.point.startTime = DateTime.tryParse(_dateController1.text);
      widget.point.endTime = DateTime.tryParse(_dateController2.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CreateShipmentProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              if (widget.isDraggaable)
                ReorderableDragStartListener(
                  index: widget.childIndex,
                  child: SvgIcons.mPoints,
                ),
              if (widget.isDraggaable) const SizedBox(width: 8),
              Text(
                widget.label ?? 'Stop Location - ${widget.childIndex}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              if (widget.isDraggaable)
                GestureDetector(
                  onTap: widget.onRemoveTap,
                  child: SvgPicture.asset(
                    'assets/svg/trash.svg',
                    color: Colors.black,
                  ),
                ),
            ]),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: widget.point.location?.id,
              isExpanded: true,
              decoration: InputDecoration(
                hintText: "Select Location",
                contentPadding: const EdgeInsets.only(left: 12),
                border: const RoundedInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                prefixIcon: Icon(Icons.location_on, color: Colors.black),
              ),
              onChanged: (v) {
                setState(() {
                  widget.point.location = widget.locations.elementAt(
                    widget.locations.indexWhere((e) => e.id == v),
                  );
                });
                print(widget.point.location.id);
                bool boshYok = true;
                for (var stop in state.stopPoints) {
                  if (stop.location == null) boshYok = false;
                }
                if (boshYok) state.setEstimate = true;
              },
              items: List.generate(
                widget.locations.length,
                (index) {
                  final indexedLoc = widget.locations[index];
                  return DropdownMenuItem(
                    child: Text(
                      indexedLoc.address.city + ', ' + indexedLoc.address.state,
                    ),
                    value: indexedLoc.id,
                  );
                },
              ),
            ),
            if (widget.isDraggaable) const SizedBox(height: 8),
            if (widget.isDraggaable)
              if (widget.point.location != null)
                DropdownButtonFormField<StopType>(
                  value: widget.point.stopType,
                  onTap: () => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 12),
                    hintText: 'Select Stop Type',
                    border: const RoundedInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    prefixIcon: Icon(Icons.flag, color: Colors.black),
                  ),
                  onChanged: (v) {
                    setState(() {
                      widget.point.stopType = v;
                    });
                  },
                  items: StopType.values.map((e) {
                    return DropdownMenuItem(
                      child: Text(e.text),
                      value: e,
                    );
                  }).toList(),
                ),
            if (widget.point.location != null) const SizedBox(height: 8),
            if (widget.point.location != null)
              SizedBox(
                child: DropdownButtonFormField<AppointmentType>(
                    value: widget.point.appointmentType,
                    onTap: () => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 12),
                      hintText: "Choose Appointment Type",
                      border: const RoundedInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      prefixIcon: Icon(Icons.watch_later, color: Colors.black),
                    ),
                    onChanged: (v) {
                      setState(() {
                        widget.point.appointmentType = v;
                      });
                    },
                    items: AppointmentType.values.map((e) {
                      return DropdownMenuItem(child: Text(e.name), value: e);
                    }).toList()),
              ),
            const SizedBox(height: 8),
            if (widget.point.location != null)
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'dd/MM/yyyy',
                use24HourFormat: true,
                controller: _dateController1,
                firstDate: DateTime.now().subtract(Duration(days: 0)),
                lastDate: DateTime(2100),
                dateLabelText: 'Start time',
                timeLabelText: "Hour",
                onChanged: (v) {
                  setState(() {
                    widget.point.startTime = DateTime.tryParse(v);
                  });
                },
              ),
            if (widget.point.appointmentType == AppointmentTypesEnum.toBeMade)
              const SizedBox(height: 8),
            if (widget.point.appointmentType == AppointmentTypesEnum.toBeMade)
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'dd/MM/yyyy',
                controller: _dateController2,
                firstDate: DateTime.now().subtract(Duration(days: 0)),
                lastDate: DateTime(2100),
                dateLabelText: 'End time',
                timeLabelText: "Hour",
                onChanged: (v) {
                  setState(() {
                    widget.point.endTime = DateTime.tryParse(v);
                  });
                },
              ),
            if (widget.point.location != null) const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    return widget.point.location == null
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
                  'Edit Facility Info',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: widget.point.location == null
                    ? () {}
                    : () => buildEditDialog(widget.point.location),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  buildEditDialog(UserLocations$Query$ShipperLocationProfiles$Data location) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: EditFacilityCreateShipment(location: location),
        );
      },
    );
  }
}
