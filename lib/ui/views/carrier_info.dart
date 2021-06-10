// import 'package:extended_masked_text/extended_masked_text.dart';
// import 'package:flutter/material.dart';
// import 'package:freightcab_shipper/models/carrier.dart';
// import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
// import 'package:freightcab_shipper/ui/shared/extensions.dart';
// import 'package:freightcab_shipper/ui/widgets/buttons.dart';
// import 'package:freightcab_shipper/ui/widgets/text_fields.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// import 'home.dart';

// class CarrierInfo extends StatefulWidget {
//   final String offerUUID;
//   final Carrier carrier;

//   const CarrierInfo({Key key, @required this.offerUUID, this.carrier})
//       : super(key: key);

//   @override
//   _CarrierInfoState createState() => _CarrierInfoState();
// }

// class _CarrierInfoState extends State<CarrierInfo> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   final formKey = GlobalKey<FormState>();
//   bool isLoading = false;

//   TextEditingController nameController;

//   TextEditingController mcdotController;

//   MaskedTextController _maskedPhoneController;

//   @override
//   void initState() {
//     nameController = TextEditingController(text: widget.companyName);
//     mcdotController = TextEditingController(text: widget.mcdotNumber);
//     _maskedPhoneController = MaskedTextController(
//       mask: '(000) 000-0000',
//       text: widget.phone,
//     );

//     super.initState();
//   }

//   void onSelected() {
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => HomeScreen()),
//       (route) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         padding: EdgeInsets.all(16),
//         child: Form(
//           key: formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Carrier Info',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Text(
//                   "Company name",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 TextFormField(
//                     controller: nameController,
//                     enabled: false,
//                     textCapitalization: TextCapitalization.none),
//                 const SizedBox(height: 14),
//                 Text(
//                   "MC / DOT",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: 60,
//                       height: 48,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4),
//                         color: Theme.of(context).primaryColor,
//                       ),
//                       margin: const EdgeInsets.only(right: 5),
//                       child: Center(
//                         child: Text(
//                           widget.isMC ? 'MC' : 'DOT',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: TextFormField(
//                         enabled: false,
//                         controller: mcdotController,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 14),
//                 Text(
//                   "Phone number",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 MyPhoneTextField(
//                   controller: _maskedPhoneController,
//                   enabled: false,
//                 ),
//                 const SizedBox(height: 14),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedWhiteButton(
//                           title: "Close",
//                           onPressed: () => Navigator.pop(context)),
//                     ),
//                     SizedBox(width: 8),
//                     Mutation(
//                       options: MutationOptions(
//                         document: widget.isAssigned
//                             ? UnAssignCarrierToShipmentMutation().document
//                             : AssignCarrierToShipmentMutation().document,
//                         onCompleted: (dynamic resultData) {
//                           if (resultData != null) {
//                             Navigator.pop(context);
//                             onSelected();
//                           }
//                         },
//                         onError: (e) {
//                           Navigator.pop(context);
//                           // link exception
//                           if (e.linkException != null) {
//                             showSnackbar(
//                                 context,
//                                 'Something went wrong, please check your network connection and try again.',
//                                 false);
//                             return;
//                           }
//                         },
//                       ),
//                       builder: (runMutation, result) {
//                         isLoading = result.isLoading;
//                         return Expanded(
//                           child: AbsorbPointer(
//                             absorbing: result.isLoading,
//                             child: ElevatedPrimaryButton(
//                               title: widget.isAssigned ? "Unselect" : "Select",
//                               onPressed: () => onSubmitTap(runMutation),
//                               isLoading: isLoading,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void onSubmitTap(RunMutation runMutation) {
//     hideKeyboard();

//     if (isLoading) {
//       return;
//     }
//     runMutation(
//       AssignCarrierToShipmentArguments(
//               uuid: widget.offerUUID, carrier_id: widget.carrierId)
//           .toJson(),
//     );
//   }
// }
