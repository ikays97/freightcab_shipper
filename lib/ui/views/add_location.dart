import 'dart:async';
import 'dart:convert';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/models/place.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/expansiontiles.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/ui/widgets/text_fields.dart';
import 'package:freightcab_shipper/ui/widgets/validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'home.dart';

class AddLocationPage extends StatefulWidget {
  @override
  _AddLocationPageState createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  final apiKey = "AIzaSyDyTmeFXw83O3hC1zjETWI9ZQaYMknjmfM";
  List<LatLng> locations = [];

  // Markers to show points on the map
  Map<MarkerId, Marker> markers = {};

  static final LatLng _kMapCenter = LatLng(47.751076, -120.740135);

  //
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var uuid = Uuid();
  String sessionToken; // TODO:

  List<Suggestion> suggestions = [];
  Suggestion selectedSuggestion;
  //
  TextEditingController locationNameController = TextEditingController();
  String savedlocationName;
  String locationNameError;

  TextEditingController addressController = TextEditingController();
  String savedAddress;
  String addressError;

  TextEditingController cityController = TextEditingController();
  String savedcity;
  String cityError;

  TextEditingController stateController = TextEditingController();
  String savedstate;
  String stateError;

  TextEditingController streetController = TextEditingController();
  String savedstreet;
  String streetError;

  TextEditingController streetNumberController = TextEditingController();
  String savedstreetNumber;
  String streetNumberError;

  TextEditingController latitudeController = TextEditingController();
  String savedLatitude;
  String latitudeError;

  TextEditingController longitudeController = TextEditingController();
  String savedLongitude;
  String longitudeError;

  // ******* operational ******
  bool isOperationalChecked = false;
  TextEditingController opNameController = TextEditingController();
  String savedopName;
  String erroropName;

  final _opPhoneController = MaskedTextController(mask: '(000) 000-0000');
  String savedopPhone;
  String erroropPhone;

  TextEditingController opEmailController = TextEditingController();
  String savedopEmail;
  String erroropEmail;

  // ******* scheduling ******
  bool isSchedulingChecked = false;
  TextEditingController schNameController = TextEditingController();
  String savedschName;
  String errorschName;

  final _schPhoneController = MaskedTextController(mask: '(000) 000-0000');
  String savedschPhone;
  String errorschPhone;

  TextEditingController schEmailController = TextEditingController();
  String savedschEmail;
  String errorschEmail;

  void onAdded() {
    //TODO:
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (route) => false,
    );
  }

  void onSubmitTap(RunMutation runMutation) {
    // TODO check connectivity before pressing the button
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
        AddLocationArguments(
          input: CreateLocationProfileInput(
            locationName: savedlocationName,
            address: AddressInput(
              full: savedAddress,
              city: savedcity,
              state: savedstate,
              street: savedstreet,
              streetNumber: intParse(savedstreetNumber) /*TODO: parse*/,
            ),
            coordinates: CoordinatesInput(
              lat: double.tryParse(savedLatitude) /*TODO: parse*/,
              lng: double.tryParse(savedLongitude), /*TODO: parse*/
            ),
            operationalContact: ContactInput(
              contactName: savedopName,
              email: savedopEmail,
              phoneNumber: savedopPhone,
            ),
            //TODO:
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

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(
          document: AddLocationMutation().document,
          onCompleted: (dynamic resultData) {
            print('added result');
            print(resultData);
            if (resultData != null) {
              print(resultData.toString());
              onAdded();
            }
          },
          onError: (e) {
            print('add location error');
            print(e);
            if (e.linkException != null) {
              showSnackbar(
                  context,
                  'Something went wrong, please check your network connection and try again.',
                  false);
              return;
            }

            final validationErrors = findValidationErrors(
              e.graphqlErrors,
              [
                'location_name',
                'adress',
                'coordinates',
                'operational_contact',
                'scheduling_contact',
                'notes',
              ],
            );

            if (validationErrors.isNotEmpty) {
              setState(() {
                locationNameError = validationErrors['location_name'];
                addressError = validationErrors['full'];
                // emailError = validationErrors['email'];
                // phoneError = validationErrors['phone'];
              });
              //TODO text
              showSnackbar(context, 'Please check entered fields', false);
            } else if (e.graphqlErrors.isNotEmpty) {
              //TODO error message uppercase ('user not found')

              print('error message');
              print(e.graphqlErrors[0].message);

              showSnackbar(context,
                  e.graphqlErrors[0].message ?? 'Something went wrong', false);
            } else {
              showSnackbar(context, 'Something went wrong', false);
            }
          },
        ),
        builder: (runMutation, result) {
          isLoading = result.isLoading;
          return Container(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Add Location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      height: 210,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: _kMapCenter,
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
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 14),
                          Text(
                            "Location name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: locationNameController,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Example: Location Name",
                              errorText: locationNameError,
                            ),
                            validator: validateLocationName,
                            onChanged: (v) {
                              if (locationNameError != null) {
                                setState(() => locationNameError = null);
                              }
                            },
                            onSaved: (v) => savedlocationName = v,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            "Address",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: addressController,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Example: Selanic Station",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              errorText: addressError,
                            ),
                            onChanged: (v) {
                              setState(() {
                                selectedSuggestion = null;
                              });
                            },
                            validator: validateAddress,
                            onSaved: (v) => savedAddress = v,
                          ),
                          if (selectedSuggestion == null)
                            Container(
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: suggestions.length,
                                  itemBuilder: (context, i) {
                                    return InkWell(
                                      onTap: () {
                                        hideKeyboard();
                                        setState(() {
                                          selectedSuggestion = suggestions[i];
                                          addressController.text =
                                              selectedSuggestion.description;
                                        });
                                        getPlaceDetailFromId(
                                            selectedSuggestion.placeId);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              size: 20,
                                              color: Colors.black54,
                                            ),
                                            SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                suggestions[i].description,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          const SizedBox(height: 14),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "City",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      controller: cityController,
                                      keyboardType: TextInputType.name,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        errorText: cityError,
                                      ),
                                      validator: validateCity,
                                      onChanged: (v) {
                                        if (cityError != null) {
                                          setState(() => cityError = null);
                                        }
                                      },
                                      onSaved: (v) => savedcity = v,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "State",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: stateController,
                                    keyboardType: TextInputType.name,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      errorText: stateError,
                                    ),
                                    validator: validateState,
                                    onChanged: (v) {
                                      if (stateError != null) {
                                        setState(() => stateError = null);
                                      }
                                    },
                                    onSaved: (v) => savedstate = v,
                                  ),
                                ],
                              ))
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Street",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: streetController,
                                    keyboardType: TextInputType.name,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      errorText: streetError,
                                    ),
                                    validator: validateStreet,
                                    onChanged: (v) {
                                      if (streetError != null) {
                                        setState(() => streetError = null);
                                      }
                                    },
                                    onSaved: (v) => savedstreet = v,
                                  ),
                                ],
                              )),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Street number",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: streetNumberController,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      errorText: streetNumberError,
                                    ),
                                    validator: validateStreetNo,
                                    onChanged: (v) {
                                      if (streetNumberError != null) {
                                        setState(
                                            () => streetNumberError = null);
                                      }
                                    },
                                    onSaved: (v) => savedstreetNumber = v,
                                  ),
                                ],
                              ))
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Latitude",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: latitudeController,
                                    keyboardType: TextInputType.name,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (v) {
                                      if (latitudeError != null) {
                                        setState(() => latitudeError = null);
                                      }
                                    },
                                    onSaved: (v) => savedLatitude = v,
                                  ),
                                ],
                              )),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Longitude",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: longitudeController,
                                    keyboardType: TextInputType.name,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (v) {
                                      if (longitudeError != null) {
                                        setState(() => longitudeError = null);
                                      }
                                    },
                                    onSaved: (v) => savedLongitude = v,
                                    inputFormatters: [],
                                  ),
                                ],
                              )),
                            ],
                          ),
                          const SizedBox(height: 14),
                          // TODO: collapse and expand on check
                          // operational contact
                          // scheduling contact info
                          // buttons
                          SizedBox(
                            width: double.infinity,
                            child: MyExpansionTile(
                              onExpansionChanged: (bool v) {
                                setState(() {
                                  isOperationalChecked = !isOperationalChecked;
                                });
                              },
                              childrenPadding: EdgeInsets.zero,
                              expandedAlignment: Alignment.topLeft,
                              title: Text('Operational Contact Info',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
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
                                  textCapitalization: TextCapitalization.words,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    errorText: erroropName,
                                  ),
                                  validator: validateFirstName,
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
                                    errorText: erroropEmail,
                                  ),
                                  validator: validateEmail,
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
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: MyExpansionTile(
                              onExpansionChanged: (bool v) {
                                setState(() {
                                  isSchedulingChecked = !isSchedulingChecked;
                                });
                              },
                              childrenPadding: EdgeInsets.zero,
                              expandedAlignment: Alignment.topLeft,
                              title: Text('Scheduling Contact Info',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
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
                                  textCapitalization: TextCapitalization.words,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    errorText: errorschName,
                                  ),
                                  validator: validateFirstName,
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
                                    errorText: errorschEmail,
                                  ),
                                  validator: validateEmail,
                                  onChanged: (v) {
                                    if (errorschEmail != null) {
                                      setState(() => errorschEmail = null);
                                    }
                                  },
                                  onSaved: (v) => savedschEmail = v,
                                ),
                                const SizedBox(height: 14),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
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
                                              child:
                                                  const ProgressIndicatorSmall())
                                          : Text(
                                              'Save',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                    ),
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty
                                          .resolveWith<EdgeInsets>((states) {
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    addressController.addListener(() {
      addressListener();
    });
  }

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
    locationNameController.dispose();
    cityController.dispose();
    stateController.dispose();
    streetController.dispose();
    streetNumberController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
  }

  fetchSuggestions(String input) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=en&components=country:us&key=$apiKey&sessiontoken=$sessionToken';
    if (input.length >= 1) {
      var response = await http.get(request);

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'OK') {
          setState(() {
            suggestions = result['predictions']
                .map<Suggestion>(
                  (p) => Suggestion(
                    p['place_id'],
                    p['description'],
                  ),
                )
                .toList();
          });
        }
        throw Exception(result['error_message']);
      } else {
        throw Exception('Failed to fetch suggestion');
      }
    }
  }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1) y1 = latLng.longitude;
        if (latLng.longitude < y0) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(northeast: LatLng(x1, y1), southwest: LatLng(x0, y0));
  }

  void getPlaceDetailFromId(String placeId) async {
    final GoogleMapController controller = await _controller.future;
    final request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry,address_component&key=$apiKey&sessiontoken=$sessionToken';
    var response = await http.get(request);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        final components =
            result['result']['address_components'] as List<dynamic>;
        latitudeController.text =
            result['result']['geometry']['location']['lat'].toString();

        longitudeController.text =
            result['result']['geometry']['location']['lng'].toString();

        var lat = double.tryParse(latitudeController.text);
        var lng = double.tryParse(longitudeController.text);

        setState(
          () {
            Future.delayed(
              Duration(milliseconds: 150),
              () => controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(lat, lng),
                    zoom: 14.4746,
                  ),
                ),
              ),
            );
            _addMarker(
              LatLng(lat, lng),
              "selectedLocation",
              BitmapDescriptor.defaultMarker,
            );
          },
        );

        components.forEach((c) {
          final List type = c['types'];
          if (type.contains('street_number')) {
            setState(() {
              streetNumberController.text = c['long_name'];
            });
          }
          if (type.contains('route')) {
            setState(() {
              streetController.text = c['long_name'];
            });
          }
          if (type.contains('administrative_area_level_2')) {
            setState(() {
              cityController.text = c['long_name'];
            });
          }
          if (type.contains('administrative_area_level_1')) {
            setState(() {
              stateController.text = c['long_name'];
            });
          }
        });
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  // This method will add markers to the map based on the LatLng position
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: descriptor,
      position: position,
    );
    markers[markerId] = marker;
  }

  addressListener() {
    if (sessionToken == null) {
      setState(() {
        sessionToken = uuid.v4();
      });
    }
    fetchSuggestions(addressController.text);
  }
}
