import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/widgets/expansiontiles.dart';
import 'package:freightcab_shipper/ui/widgets/text_fields.dart';

class ViewFacilityCreateShipment extends StatefulWidget {
  const ViewFacilityCreateShipment({
    Key key,
    @required this.location,
  }) : super(key: key);

  final UserShipment$Query$UserShipment$Stops$LocationProfile location;

  @override
  _ViewFacilityCreateShipmentState createState() =>
      _ViewFacilityCreateShipmentState();
}

class _ViewFacilityCreateShipmentState
    extends State<ViewFacilityCreateShipment> {
  bool isLoading = false;

  // ******* operational ******
  bool isOperationalChecked = false;
  TextEditingController opNameController;
  MaskedTextController _opPhoneController;
  TextEditingController opEmailController;

  // ******* scheduling ******
  bool isSchedulingChecked = false;
  TextEditingController schNameController;
  MaskedTextController _schPhoneController;
  TextEditingController schEmailController;

  @override
  void initState() {
    super.initState();
    //
    opNameController = TextEditingController(
      text: widget.location.operationalContact?.contactName,
    );
    _opPhoneController = MaskedTextController(
      text: widget.location.operationalContact?.phoneNumber,
      mask: '(000) 000-0000',
    );
    opEmailController = TextEditingController(
      text: widget.location.operationalContact?.email,
    );
    schNameController = TextEditingController(
      text: widget.location.schedulingContact?.contactName,
    );
    _schPhoneController = MaskedTextController(
      text: widget.location.schedulingContact?.phoneNumber,
      mask: '(000) 000-0000',
    );
    schEmailController = TextEditingController(
      text: widget.location.schedulingContact?.email,
    );
    //
    checkExpandable();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "Edit Location",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                child: SizedBox(
                  width: double.infinity,
                  child: MyExpansionTile(
                    initiallyExpanded: isOperationalChecked,
                    onExpansionChanged: (bool v) {
                      setState(() {
                        isOperationalChecked = !isOperationalChecked;
                      });
                    },
                    childrenPadding: EdgeInsets.zero,
                    expandedAlignment: Alignment.topLeft,
                    title: Text('Operational Contact Info',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: opNameController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'Example: John',
                                // errorText: ,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              "Phone",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            MyPhoneTextField(
                              enabled: false,
                              controller: _opPhoneController,
                              isValidate: false,
                            ),
                            const SizedBox(height: 14),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              enabled: false,
                              controller: opEmailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'Example: help@soluchain.com',
                                // errorText: erroropEmail,
                              ),
                              // validator: validateEmail,
                            ),
                            const SizedBox(height: 14),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: MyExpansionTile(
                  initiallyExpanded: isSchedulingChecked,
                  onExpansionChanged: (bool v) {
                    setState(() {
                      isSchedulingChecked = !isSchedulingChecked;
                    });
                  },
                  childrenPadding: EdgeInsets.zero,
                  expandedAlignment: Alignment.topLeft,
                  title: Text('Scheduling Contact Info',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            enabled: false,
                            controller: schNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Example: John',
                              // errorText: errorschName,
                            ),
                            // validator: validateFirstName,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            "Phone",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          MyPhoneTextField(
                            enabled: false,
                            controller: _schPhoneController,
                            isValidate: false,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            enabled: false,
                            controller: schEmailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Example: help@soluchain.com',
                              // errorText: errorschEmail,
                            ),
                            // validator: validateEmail,
                          ),
                          const SizedBox(height: 14)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkExpandable() {
    if (widget.location.operationalContact?.contactName != null ||
        widget.location.operationalContact?.email != null ||
        widget.location.operationalContact?.phoneNumber != null) {
      isOperationalChecked = true;
    }
    if (widget.location.schedulingContact?.contactName != null ||
        widget.location.schedulingContact?.phoneNumber != null ||
        widget.location.schedulingContact?.email != null) {
      isSchedulingChecked = true;
    }
  }

  @override
  void dispose() {
    // operationalInfo.contactName = opNameController.text;
    // operationalInfo.phoneNumber = _opPhoneController.text;
    // operationalInfo.email = opEmailController.text;

    // schedulingInfo.contactName = schNameController.text;
    // schedulingInfo.phoneNumber = _schPhoneController.text;
    // schedulingInfo.email = schEmailController.text;
    super.dispose();
  }
}
