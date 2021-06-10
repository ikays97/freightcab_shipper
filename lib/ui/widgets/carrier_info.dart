import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/carrier.dart';
import 'package:freightcab_shipper/models/shipment.dart';
import 'package:freightcab_shipper/ui/shared/options.dart';

class CarrierInformation extends StatelessWidget {
  final Shipment shipment;
  final Carrier carrier;
  final Function onSelected;

  const CarrierInformation({
    Key key,
    this.shipment,
    this.carrier,
    this.onSelected,
  }) : super(key: key);

  Widget _buildInfoContainer(String label, {bool isMc = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMc)
            Container(
              width: 60,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(appPrimaryColorValue),
              ),
              margin: const EdgeInsets.only(right: 5),
              child: Center(
                child: Text(
                  label.substring(0, 2),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 46,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey.shade400, width: 0.5),
              ),
              child: Text(isMc ? label.substring(3) : label),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _maskedPhoneController = MaskedTextController(mask: '(000) 000-0000');

    _maskedPhoneController.text = carrier.contact.phone;

    return Dialog(
      insetPadding: EdgeInsets.all(24),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Carrier Info',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
              Text('Firstname'),
              _buildInfoContainer(carrier.name),
              const SizedBox(height: 16),
              Text('MC/DOT'),
              _buildInfoContainer(carrier.mcDotNumber, isMc: true),
              const SizedBox(height: 16),
              Text('Phone'),
              _buildInfoContainer('+1 ' + _maskedPhoneController.text),
            ],
          ),
        ),
      ),
    );
  }
}


// Mutation(
//                             options: MutationOptions(
//                               document:
//                                   AssignCarrierToShipmentMutation().document,
//                               onCompleted: (dynamic result) {
//                                 if (result != null) {
//                                   Navigator.pop(context);
//                                   onSelected();
//                                 }
//                               },
//                               onError: (OperationException e) {
//                                 print(e);
//                                 Navigator.pop(context);
//                                 if (e.linkException != null) {
//                                   showSnackbar(
//                                       context,
//                                       'Something went wrong, please check your network connection and try again.',
//                                       true);
//                                 } else if (e.graphqlErrors.isNotEmpty) {
//                                   showSnackbar(
//                                       context,
//                                       e.graphqlErrors[0].message ??
//                                           'Something went wrong',
//                                       true);
//                                 } else {
//                                   showSnackbar(
//                                       context, 'Something went wrong', true);
//                                 }
//                               },
//                             ),
//                             builder:
//                                 (RunMutation runMutation, QueryResult result) {
//                               return AbsorbPointer(
//                                 absorbing: result.isLoading,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     runMutation(
//                                         AssignCarrierToShipmentArguments(
//                                       carrier_id: carrier.id.toString(),
//                                       uuid: shipment.uuid,
//                                     ).toJson());
//                                   },
//                                   child: AnimatedSwitcher(
//                                     duration: Duration(milliseconds: 150),
//                                     child: result.isLoading
//                                         ? Theme(
//                                             data: Theme.of(context).copyWith(
//                                                 accentColor: Colors.white),
//                                             child:
//                                                 const ProgressIndicatorSmall(),
//                                           )
//                                         : Text('Select',
//                                             style: TextStyle(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w700)),
//                                   ),
//                                   style: ElevatedButton.styleFrom(
//                                     padding: EdgeInsets.symmetric(
//                                         vertical: 12, horizontal: 16),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),