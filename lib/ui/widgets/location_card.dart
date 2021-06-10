import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/shared/icons.dart';
import 'package:freightcab_shipper/ui/views/edit_location.dart';
import 'package:freightcab_shipper/ui/views/home.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'indicators.dart';

class LocationCard extends StatefulWidget {
  final UserLocations$Query$ShipperLocationProfiles$Data location;

  const LocationCard({Key key, @required this.location}) : super(key: key);
  @override
  _LocationCardState createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  bool isLoading = false;
  String locationError;

  void onDeleteTap(String locationId) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Mutation(
          options: MutationOptions(
            document: DeleteLocationMutation().document,
            onCompleted: (dynamic finalData) {
              if (finalData != null) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                  (route) => false,
                );
                showSnackbar(
                    context, 'Location has been deleted successfully', true);
              }
            },
            onError: (e) {
              print(e);
              // link exception
              if (e.linkException != null) {
                showSnackbar(
                    context,
                    'Something went wrong, please check your network connection and try again.',
                    false);
                return;
              }

              final validationErrors =
                  findValidationErrors(e.graphqlErrors, ['id']);

              // TODO: set errors
              if (validationErrors.isNotEmpty) {
                setState(() {
                  locationError = validationErrors['id'];
                });
                //TODO text
                showSnackbar(context, 'Please check entered fields', false);
              } else if (e.graphqlErrors.isNotEmpty) {
                //TODO error message uppercase ('user not found')

                print('error message');
                print(e.graphqlErrors[0].message);

                showSnackbar(
                    context,
                    e.graphqlErrors[0].message ?? 'Something went wrong',
                    false);
              } else {
                showSnackbar(context, 'Something went wrong', false);
              }
            },
          ),
          builder: (runMutation, result) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Attention!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Do you really want to delete this location?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              'No',
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
                              onPressed: () {
                                runMutation(
                                  DeleteLocationArguments(id: locationId)
                                      .toJson(),
                                );
                              }, // addDriverSubmit,
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 150),
                                child: result.isLoading
                                    ? Theme(
                                        data: Theme.of(context).copyWith(
                                            accentColor: Colors.white),
                                        child: const ProgressIndicatorSmall(),
                                      )
                                    : Text(
                                        'Yes',
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
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.location.id;
    final city = widget.location.address.city;
    final state = widget.location.address.state;
    final locationName = widget.location.locationName;
    final operationalName = widget.location.operationalContact.contactName;
    final schedulingName = widget.location.schedulingContact.contactName;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(right: 24, left: 24, top: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              columnWidths: {
                0: const FixedColumnWidth(95),
                1: const FlexColumnWidth(1.0),
              },
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      'Location :',
                      style: TextStyle(
                          color: Color(0xff9BA9C6),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          locationName,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(5),
                          ),
                          onPressed: () => buildEditDialog(widget.location),
                          child: SvgIcons.edit,
                        ),
                      ),
                      SizedBox(width: 4),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) {
                                return Color(0xffED2626);
                              },
                            ),
                            padding:
                                MaterialStateProperty.resolveWith<EdgeInsets>(
                              (states) {
                                return EdgeInsets.all(5);
                              },
                            ),
                          ),
                          onPressed: () => onDeleteTap(id),
                          child: SvgIcons.trash,
                        ),
                      ),
                    ],
                  )
                ]),
                TableRow(children: [
                  Text('City:',
                      style: TextStyle(
                          color: Color(0xff9BA9C6),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  Text(city,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text('State:',
                        style: TextStyle(
                            color: Color(0xff9BA9C6),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(state,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text('Operational contact:',
                        style: TextStyle(
                            color: Color(0xff9BA9C6),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(operationalName ?? '',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text('Scheduling contact:',
                        style: TextStyle(
                            color: Color(0xff9BA9C6),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(schedulingName ?? '',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildEditDialog(
      UserLocations$Query$ShipperLocationProfiles$Data location) async {
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
          child: EditFacilityPage(
            location: location,
          ),
        );
      },
    );
  }
}
