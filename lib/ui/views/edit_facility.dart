import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/widgets/expansiontiles.dart';
import 'package:freightcab_shipper/ui/widgets/text_fields.dart';
import 'package:freightcab_shipper/viewmodels/create_shipment.dart';
import 'package:provider/provider.dart';

class EditFacilityCreateShipment extends StatefulWidget {
  const EditFacilityCreateShipment({Key key, this.location})
      : super(
          key: key,
        );

  final UserLocations$Query$ShipperLocationProfiles$Data location;

  @override
  _EditFacilityCreateShipmentState createState() =>
      _EditFacilityCreateShipmentState();
}

class _EditFacilityCreateShipmentState
    extends State<EditFacilityCreateShipment> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  // ******* operational ******
  bool isOperationalChecked = false;
  TextEditingController opNameController;
  MaskedTextController opPhoneController;
  TextEditingController opEmailController;

  // ******* scheduling ******
  bool isSchedulingChecked = false;
  TextEditingController schNameController;
  MaskedTextController _schPhoneController;
  TextEditingController schEmailController;

  @override
  void initState() {
    super.initState();

    final state = Provider.of<CreateShipmentProvider>(context, listen: false);
    var indexOf = state.stopPoints.indexWhere(
      (e) => e.location.id == widget.location.id,
    );

    opNameController = TextEditingController(
      text:
          state.stopPoints[indexOf].location.operationalContact?.contactName ??
              widget.location.operationalContact?.contactName,
    );
    opPhoneController = MaskedTextController(
      text:
          state.stopPoints[indexOf].location.operationalContact?.phoneNumber ??
              widget.location.operationalContact?.phoneNumber,
      mask: '(000) 000-0000',
    );
    opEmailController = TextEditingController(
      text: state.stopPoints[indexOf].location.operationalContact?.email ??
          widget.location.operationalContact?.email,
    );
    schNameController = TextEditingController(
      text: state.stopPoints[indexOf].location.schedulingContact?.contactName ??
          widget.location.schedulingContact?.contactName,
    );
    _schPhoneController = MaskedTextController(
      text: state.stopPoints[indexOf].location.schedulingContact?.phoneNumber ??
          widget.location.schedulingContact?.phoneNumber,
      mask: '(000) 000-0000',
    );
    schEmailController = TextEditingController(
      text: state.stopPoints[indexOf].location.schedulingContact?.email ??
          widget.location.schedulingContact?.email,
    );
    //
    checkExpandable();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.location.schedulingContact?.contactName != " " ||
        widget.location.schedulingContact?.email != " " ||
        widget.location.schedulingContact?.phoneNumber != " ");
    return Container(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "Edit Facility Info",
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
                              decoration: InputDecoration(
                                hintText: 'Example: John',
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
                              controller: opPhoneController,
                              isValidate: false,
                              onChanged: (v) {
                                // if (erroropPhone != null) {
                                //   setState(() => erroropPhone = null);
                                // }
                              },
                              onSaved: (v) {
                                // setState(() {
                                //   operationalInfo.phoneNumber = v;
                                // });
                              },
                              // phoneError: erroropPhone,
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
                              controller: opEmailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'Example: help@soluchain.com',
                                // errorText: erroropEmail,
                              ),
                              // validator: validateEmail,
                              onChanged: (v) {
                                // if (erroropEmail != null) {
                                //   setState(() => erroropEmail = null);
                                // }
                              },
                              onSaved: (v) {
                                // setState(() {
                                //   operationalInfo.email = v;
                                // });
                              },
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
                            controller: schNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Example: John',
                              // errorText: errorschName,
                            ),
                            // validator: validateFirstName,
                            onChanged: (v) {
                              // if (errorschName != null) {
                              //   setState(() => errorschName = null);
                              // }
                            },
                            onSaved: (v) {
                              // setState(() {
                              //   schedulingInfo.contactName = v;
                              // });
                            },
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
                            controller: _schPhoneController,
                            isValidate: false,
                            onChanged: (v) {
                              // if (errorschPhone != null) {
                              //   setState(() => errorschPhone = null);
                              // }
                            },
                            onSaved: (v) {
                              // setState(() {
                              //   schedulingInfo.phoneNumber = v;
                              // });
                            },
                            // phoneError: errorschPhone,
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
                            controller: schEmailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Example: help@soluchain.com',
                              // errorText: errorschEmail,
                            ),
                            // validator: validateEmail,
                            onChanged: (v) {
                              // if (errorschEmail != null) {
                              //   setState(() => errorschEmail = null);
                              // }
                            },
                            onSaved: (v) {
                              // setState(() {
                              //   schedulingInfo.email = v;
                              // });
                            },
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
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Cancel',
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
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onSave,
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 150),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.resolveWith<EdgeInsets>(
                            (states) {
                              return EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              );
                            },
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
      if (widget.location.operationalContact.contactName.isNotEmpty ||
          widget.location.operationalContact.email.isNotEmpty ||
          widget.location.operationalContact.phoneNumber.isNotEmpty)
        setState(() {
          isOperationalChecked = true;
        });
    }

    if (widget.location.schedulingContact?.contactName != null ||
        widget.location.schedulingContact?.email != null ||
        widget.location.schedulingContact?.phoneNumber != null) {
      if (widget.location.schedulingContact.contactName.isNotEmpty ||
          widget.location.schedulingContact.email.isNotEmpty ||
          widget.location.schedulingContact.phoneNumber.isNotEmpty) {
        setState(() {
          isSchedulingChecked = true;
        });
      }
    }
  }

  onSave() {
    final state = Provider.of<CreateShipmentProvider>(context, listen: false);
    var indexOf = state.stopPoints.indexWhere(
      (e) => e.location.id == widget.location.id,
    );
    setState(() {
      state.stopPoints[indexOf].location.operationalContact.contactName =
          opNameController.text;
      state.stopPoints[indexOf].location.operationalContact.phoneNumber =
          opPhoneController.text;
      state.stopPoints[indexOf].location.operationalContact.email =
          opEmailController.text;
      state.stopPoints[indexOf].location.schedulingContact.contactName =
          schNameController.text;
      state.stopPoints[indexOf].location.schedulingContact.phoneNumber =
          _schPhoneController.text;
      state.stopPoints[indexOf].location.schedulingContact.email =
          schEmailController.text;
    });
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
