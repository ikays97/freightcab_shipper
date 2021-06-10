import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/stop_location_profile.dart';

class FacilityInformation extends StatelessWidget {
  final StopLocationProfile locationProfile;

  const FacilityInformation(
    this.locationProfile, {
    Key key,
  }) : super(key: key);

  Widget _buildInfoContainer(String label) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 4, bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade400, width: 0.5),
      ),
      child: Text(label, style: TextStyle(fontSize: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _maskedOperationalPhoneController =
        MaskedTextController(mask: '(000) 000-0000');
    var _maskedSchedulingPhoneController =
        MaskedTextController(mask: '(000) 000-0000');

    _maskedOperationalPhoneController.text =
        locationProfile.operationalContact.phoneNumber;
    _maskedSchedulingPhoneController.text =
        locationProfile.schedulingContact.phoneNumber;

    return Dialog(
      insetPadding: EdgeInsets.all(24),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Facility information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Icon(
                      Icons.cancel_outlined,
                      color: const Color(0xFF727272),
                    ),
                    onTap: () => Navigator.pop(context),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text('Operations contact info',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 12),
              Text('Name'),
              _buildInfoContainer(locationProfile.operationalContact.name),
              Text('Phone'),
              _buildInfoContainer(
                  '+1 ' + _maskedOperationalPhoneController.text),
              Text('Email'),
              _buildInfoContainer(locationProfile.operationalContact.email),
              SizedBox(height: 20),
              Text('Scheduling contact info',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 12),
              Text('Name'),
              _buildInfoContainer(locationProfile.schedulingContact.name),
              Text('Phone'),
              _buildInfoContainer(
                  '+1 ' + _maskedSchedulingPhoneController.text),
              Text('Email'),
              _buildInfoContainer(locationProfile.schedulingContact.email),
            ],
          ),
        ),
      ),
    );
  }
}
