import 'dart:async';

import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/expansiontiles.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/ui/widgets/text_fields.dart';
import 'package:freightcab_shipper/ui/widgets/validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'home.dart';

class EditFacilityPage extends StatefulWidget {
  final UserLocations$Query$ShipperLocationProfiles$Data location;

  const EditFacilityPage({
    Key key,
    @required this.location,
  }) : super(key: key);

  @override
  _EditFacilityPageState createState() => _EditFacilityPageState();
}

class _EditFacilityPageState extends State<EditFacilityPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  final apiKey = "AIzaSyDyTmeFXw83O3hC1zjETWI9ZQaYMknjmfM";
  List<LatLng> locations = [];

  // Markers to show points on the map
  Map<MarkerId, Marker> markers = {};

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  // location name
  TextEditingController locationNameController;
  String savedlocationName;
  String locationNameError;

  // ******* operational ******
  bool isOperationalChecked = false;
  TextEditingController opNameController;
  String savedopName;
  String erroropName;

  MaskedTextController _opPhoneController;
  String savedopPhone;
  String erroropPhone;

  TextEditingController opEmailController;
  String savedopEmail;
  String erroropEmail;

  // ******* scheduling ******
  bool isSchedulingChecked = false;
  TextEditingController schNameController;
  String savedschName;
  String errorschName;

  MaskedTextController _schPhoneController;
  String savedschPhone;
  String errorschPhone;

  TextEditingController schEmailController;
  String savedschEmail;
  String errorschEmail;

  @override
  void initState() {
    super.initState();
    checkExpandable();

    // add marker
    _addMarker(
      LatLng(widget.location.coordinates.lat, widget.location.coordinates.lng),
      "editLocation",
      BitmapDescriptor.defaultMarker,
    );

    locationNameController =
        TextEditingController(text: widget.location.locationName);
    opNameController = TextEditingController(
        text: widget.location.operationalContact.contactName);
    _opPhoneController = MaskedTextController(
        text: widget.location.operationalContact.phoneNumber,
        mask: '(000) 000-0000');
    opEmailController =
        TextEditingController(text: widget.location.operationalContact.email);
    schNameController = TextEditingController(
        text: widget.location.schedulingContact.contactName);
    _schPhoneController = MaskedTextController(
        text: widget.location.schedulingContact.phoneNumber,
        // CPF mask +1 462 521 5234
        mask: '(000) 000-0000');
    schEmailController =
        TextEditingController(text: widget.location.schedulingContact.email);
  }

  void onEdited() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: EditLocationMutation().document,
        onCompleted: (dynamic resultData) {
          if (resultData != null) {
            onEdited();
          }
        },
        onError: (e) {
          // print(e);
          if (e.linkException != null) {
            print(e.linkException);
            showSnackbar(
                context,
                'Something went wrong, please check your network connection and try again.',
                false);
            return;
          }
          if (e.graphqlErrors.isNotEmpty) {
            e.graphqlErrors.forEach((err) {
              print(err);
            });
          }
        },
      ),
      builder: (runMutation, result) {
        isLoading = result.isLoading;
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
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
                        "Edit Location",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        controller: locationNameController,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Location Name",
                          hintText: 'Example: Selanic Station',
                          errorText: locationNameError,
                        ),
                        validator: validateCommon,
                        onChanged: (v) {
                          if (locationNameError != null) {
                            setState(() => locationNameError = null);
                          }
                        },
                        onSaved: (v) => savedlocationName = v,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            widget.location.coordinates.lat,
                            widget.location.coordinates.lng,
                          ),
                          zoom: 14.4746,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        markers: Set<Marker>.of(markers.values),
                        myLocationEnabled: false,
                        myLocationButtonEnabled: false,
                        zoomGesturesEnabled: true,
                        zoomControlsEnabled: true,
                      ),
                    ),
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
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
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
                                      errorText: erroropName,
                                    ),
                                    // validator: validateFirstName,
                                    onChanged: (v) {
                                      if (erroropName != null) {
                                        setState(() => erroropName = null);
                                      }
                                    },
                                    onSaved: (v) => savedopName = v,
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
                                    controller: _opPhoneController,
                                    isValidate: false,
                                    onChanged: (v) {
                                      if (erroropPhone != null) {
                                        setState(() => erroropPhone = null);
                                      }
                                    },
                                    onSaved: (v) => savedopPhone = v,
                                    phoneError: erroropPhone,
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
                                      errorText: erroropEmail,
                                    ),
                                    // validator: validateEmail,
                                    onChanged: (v) {
                                      if (erroropEmail != null) {
                                        setState(() => erroropEmail = null);
                                      }
                                    },
                                    onSaved: (v) => savedopEmail = v,
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
                                    errorText: errorschName,
                                  ),
                                  // validator: validateFirstName,
                                  onChanged: (v) {
                                    if (errorschName != null) {
                                      setState(() => errorschName = null);
                                    }
                                  },
                                  onSaved: (v) => savedschName = v,
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
                                    if (errorschPhone != null) {
                                      setState(() => errorschPhone = null);
                                    }
                                  },
                                  onSaved: (v) => savedschPhone = v,
                                  phoneError: errorschPhone,
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
                                    errorText: errorschEmail,
                                  ),
                                  // validator: validateEmail,
                                  onChanged: (v) {
                                    if (errorschEmail != null) {
                                      setState(() => errorschEmail = null);
                                    }
                                  },
                                  onSaved: (v) => savedschEmail = v,
                                ),
                                const SizedBox(height: 14)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
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
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: result.isLoading,
                              child: ElevatedButton(
                                onPressed: () => onSubmitTap(runMutation),
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 150),
                                  child: result.isLoading
                                      ? Theme(
                                          data: Theme.of(context).copyWith(
                                              accentColor: Colors.white),
                                          child: const ProgressIndicatorSmall(),
                                        )
                                      : Text(
                                          'Save',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                ),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.resolveWith<
                                      EdgeInsets>((states) {
                                    return EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 16,
                                    );
                                  }),
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
          ),
        );
      },
    );
  }

  onSubmitTap(RunMutation runMutation) {
    hideKeyboard();

    if (isLoading) {
      return;
    }

    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      setState(() {
        savedopPhone =
            savedopPhone != null ? getMaskedData(savedopPhone) : null;
        savedschPhone =
            savedschPhone != null ? getMaskedData(savedschPhone) : null;
      });
      runMutation(
        EditLocationArguments(
          id: widget.location.id,
          input: UpdateLocationProfileInput(
            locationName: savedlocationName,
            address: LocationInput.fromJson(widget.location.toJson()).address,
            coordinates:
                LocationInput.fromJson(widget.location.toJson()).coordinates,
            operationalContact: ContactInput(
              contactName: savedopName,
              email: savedopEmail,
              phoneNumber: savedopPhone,
            ),
            schedulingContact: ContactInput(
              contactName: savedschName,
              email: savedschEmail,
              phoneNumber: savedschPhone,
            ),
          ),
        ).toJson(),
      );
    }
  }

  // This method will add markers to the map based on the LatLng position
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
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
}
