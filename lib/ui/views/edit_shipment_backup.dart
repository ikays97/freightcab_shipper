import 'package:date_time_picker/date_time_picker.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freightcab_shipper/constants/enums/accessory.dart';
import 'package:freightcab_shipper/constants/enums/item_unit.dart';
import 'package:freightcab_shipper/constants/enums/piece_type.dart';
import 'package:freightcab_shipper/constants/enums/shipment_status.dart';
import 'package:freightcab_shipper/constants/enums/temperature_unit.dart';
import 'package:freightcab_shipper/constants/enums/stop_type.dart';
import 'package:freightcab_shipper/constants/enums/appointment_type.dart';
import 'package:freightcab_shipper/models/accessories.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/models/shipment.dart';
import 'package:freightcab_shipper/models/stop.dart';
import 'package:freightcab_shipper/models/stopPoint.dart';
import 'package:freightcab_shipper/models/stop_location_profile.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/shared/icons.dart';
import 'package:freightcab_shipper/ui/views/view_shipment.dart';
import 'package:freightcab_shipper/ui/widgets/expansiontiles.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/ui/widgets/labeled_check_box.dart';
import 'package:freightcab_shipper/ui/widgets/roundedInputBorder.dart';
import 'package:freightcab_shipper/ui/widgets/text_fields.dart';
import 'package:freightcab_shipper/ui/widgets/validators.dart';
import 'package:freightcab_shipper/viewmodels/create_shipment.dart';
import 'package:freightcab_shipper/viewmodels/edit_shipment.dart';
import 'package:freightcab_shipper/viewmodels/graphql_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'edit_facility.dart';
import 'footer.dart';

class EditShipment extends StatefulWidget {
  final int id;
  final String uuid;

  const EditShipment({Key key, @required this.id, @required this.uuid})
      : super(key: key);

  @override
  _EditShipmentState createState() => _EditShipmentState();
}

class _EditShipmentState extends State<EditShipment> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  // booleans
  bool isMultipleStops = false;
  bool isReefer = false;
  bool estimate = false;
  bool isLoading = false;
  String id;
  String uuid;

  TextEditingController maxController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController shortController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController packagingController = TextEditingController();
  TextEditingController loadDescController = TextEditingController();

  ShipmentStatus status;
  // String maxSaved = '';
  // String minSaved = '';
  // String descSaved = '';
  // String shortSaved = '';
  // String weightSaved = '';
  // String quantitySaved = '';
  // String packingSaved = '';
  // String loadDescSaved = '';
  // String opNameSaved = '';
  // String opPhoneSaved = '';
  // String opEmailSaved = '';
  // String schNameSaved = '';
  // String schPhoneSaved = '';
  // String schEmailSaved = '';

  // textfield errors
  String pageError;
  String maxError;
  String minError;
  String descError;
  String shortError;
  String weightError;
  String quantityError;
  String packingError;
  String loadDescError;
  String opNameError;
  String opPhoneError;
  String opEmailError;
  String schNameError;
  String schPhoneError;
  String schEmailError;

  // dropdown selected
  TemperatureUnit selectedTempType;
  ItemUnit selectedQuantityType;
  PieceType selectedPackageType;

  // stop points
  List<Stop> stopPoints = [];

  // distance info
  double distanceMile = 0.0;
  int transitionTime = 0;

  // accessories
  List<Accessories> accessoriesList = [];

  // locations
  List<StopLocationProfile> locationProfiles = [];

  @override
  void initState() {
    _fetchPage();
    super.initState();
  }

  Future<void> _fetchPage() async {
    final state = Provider.of<EditShipmentProvider>(context, listen: false);
    final result = await graphqlClient.query(
      QueryOptions(
        document: UserShipmentQuery().document,
        fetchPolicy: FetchPolicy.cacheAndNetwork,
        variables:
            UserShipmentArguments(uuid: widget.uuid, id: widget.id.toString())
                .toJson(),
      ),
    );

    if (result.hasException) {
      pageError = result.exception.toString();
    } else {
      Shipment shipment = Shipment(json: result.data["userShipment"]);
      state.setAll(shipment);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<EditShipmentProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 64.0,
        title: Text(
          "Edit shipment",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Query(
          options: WatchQueryOptions(
            document: UserLocationsQuery().document,
            fetchPolicy: FetchPolicy.networkOnly,
            fetchResults: true,
            variables: UserLocationsArguments(
              first: 10,
            ).toJson(),
          ),
          builder: (queryResult, {refetch, fetchMore}) {
            if (queryResult.hasException) {
              return GestureDetector(
                onTap: () => refetch(),
                child: Center(
                  child: Text('Something went wrong, tap to try again'),
                ),
              );
            }
            if (queryResult.isLoading && queryResult.data == null) {
              return Center(child: const CircularProgressIndicator());
            }

            final a = UserLocations$Query.fromJson(queryResult.data);
            final locations = a.shipperLocationProfiles.data;

            return Form(
              key: formKey,
              child: CustomScrollView(
                slivers: [
                  // section 1
                  SliverToBoxAdapter(child: Section1()),
                  // section 2
                  SliverToBoxAdapter(child: Section2()),
                  if (isMultipleStops)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12)),
                            icon: Icon(Icons.add_box_outlined),
                            label: Text('Add stop point'),
                            onPressed: () {
                              var state = Provider.of<EditShipmentProvider>(
                                  context,
                                  listen: false);
                              state.onAddStopPointTap();
                            },
                          ),
                        ),
                      ),
                    ),
                  if (state.isMultipleStops)
                    SliverToBoxAdapter(child: SizedBox(height: 16)),

                  Section3(locations: locations),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverToBoxAdapter(
                    child: Section4(formKey: formKey, uuid: widget.uuid),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 18)),
                  SliverToBoxAdapter(child: FooterSection()),
                  SliverToBoxAdapter(child: SizedBox(height: 18)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // buildSection1() {
  //   return Card(
  //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //     elevation: 0,
  //     child: Padding(
  //       padding: const EdgeInsets.all(16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'Select shipment type',
  //             style: TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(height: 8),
  //           Row(
  //             children: [
  //               Expanded(
  //                 child: GestureDetector(
  //                   onTap: () {
  //                     if (isMultipleStops) {
  //                       setState(() {
  //                         isMultipleStops = false;
  //                       });
  //                     }
  //                   },
  //                   child: AnimatedContainer(
  //                     duration: Duration(milliseconds: 120),
  //                     width: double.infinity,
  //                     padding:
  //                         EdgeInsets.symmetric(vertical: 12, horizontal: 8),
  //                     decoration: BoxDecoration(
  //                       border: isMultipleStops
  //                           ? Border.all(color: Color(0xffebebeb))
  //                           : null,
  //                       color: isMultipleStops
  //                           ? Color(0xfffafafa)
  //                           : Theme.of(context).colorScheme.primary,
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         SvgPicture.asset(
  //                           "assets/svg/p2p.svg",
  //                           color: isMultipleStops
  //                               ? Colors.black
  //                               : Theme.of(context).colorScheme.onPrimary,
  //                         ),
  //                         SizedBox(width: 8),
  //                         Text(
  //                           'Point to point',
  //                           style: TextStyle(
  //                             color: isMultipleStops
  //                                 ? Colors.black
  //                                 : Theme.of(context).colorScheme.onPrimary,
  //                             fontSize: 12,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(width: 16),
  //               Expanded(
  //                 child: GestureDetector(
  //                   onTap: () {
  //                     if (!isMultipleStops) {
  //                       setState(() {
  //                         isMultipleStops = true;
  //                       });
  //                     }
  //                   },
  //                   child: AnimatedContainer(
  //                     duration: Duration(milliseconds: 120),
  //                     width: double.infinity,
  //                     padding:
  //                         EdgeInsets.symmetric(vertical: 12, horizontal: 8),
  //                     decoration: BoxDecoration(
  //                       color: isMultipleStops
  //                           ? Theme.of(context).colorScheme.primary
  //                           : Color(0xfffafafa),
  //                       border: isMultipleStops
  //                           ? null
  //                           : Border.all(color: Color(0xffebebeb)),
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         //TODO icon
  //                         SvgPicture.asset(
  //                           "assets/svg/p2m.svg",
  //                           color: isMultipleStops
  //                               ? Theme.of(context).colorScheme.onPrimary
  //                               : Colors.black,
  //                         ),
  //                         SizedBox(width: 8),
  //                         Text(
  //                           'Multiple stops',
  //                           style: TextStyle(
  //                             color: isMultipleStops
  //                                 ? Theme.of(context).colorScheme.onPrimary
  //                                 : Colors.black,
  //                             fontSize: 12,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 16),
  //           Text(
  //             'Select truck type',
  //             style: TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(height: 8),
  //           Row(
  //             children: [
  //               Expanded(
  //                 child: GestureDetector(
  //                   onTap: () {
  //                     if (isReefer) {
  //                       setState(() {
  //                         isReefer = false;
  //                       });
  //                     }
  //                   },
  //                   child: AnimatedContainer(
  //                     duration: Duration(milliseconds: 120),
  //                     width: double.infinity,
  //                     padding:
  //                         EdgeInsets.symmetric(vertical: 12, horizontal: 8),
  //                     decoration: BoxDecoration(
  //                       border: isReefer
  //                           ? Border.all(color: Color(0xffebebeb))
  //                           : null,
  //                       color: isReefer
  //                           ? Color(0xfffafafa)
  //                           : Theme.of(context).colorScheme.primary,
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         SvgPicture.asset(
  //                           "assets/svg/truck.svg",
  //                           color: isReefer
  //                               ? Colors.black
  //                               : Theme.of(context).colorScheme.onPrimary,
  //                         ),
  //                         SizedBox(width: 8),
  //                         Text(
  //                           'Dry van',
  //                           style: TextStyle(
  //                             color: isReefer
  //                                 ? Colors.black
  //                                 : Theme.of(context).colorScheme.onPrimary,
  //                             fontSize: 12,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(width: 16),
  //               Expanded(
  //                 child: GestureDetector(
  //                   onTap: () {
  //                     if (!isReefer) {
  //                       setState(() {
  //                         isReefer = true;
  //                       });
  //                     }
  //                   },
  //                   child: AnimatedContainer(
  //                     duration: Duration(milliseconds: 120),
  //                     width: double.infinity,
  //                     padding:
  //                         EdgeInsets.symmetric(vertical: 12, horizontal: 8),
  //                     decoration: BoxDecoration(
  //                       color: isReefer
  //                           ? Theme.of(context).colorScheme.primary
  //                           : Color(0xfffafafa),
  //                       border: isReefer
  //                           ? null
  //                           : Border.all(color: Color(0xffebebeb)),
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         SvgPicture.asset("assets/svg/snowflake.svg",
  //                             color: isReefer
  //                                 ? Theme.of(context).colorScheme.onPrimary
  //                                 : Colors.black),
  //                         const SizedBox(width: 8),
  //                         Text(
  //                           'Reefer',
  //                           style: TextStyle(
  //                             color: isReefer
  //                                 ? Theme.of(context).colorScheme.onPrimary
  //                                 : Colors.black,
  //                             fontSize: 12,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           if (isReefer)
  //             Padding(
  //               padding: const EdgeInsets.only(top: 8),
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                     child: TextFormField(
  //                         controller: minController,
  //                         keyboardType: TextInputType.number,
  //                         textInputAction: TextInputAction.next,
  //                         decoration: InputDecoration(
  //                           contentPadding: const EdgeInsets.symmetric(
  //                             horizontal: 20,
  //                           ),
  //                           errorText: minError,
  //                           hintText: 'min',
  //                         ),
  //                         validator: validateMin,
  //                         onChanged: (v) {
  //                           if (minError != null) {
  //                             setState(() => minError = null);
  //                           }
  //                         }),
  //                   ),
  //                   Expanded(
  //                     child: TextFormField(
  //                       controller: maxController,
  //                       keyboardType: TextInputType.number,
  //                       textInputAction: TextInputAction.next,
  //                       decoration: InputDecoration(
  //                         contentPadding:
  //                             const EdgeInsets.symmetric(horizontal: 20),
  //                         errorText: maxError,
  //                         hintText: 'max',
  //                       ),
  //                       validator: validateCommon,
  //                       onChanged: (v) {
  //                         if (maxError != null) {
  //                           setState(() => maxError = null);
  //                         }
  //                       },
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: DropdownButtonFormField<TemperatureUnit>(
  //                       value: selectedTempType,
  //                       onChanged: (v) {
  //                         setState(() {
  //                           selectedTempType = v;
  //                         });
  //                       },
  //                       decoration: InputDecoration(
  //                         contentPadding:
  //                             const EdgeInsets.symmetric(horizontal: 20),
  //                       ),
  //                       items: TemperatureUnit.values.map((type) {
  //                         return DropdownMenuItem(
  //                           child: Text(type.text),
  //                           value: type,
  //                         );
  //                       }).toList(),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // buildSection2() {
  //   return Card(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //     elevation: 0,
  //     margin: EdgeInsets.symmetric(horizontal: 20),
  //     child: Padding(
  //       padding:
  //           const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text.rich(
  //             TextSpan(
  //               text: "Commodity Info",
  //               children: [
  //                 TextSpan(
  //                   text: '  (optional)',
  //                   style: TextStyle(
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.w400,
  //                   ),
  //                 )
  //               ],
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 6),
  //           TextFormField(
  //             controller: descController,
  //             keyboardType: TextInputType.name,
  //             textCapitalization: TextCapitalization.sentences,
  //             textInputAction: TextInputAction.next,
  //             decoration: InputDecoration(
  //               errorText: descError,
  //             ),
  //             onChanged: (v) {
  //               if (descError != null) {
  //                 setState(() {
  //                   descError = null;
  //                 });
  //               }
  //             },
  //           ),
  //           const SizedBox(height: 8),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                 flex: 2,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text.rich(TextSpan(
  //                       text: "Tracking ID",
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     )),
  //                     const SizedBox(height: 6),
  //                     TextFormField(
  //                       controller: shortController,
  //                       keyboardType: TextInputType.text,
  //                       textInputAction: TextInputAction.next,
  //                       decoration: InputDecoration(
  //                         errorText: shortError,
  //                       ),
  //                       onChanged: (v) {
  //                         if (shortError != null)
  //                           setState(() => shortError = null);
  //                       },
  //                       inputFormatters: [
  //                         UpperCaseTextFormatter(),
  //                         LengthLimitingTextInputFormatter(5)
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               const SizedBox(width: 10),
  //               Expanded(
  //                 flex: 3,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       "Weight",
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 6),
  //                     TextFormField(
  //                       controller: weightController,
  //                       keyboardType: TextInputType.number,
  //                       textInputAction: TextInputAction.next,
  //                       decoration: InputDecoration(
  //                         contentPadding:
  //                             const EdgeInsets.symmetric(horizontal: 20),
  //                         suffix: Text('LB'),
  //                         errorText: weightError,
  //                         hintText: '0',
  //                       ),
  //                       validator: validateWeight,
  //                       onChanged: (v) {
  //                         if (weightError != null)
  //                           setState(() => weightError = null);
  //                       },
  //                       inputFormatters: [LengthLimitingTextInputFormatter(5)],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 8),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 4),
  //             child: Text(
  //               "Item quantity",
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 6),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                 flex: 2,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     TextFormField(
  //                       controller: quantityController,
  //                       keyboardType: TextInputType.number,
  //                       textInputAction: TextInputAction.done,
  //                       decoration: InputDecoration(
  //                         errorText: quantityError,
  //                         contentPadding: const EdgeInsets.symmetric(
  //                           horizontal: 20,
  //                         ),
  //                       ),
  //                       onChanged: (v) {
  //                         if (quantityError != null)
  //                           setState(() => quantityError = null);
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               const SizedBox(width: 10),
  //               Expanded(
  //                   flex: 3,
  //                   child: Column(
  //                     children: [
  //                       DropdownButtonFormField<ItemUnit>(
  //                         isDense: true,
  //                         value: selectedQuantityType,
  //                         onChanged: (v) =>
  //                             setState(() => selectedQuantityType = v),
  //                         decoration: InputDecoration(
  //                           contentPadding: const EdgeInsets.symmetric(
  //                             horizontal: 20,
  //                           ),
  //                         ),
  //                         items: ItemUnit.values.map((e) {
  //                           return DropdownMenuItem(
  //                             child:
  //                                 Text(e.text, style: TextStyle(fontSize: 14)),
  //                             value: e,
  //                           );
  //                         }).toList(),
  //                       ),
  //                     ],
  //                   )),
  //             ],
  //           ),
  //           const SizedBox(height: 8),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 4),
  //             child: Text(
  //               "Item packaging",
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 6),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                 flex: 2,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     TextFormField(
  //                       controller: packagingController,
  //                       keyboardType: TextInputType.number,
  //                       textInputAction: TextInputAction.done,
  //                       decoration: InputDecoration(
  //                         errorText: packingError,
  //                         contentPadding: const EdgeInsets.symmetric(
  //                           horizontal: 20,
  //                         ),
  //                       ),
  //                       onChanged: (v) {
  //                         if (packingError != null)
  //                           setState(() => packingError = null);
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               const SizedBox(width: 10),
  //               Expanded(
  //                   flex: 3,
  //                   child: Column(
  //                     children: [
  //                       DropdownButtonFormField<PieceType>(
  //                         isDense: true,
  //                         value: selectedPackageType,
  //                         onChanged: (v) =>
  //                             setState(() => selectedPackageType = v),
  //                         decoration: InputDecoration(
  //                           contentPadding: const EdgeInsets.symmetric(
  //                             horizontal: 20,
  //                           ),
  //                         ),
  //                         items: PieceType.values.map((e) {
  //                           return DropdownMenuItem(
  //                             child: Text(e.text),
  //                             value: e,
  //                           );
  //                         }).toList(),
  //                       ),
  //                     ],
  //                   )),
  //             ],
  //           ),
  //           const SizedBox(height: 16),
  //           Text(
  //             "Accessories & credentials",
  //             style: TextStyle(
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: accessoriesList.map((e) {
  //               return LabeledCheckbox(
  //                 value: e.isChecked,
  //                 padding: const EdgeInsets.all(0),
  //                 onChanged: (bool v) {
  //                   setState(() {
  //                     e.isChecked = !e.isChecked;
  //                   });
  //                 },
  //                 label: Text(e.label),
  //               );
  //             }).toList(),
  //           ),
  //           Text(
  //             "Load Description",
  //             style: TextStyle(
  //               fontSize: 14,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //           const SizedBox(height: 8),
  //           TextFormField(
  //             controller: loadDescController,
  //             keyboardType: TextInputType.text,
  //             textCapitalization: TextCapitalization.sentences,
  //             textInputAction: TextInputAction.done,
  //             maxLines: 3,
  //             maxLength: 250,
  //             decoration: InputDecoration(
  //               contentPadding: const EdgeInsets.all(12),
  //               errorText: loadDescError,
  //             ),
  //             onChanged: (v) {
  //               if (loadDescError != null) setState(() => loadDescError = null);
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // buildSection3() {
  //   return SliverReorderableList(
  //     onReorder: (oldIndex, newIndex) {
  //       // setState(() {
  //       //   if (oldIndex < newIndex) {
  //       //     newIndex -= 1;
  //       //   }
  //       //   final item = locations.removeAt(oldIndex);
  //       //   var indexOf = stopPoints.indexWhere(
  //       //     (e) => e.location.id == item.id,
  //       //   );
  //       //   // onInsertStopPointTap(
  //       //   //   newIndex,
  //       //   //   stopPoints[indexOf],
  //       //   // );
  //       // });
  //     },
  //     itemCount: stopPoints.length,
  //     itemBuilder: (context, index) {
  //       return buildStopCard(
  //           key: ValueKey(index.toString()),
  //           stop: stopPoints[index],
  //           childIndex: index);
  //       // StopCard(
  //       //   key: ValueKey(index.toString()),
  //       //   label: stopPoints[index].label,
  //       //   locations: locations,
  //       //   point: stopPoints[index],
  //       //   isDraggaable: index != 0 && index != stopPoints.length - 1,
  //       //   childIndex: index,
  //       //   onRemoveTap: () => onRemoveTap(index),
  //       // );
  //     },
  //   );
  // }

  Widget getEstimation(bool isMile) {
    final locations = this.stopPoints.map((e) {
      if (estimate) return e.locationProfile;
    }).toList();
    return locations.isEmpty || !locations.contains(null)
        ? Query(
            options: WatchQueryOptions(
              document: GetEstimationQuery().document,
              variables: {
                "locations": List.generate(locations.length, (index) {
                  return LocationCollectionInput(
                    coordinates: CoordinatesInput(
                      lat: locations[index].coordinates.lat,
                      lng: locations[index].coordinates.lng,
                    ),
                  );
                }),
              },
            ),
            builder: (result, {refetch, fetchMore}) {
              if (result.hasException) {
                return GestureDetector(
                  onTap: () => refetch(),
                  child: Center(child: Text('')),
                );
              }

              if (result.isLoading && result.data == null) return Text('');

              final resultData = GetEstimation$Query.fromJson(result.data);

              var distance = resultData.getEstimations.routeDistanceMiles
                  .toStringAsFixed(2);
              var duration = convertMintoDay(
                resultData.getEstimations.routeDurationMinutes.toString(),
              );
              return isMile ? Text("$distance miles") : Text(duration);
            },
          )
        : Text(isMile
            ? distanceMile.toStringAsFixed(2)
            : convertMintoDay(transitionTime));
  }

  // buildStopCard() {
  //   String locationProfileId = locationProfiles
  //       .firstWhere(
  //           (StopLocationProfile el) =>
  //               el.id == stop.locationProfileId.toString(),
  //           orElse: null)
  //       ?.id;

  //   // appointment type
  //   _dateController1.text = stop.startTime.toString();
  //   _dateController2.text = stop.endTime.toString();

  //   return
  // }

  void onRemoveTap(int index) {
    // if (state.stopPoints.length == 2) {
    //   showSnackbar(
    //     context,
    //     "Should be min 1 pickup and dropoff",
    //     false,
    //   );
    //   return;
    // }
    // state.onRemoveStopPointTap(index);
  }

  buildEditDialog(StopLocationProfile location) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: EditFacility(location: location, stopPoints: locationProfiles),
        );
      },
    );
  }
}

class Section3 extends StatefulWidget {
  final List<UserLocations$Query$ShipperLocationProfiles$Data> locations;

  const Section3({Key key, @required this.locations}) : super(key: key);

  @override
  _Section3State createState() => _Section3State();
}

class _Section3State extends State<Section3> {
  void onRemoveTap(BuildContext context, int index) {
    var state = Provider.of<EditShipmentProvider>(context, listen: false);
    if (state.stopPoints.length == 2) {
      showSnackbar(
        context,
        "Should be min 1 pickup and dropoff",
        false,
      );
      return;
    }
    state.onRemoveStopPointTap(index);
  }

  void onSetLocationTap(BuildContext context, StopPoint item, int index) {
    //TODO:
  }

  void onSetTimeTap(BuildContext context, StopPoint item, int index) {
    //TODO:
  }

  void onEditFacilityTap(BuildContext context, StopPoint item, int index) {
    //TODO:
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<EditShipmentProvider>(context);
    return SliverReorderableList(
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = widget.locations.removeAt(oldIndex);
          var indexOf = state.stopPoints.indexWhere(
            (e) => e.location.id == item.id,
          );
          state.onInsertStopPointTap(
            newIndex,
            state.stopPoints[indexOf],
          );
        });
      },
      itemCount: state.stopPoints.length,
      itemBuilder: (context, index) {
        return StopCard(
          key: ValueKey(index.toString()),
          label: state.stopPoints[index].label,
          locations: widget.locations,
          point: state.stopPoints[index],
          isDraggaable: index != 0 && index != state.stopPoints.length - 1,
          childIndex: index,
          onRemoveTap: () => onRemoveTap(context, index),
        );
      },
    );
  }
}

class EditFacility extends StatefulWidget {
  const EditFacility({Key key, this.location, this.stopPoints})
      : super(key: key);

  final List<StopLocationProfile> stopPoints;
  final StopLocationProfile location;

  @override
  _EditFacilityState createState() => _EditFacilityState();
}

class _EditFacilityState extends State<EditFacility> {
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

    opNameController =
        TextEditingController(text: widget.location.operationalContact?.name);

    opPhoneController = MaskedTextController(
      text: widget.location.operationalContact?.phoneNumber,
      mask: '(000) 000-0000',
    );

    opEmailController =
        TextEditingController(text: widget.location.operationalContact?.email);

    schNameController =
        TextEditingController(text: widget.location.schedulingContact?.name);

    _schPhoneController = MaskedTextController(
      text: widget.location.schedulingContact?.phoneNumber,
      mask: '(000) 000-0000',
    );

    schEmailController =
        TextEditingController(text: widget.location.schedulingContact?.email);

    checkExpandable();
  }

  @override
  Widget build(BuildContext context) {
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
    if (widget.location.operationalContact?.name != null ||
        widget.location.operationalContact?.email != null ||
        widget.location.operationalContact?.phoneNumber != null) {
      if (widget.location.operationalContact.name.isNotEmpty ||
          widget.location.operationalContact.email.isNotEmpty ||
          widget.location.operationalContact.phoneNumber.isNotEmpty)
        setState(() {
          isOperationalChecked = true;
        });
    }

    if (widget.location.schedulingContact?.name != null ||
        widget.location.schedulingContact?.email != null ||
        widget.location.schedulingContact?.phoneNumber != null) {
      if (widget.location.schedulingContact.name.isNotEmpty ||
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

// class StopPointCard extends StatefulWidget {
//   const StopPointCard({GlobalKey key, this.stop, this.childIndex});

//   final Stop stop;
//   final int childIndex;

//   @override
//   _StopPointCardState createState() => _StopPointCardState();
// }

// class _StopPointCardState extends State<StopPointCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       key: widget.key,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       elevation: 0,
//       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(children: [
//               if (isMultipleStops)
//                 ReorderableDragStartListener(
//                   index: childIndex,
//                   child: SvgIcons.mPoints,
//                 ),
//               if (isMultipleStops) const SizedBox(width: 8),
//               Text(
//                 stop.type.text ?? 'Stop Location - $childIndex',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Spacer(),
//               if (isMultipleStops)
//                 GestureDetector(
//                   onTap: () => onRemoveTap(childIndex),
//                   child: SvgPicture.asset(
//                     'assets/svg/trash.svg',
//                     color: Colors.black,
//                   ),
//                 ),
//             ]),
//             const SizedBox(height: 8),
//             DropdownButtonFormField<String>(
//               value: locationProfileId,
//               isExpanded: true,
//               decoration: InputDecoration(
//                 hintText: "Select Location",
//                 contentPadding: const EdgeInsets.only(left: 12),
//                 border: const RoundedInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                 ),
//                 prefixIcon: Icon(Icons.location_on, color: Colors.black),
//               ),
//               onChanged: (v) {
//                 setState(() {
//                   locationProfileId = v;
//                 });

//                 bool boshYok = true;
//                 for (var stop in stopPoints) {
//                   if (stop.locationProfile == null) boshYok = false;
//                 }
//                 if (boshYok)
//                   setState(() {
//                     estimate = true;
//                   });
//               },
//               items: List.generate(
//                 locationProfiles.length,
//                 (index) {
//                   final text = locationProfiles[index].address.city +
//                       ', ' +
//                       locationProfiles[index].address.state;
//                   final value = locationProfiles[index].id;
//                   return DropdownMenuItem(child: Text(text), value: value);
//                 },
//               ),
//             ),
//             if (isMultipleStops) const SizedBox(height: 8),
//             if (isMultipleStops)
//               // if (widget.point.location != null)
//               DropdownButtonFormField<StopType>(
//                 value: stop.type,
//                 onTap: () => FocusScope.of(context).unfocus(),
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.only(left: 12),
//                   hintText: 'Select Stop Type',
//                   border: const RoundedInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(5)),
//                   ),
//                   prefixIcon: Icon(Icons.flag, color: Colors.black),
//                 ),
//                 onChanged: (v) {
//                   setState(() {
//                     stop.type = v;
//                   });
//                 },
//                 items: StopType.values.map((e) {
//                   return DropdownMenuItem(
//                     child: Text(e.text),
//                     value: e,
//                   );
//                 }).toList(),
//               ),
//             if (locationProfileId != null) const SizedBox(height: 8),
//             if (locationProfileId != null)
//               SizedBox(
//                 child: DropdownButtonFormField<AppointmentType>(
//                     value: stop.appointmentType,
//                     onTap: () => FocusScope.of(context).unfocus(),
//                     decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.only(left: 12),
//                       hintText: "Choose Appointment Type",
//                       border: const RoundedInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(5))),
//                       prefixIcon: Icon(Icons.watch_later, color: Colors.black),
//                     ),
//                     onChanged: (v) {
//                       setState(() {
//                         stop.appointmentType = v;
//                       });
//                     },
//                     items: AppointmentType.values.map((e) {
//                       return DropdownMenuItem(child: Text(e.name), value: e);
//                     }).toList()),
//               ),
//             const SizedBox(height: 8),
//             if (locationProfileId != null)
//               DateTimePicker(
//                 type: DateTimePickerType.dateTimeSeparate,
//                 dateMask: 'dd/MM/yyyy',
//                 use24HourFormat: true,
//                 initialValue: stop.startTime.toString(),
//                 firstDate: DateTime.now().subtract(Duration(days: 0)),
//                 lastDate: DateTime(2100),
//                 dateLabelText: 'Start time',
//                 timeLabelText: "Hour",
//                 onChanged: (v) {
//                   setState(() {
//                     stop.startTime = DateTime.tryParse(v);
//                   });
//                 },
//               ),
//             if (stop.appointmentType == AppointmentType.TO_BE_MADE)
//               const SizedBox(height: 8),
//             if (stop.appointmentType == AppointmentType.TO_BE_MADE)
//               DateTimePicker(
//                 type: DateTimePickerType.dateTimeSeparate,
//                 dateMask: 'dd/MM/yyyy',
//                 initialValue: stop.startTime.toString(),
//                 firstDate: DateTime.now().subtract(Duration(days: 0)),
//                 lastDate: DateTime(2100),
//                 dateLabelText: 'End time',
//                 timeLabelText: "Hour",
//                 onChanged: (v) {
//                   setState(() {
//                     _dateController2.text = v;
//                   });
//                 },
//               ),
//             if (locationProfileId != null) const SizedBox(height: 8),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.resolveWith<Color>((states) {
//                     return locationProfileId == null
//                         ? Color(0xff0F57FB).withOpacity(0.6)
//                         : Theme.of(context).accentColor;
//                   }),
//                   padding:
//                       MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
//                           (states) {
//                     return EdgeInsets.symmetric(vertical: 14);
//                   }),
//                 ),
//                 child: Text(
//                   'Edit Facility Info',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//                 onPressed: locationProfileId == null
//                     ? () {}
//                     : () => buildEditDialog(stop.locationProfile),
//               ),
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Section1 extends StatefulWidget {
  @override
  _Section1State createState() => _Section1State();
}

class _Section1State extends State<Section1> {
  final temperatureMaxController = TextEditingController();
  final temperatureMinController = TextEditingController();
  bool isMultipleStops = false;
  bool isReefer = false;
  TemperatureUnit selectedTempType;

  @override
  void initState() {
    super.initState();
    final state = Provider.of<EditShipmentProvider>(context, listen: false);

    // booleans
    isMultipleStops = state.isMultipleStops;
    isReefer = state.isReefer;

    // selected temperature
    selectedTempType = state.selectedTempType;
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<EditShipmentProvider>(context);
    // booleans
    isMultipleStops = state.isMultipleStops;
    isReefer = state.isReefer;

    // selected temperature
    selectedTempType = state.selectedTempType;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select shipment type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (isMultipleStops) {
                        state.setMultipleOrNot = false;
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 120),
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        border: isMultipleStops
                            ? Border.all(color: Color(0xffebebeb))
                            : null,
                        color: isMultipleStops
                            ? Color(0xfffafafa)
                            : Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/p2p.svg",
                            color: isMultipleStops
                                ? Colors.black
                                : Theme.of(context).colorScheme.onPrimary,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Point to point',
                            style: TextStyle(
                              color: isMultipleStops
                                  ? Colors.black
                                  : Theme.of(context).colorScheme.onPrimary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (!isMultipleStops) {
                        state.setMultipleOrNot = true;
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 120),
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isMultipleStops
                            ? Theme.of(context).colorScheme.primary
                            : Color(0xfffafafa),
                        border: isMultipleStops
                            ? null
                            : Border.all(color: Color(0xffebebeb)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //TODO icon
                          SvgPicture.asset(
                            "assets/svg/p2m.svg",
                            color: isMultipleStops
                                ? Theme.of(context).colorScheme.onPrimary
                                : Colors.black,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Multiple stops',
                            style: TextStyle(
                              color: isMultipleStops
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Select truck type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (isReefer) {
                        state.setReeferOrNot = false;
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 120),
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        border: isReefer
                            ? Border.all(color: Color(0xffebebeb))
                            : null,
                        color: isReefer
                            ? Color(0xfffafafa)
                            : Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/truck.svg",
                            color: isReefer
                                ? Colors.black
                                : Theme.of(context).colorScheme.onPrimary,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Dry van',
                            style: TextStyle(
                              color: isReefer
                                  ? Colors.black
                                  : Theme.of(context).colorScheme.onPrimary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (!isReefer) {
                        state.setReeferOrNot = true;
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 120),
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isReefer
                            ? Theme.of(context).colorScheme.primary
                            : Color(0xfffafafa),
                        border: isReefer
                            ? null
                            : Border.all(color: Color(0xffebebeb)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/snowflake.svg",
                              color: isReefer
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Colors.black),
                          const SizedBox(width: 8),
                          Text(
                            'Reefer',
                            style: TextStyle(
                              color: isReefer
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (isReefer)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: temperatureMinController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          errorText: state.minError,
                          hintText: 'min',
                        ),
                        validator: validateMin,
                        onChanged: (v) {
                          if (state.minError != null) {
                            setState(() => state.setMinError = null);
                          }
                        },
                        onSaved: (v) {
                          setState(() {
                            state.minSaved = v;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: temperatureMaxController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          errorText: state.maxError,
                          hintText: 'max',
                        ),
                        validator: validateCommon,
                        onChanged: (v) {
                          if (state.maxError != null) {
                            setState(() => state.setMaxError = null);
                          }
                        },
                        onSaved: (v) {
                          setState(() {
                            state.maxSaved = v;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: DropdownButtonFormField<TemperatureUnit>(
                        value: selectedTempType,
                        onChanged: (v) {
                          setState(() {
                            state.setTemperatureType = v;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                        ),
                        items: TemperatureUnit.values.map((type) {
                          return DropdownMenuItem(
                            child: Text(type.text),
                            value: type,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Section2 extends StatefulWidget {
  @override
  _Section2State createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  TextEditingController descriptionController;
  TextEditingController shortController;
  TextEditingController weightController;
  TextEditingController quantityController;
  TextEditingController packingController;
  TextEditingController loadDescController;

  @override
  void initState() {
    super.initState();
    final state = Provider.of<EditShipmentProvider>(context, listen: false);
    descriptionController = TextEditingController(text: state.descSaved);
    shortController = TextEditingController(text: state.shortSaved);
    weightController = TextEditingController(text: state.weightSaved);
    quantityController = TextEditingController(text: state.quantitySaved);
    packingController = TextEditingController(text: state.packingSaved);
    loadDescController = TextEditingController(text: state.loadDescSaved);
    state.accessoriesList.addAll(Accessory.values.map((e) {
      return Accessories(type: e, label: e.text);
    }).toList());
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<EditShipmentProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: "Commodity Info",
                children: [
                  TextSpan(
                    text: '  (optional)',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                errorText: state.descError,
              ),
              onChanged: (v) {
                setState(() {
                  state.setDesc = v;
                });
              },
              onSaved: (v) {
                setState(() {
                  state.setDesc = v;
                });
              },
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                        text: "Tracking ID",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: shortController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          errorText: state.shortError,
                        ),
                        onChanged: (v) {
                          if (state.shortError != null)
                            setState(() => state.setTrackIDError = null);
                        },
                        onSaved: (v) => state.setTrackID = v,
                        inputFormatters: [
                          UpperCaseTextFormatter(),
                          LengthLimitingTextInputFormatter(5)
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weight",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          suffix: Text('LB'),
                          errorText: state.weightError,
                          hintText: '0',
                        ),
                        validator: validateWeight,
                        onChanged: (v) {
                          if (state.weightError != null)
                            setState(() => state.weightError = null);
                        },
                        onSaved: (v) => state.setWeight = v,
                        inputFormatters: [LengthLimitingTextInputFormatter(5)],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                "Item quantity",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TODO: dropdown units
                      TextFormField(
                        controller: quantityController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorText: state.quantityError,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                        ),
                        onChanged: (v) {
                          if (state.quantityError != null)
                            setState(() => state.quantityError = null);
                        },
                        onSaved: (v) => state.setQuantity = v,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        DropdownButtonFormField<ItemUnit>(
                          isDense: true,
                          value: state.selectedQuantityType,
                          onChanged: (v) => state.setQuantityType = v,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                          ),
                          items: ItemUnit.values.map((e) {
                            return DropdownMenuItem(
                              child:
                                  Text(e.text, style: TextStyle(fontSize: 14)),
                              value: e,
                            );
                          }).toList(),
                        ),
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                "Item packaging",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: packingController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorText: state.packingError,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                        ),
                        onChanged: (v) {
                          if (state.packingError != null)
                            setState(() => state.packingError = null);
                        },
                        onSaved: (v) => state.setPacking = v,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        DropdownButtonFormField<PieceType>(
                          isDense: true,
                          value: state.selectedPackageType,
                          onChanged: (v) => state.setPackingType = v,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                          ),
                          items: PieceType.values.map((e) {
                            return DropdownMenuItem(
                              child: Text(e.text),
                              value: e,
                            );
                          }).toList(),
                        ),
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Accessories & credentials",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: state.accessoriesList.map((e) {
                return LabeledCheckbox(
                  value: e.isChecked,
                  padding: const EdgeInsets.all(0),
                  onChanged: (bool v) {
                    setState(() {
                      e.isChecked = !e.isChecked;
                    });
                  },
                  label: Text(e.label),
                );
              }).toList(),
            ),
            Text(
              "Load Description",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: loadDescController,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
              maxLines: 3,
              maxLength: 250,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                errorText: state.loadDescError,
              ),
              onChanged: (v) {
                if (state.loadDescError != null)
                  setState(() => state.loadDescError = null);
              },
              onSaved: (v) => state.setLoadDesc = v,
            ),
          ],
        ),
      ),
    );
  }
}

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
    // if (locationProfileId != null) {
    //   widget.locations.removeWhere((el) => el.id == locationProfileId);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<EditShipmentProvider>(context);
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
              value: widget.point.location?.address?.full,
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
                  widget.point.location =
                      widget.locations.firstWhere((el) => el.address.full == v);
                });
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
                    value: indexedLoc.address.full,
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
            if (widget.point.appointmentType == AppointmentType.TO_BE_MADE)
              const SizedBox(height: 8),
            if (widget.point.appointmentType == AppointmentType.TO_BE_MADE)
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

class Section4 extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String uuid;
  const Section4({Key key, this.formKey, @required this.uuid})
      : super(key: key);

  @override
  _Section4State createState() => _Section4State();
}

class _Section4State extends State<Section4> {
  bool isLoading = false;
  String id;
  String uuid;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<EditShipmentProvider>(context);
    uuid = state.uuid;
    return Mutation(
      options: MutationOptions(
        document: UpdateOfferMutation().document,
        onCompleted: (dynamic resultData) {
          if (resultData != null) {
            onUpdated(id, uuid);
          }
        },
        onError: (e) {
          debugPrint(e.toString(), wrapWidth: 1024);
        },
      ),
      builder: (runUpdateMutation, updateResult) {
        isLoading = updateResult.isLoading;
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Shipment distance:  ',
                    ),
                    if (state.estimate)
                      state.getEstimation(true)
                    else
                      Text(state.distanceMile.toStringAsFixed(2))
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      'Minimum transit time:  ',
                    ),
                    if (state.estimate)
                      state.getEstimation(false)
                    else
                      Text(convertMintoDay(state.transitionTime))
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => onReviewTap(runUpdateMutation),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14)),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 150),
                      child: updateResult.isLoading
                          ? Theme(
                              data: Theme.of(context)
                                  .copyWith(accentColor: Colors.white),
                              child: const ProgressIndicatorSmall(),
                            )
                          : Text(
                              'Review Shipment',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  onUpdated(id, uuid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ViewShipmentPage(uuid),
      ),
    );
  }

  void onReviewTap(RunMutation runMutation) {
    final state = Provider.of<EditShipmentProvider>(context, listen: false);

    List<String> selectedAccessories = state.accessoriesList
        .where((e) => e.isChecked == true)
        .map((e) => e.type.describe)
        .toList();

    hideKeyboard();
    if (isLoading) {
      return;
    }

    for (var stop in state.stopPoints) {
      if (stop.location == null) {
        showSnackbar(context, 'Please provide stop point', false);
        return;
      } else if (stop.startTime == null) {
        showSnackbar(context, 'Please provide start time', false);
        return;
      } else if (stop.appointmentType == null) {
        showSnackbar(context, 'Please provide appointment type', false);
        return;
      } else if (stop.appointmentType == AppointmentType.TO_BE_MADE &&
          stop.endTime == null) {
        showSnackbar(context, 'Please provide end time', false);
        return;
      }
    }

    // debugPrint(
    //     {
    //       "uuid": state.uuid,
    //       "shipment": {
    //         "short_name": state.shortSaved ?? '',
    //         "requested_truck_types": [state.isReefer ? "REEFER" : "DRY_VAN"],
    //         "accessorials": selectedAccessories,
    //         "load_description": state.loadDescSaved ?? '',
    //         "route_distance_miles": state.distanceMile ?? 0,
    //         "route_duration_minutes": state.transitionTime ?? 0,
    //         "stops": state.stopPoints.map((StopPoint stop) {
    //           return {
    //             // "location_profile_id": stop.location.id,
    //             "appointment_type": stop.appointmentType.describe,
    //             // 2021-05-19T02:44:28+05:00
    //             "start_time": formatISOTime(DateTime.now()),
    //             "end_time": stop.appointmentType == AppointmentType.TO_BE_MADE
    //                 ? formatISOTime(stop.endTime)
    //                 : null,
    //             "type": stop.stopType.describe,
    //             "loading_type": "LIVE",
    //             "location_input": {
    //               "location_name": "ATABEK", //stop.location.locationName,
    //               "coordinates": {
    //                 "lat": stop.location.coordinates.lat,
    //                 "lng": stop.location.coordinates.lng,
    //               },
    //               "address": {
    //                 "full": stop.location.address.full,
    //                 "city": stop.location.address.city,
    //                 "state": stop.location.address.state,
    //                 // "street": stop.location.address.street,
    //                 // "street_number": stop.location.address.streetNumber,
    //                 // "place_id": stop.location.address.placeId,
    //               },
    //               "operational_contact": {
    //                 "contact_name": stop.location.operationalContact?.name ??
    //                     stop.location.operationalContact?.contactName,
    //                 "email": stop.location.operationalContact.email,
    //                 "phone_number": stop.location.operationalContact.phoneNumber
    //               },
    //               "scheduling_contact": {
    //                 "contact_name": stop.location.schedulingContact?.name ??
    //                     stop.location.schedulingContact.contactName,
    //                 "email": stop.location.schedulingContact.email,
    //                 "phone_number": stop.location.schedulingContact.phoneNumber,
    //               }
    //             }
    //           };
    //         }).toList(),
    //         "items": [
    //           {
    //             "description": state.descSaved,
    //             "handling_piece": {
    //               "piece_type": state.selectedPackageType.describe,
    //               "piece_count": intParse(state.packingSaved),
    //             },
    //             "units": {
    //               "unit_count": intParse(state.quantitySaved),
    //               "unit_type": state.selectedQuantityType.describe
    //             },
    //             "weight": {
    //               "weight": intParse(state.weightSaved),
    //               "weight_unit": "LB"
    //             },
    //           }
    //         ],
    //         "trailer": state.isReefer
    //             ? {
    //                 "temperature_max": intParse(state.maxSaved),
    //                 "temperature_min": intParse(state.minSaved),
    //                 "temperature_unit":
    //                     state.selectedTempType == TemperatureUnit.C ? "C" : "F",
    //               }
    //             : null,
    //       }
    //     }.toString(),
    //     wrapWidth: 1024);

    if (widget.formKey.currentState.validate()) {
      widget.formKey.currentState.save();

      runMutation(
        {
          "uuid": state.uuid,
          "shipment": {
            //"short_name": null, state.shortSaved,
            "requested_truck_types": [state.isReefer ? "REEFER" : "DRY_VAN"],
            "accessorials": selectedAccessories,
            "load_description": state.loadDescSaved,
            "route_distance_miles": state.distanceMile,
            "route_duration_minutes": state.transitionTime,
            "stops": state.stopPoints.map((StopPoint stop) {
              return {
                "location_profile_id": stop.location.id,
                "appointment_type": stop.appointmentType.describe,
                // 2021-05-19T02:44:28+05:00
                "start_time": formatISOTime(DateTime.now()),
                "end_time": stop.appointmentType == AppointmentType.TO_BE_MADE
                    ? formatISOTime(stop.endTime)
                    : null,
                "type": stop.stopType.describe,
                "loading_type": "LIVE",
                "location_input": {
                  "location_name": stop.location.locationName,
                  "coordinates": {
                    "lat": stop.location.coordinates.lat,
                    "lng": stop.location.coordinates.lng,
                  },
                  "address": {
                    "full": stop.location.address.full,
                    "city": stop.location.address.city,
                    "state": stop.location.address.state,
                    // "street": stop.location.address.street,
                    // "street_number": stop.location.address.streetNumber,
                    // "place_id": stop.location.address.placeId,
                  },
                  "operational_contact": {
                    "contact_name": stop.location.operationalContact?.name ??
                        stop.location.operationalContact?.contactName,
                    "email": stop.location.operationalContact.email,
                    "phone_number": stop.location.operationalContact.phoneNumber
                  },
                  "scheduling_contact": {
                    "contact_name": stop.location.schedulingContact?.name ??
                        stop.location.schedulingContact.contactName,
                    "email": stop.location.schedulingContact.email,
                    "phone_number": stop.location.schedulingContact.phoneNumber,
                  }
                }
              };
            }).toList(),
            "items": [
              {
                "description": state.descSaved,
                "handling_piece": {
                  "piece_type": state.selectedPackageType.describe,
                  "piece_count": intParse(state.packingSaved),
                },
                "units": {
                  "unit_count": intParse(state.quantitySaved),
                  "unit_type": state.selectedQuantityType.describe
                },
                "weight": {
                  "weight": intParse(state.weightSaved),
                  "weight_unit": "LB"
                },
              }
            ],
            "trailer": state.isReefer
                ? {
                    "temperature_max": intParse(state.maxSaved),
                    "temperature_min": intParse(state.minSaved),
                    "temperature_unit":
                        state.selectedTempType == TemperatureUnit.C ? "C" : "F",
                  }
                : null,
          }
        },
      );
    }
  }
}
