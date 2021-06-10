import 'package:flutter/material.dart';
import 'package:freightcab_shipper/constants/enums/piece_type.dart';
import 'package:freightcab_shipper/constants/enums/temperature_unit.dart';
import 'package:freightcab_shipper/constants/enums/item_unit.dart';
import 'package:freightcab_shipper/constants/enums/accessory.dart';
import 'package:freightcab_shipper/constants/enums/stop_type.dart';
import 'package:freightcab_shipper/constants/enums/appointment_type.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/views/view_shipment.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/viewmodels/create_shipment.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

class Section4 extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const Section4({Key key, this.formKey}) : super(key: key);

  @override
  _Section4State createState() => _Section4State();
}

class _Section4State extends State<Section4> {
  bool isLoading = false;
  String id;
  String uuid;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CreateShipmentProvider>(context);
    return Mutation(
      options: MutationOptions(
        document: CreateShipmentMutation().document,
        errorPolicy: ErrorPolicy.none,
        onCompleted: (dynamic finalData) {
          if (finalData != null) {
            print(finalData);
            setState(() {
              id = finalData['createOffer']['id'];
              uuid = finalData['createOffer']['uuid'];
            });
            onCreated(id, uuid);
          }
        },
        onError: (e) {
          if (e.linkException != null) {
            showSnackbar(
                context,
                'Something went wrong, please check your network connection and try again.',
                false);
            return;
          }

          if (e.graphqlErrors.isNotEmpty) {
            debugPrint(e.graphqlErrors.toString(), wrapWidth: 1024);
          } else {
            showSnackbar(context, 'Something went wrong', false);
          }
        },
      ),
      builder: (runCreateMutation, createResult) {
        isLoading = createResult.isLoading;
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
                    if (state.estimate) state.getEstimation(true)
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      'Minimum transit time:  ',
                    ),
                    if (state.estimate) state.getEstimation(false)
                  ],
                ),
                const SizedBox(height: 12),
                Mutation(
                    options: MutationOptions(
                      document: UpdateOfferMutation().document,
                      onCompleted: (dynamic resultData) {
                        if (resultData != null) {
                          onCreated(id, uuid);
                        }
                      },
                      onError: (e) {
                        debugPrint(e.toString(), wrapWidth: 1024);
                      },
                    ),
                    builder: (runUpdateMutation, updateResult) {
                      isLoading = updateResult.isLoading;
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => onReviewTap(
                            id == null ? runCreateMutation : runUpdateMutation,
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14)),
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 150),
                            child: (id == null
                                    ? createResult.isLoading
                                    : updateResult.isLoading)
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
                      );
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  onCreated(id, uuid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ViewShipmentPage(uuid),
      ),
    );
  }

  void onReviewTap(RunMutation runMutation) {
    final state = Provider.of<CreateShipmentProvider>(context, listen: false);

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

    if (widget.formKey.currentState.validate()) {
      widget.formKey.currentState.save();

      print(uuid == null);

      runMutation({
        "input": {
          "open_price": 0,
          "shipment": {
            "short_name": state.shortSaved,
            "requested_truck_types": [state.isReefer ? "REEFER" : "DRY_VAN"],
            "accessorials": selectedAccessories,
            "load_description": state.loadDescSaved,
            "route_distance_miles": state.distanceMile,
            "route_duration_minutes": state.transitionTime,
            "stops": state.stopPoints.map((stop) {
              return {
                "location_profile_id": stop.location.id,
                "appointment_type": stop.appointmentType.describe,
                "start_time": formatISOTime(stop.startTime),
                "end_time": stop.appointmentType == AppointmentType.TO_BE_MADE
                    ? formatISOTime(stop.endTime)
                    : null,
                "type": stop.stopType.describe,
                "loading_type": "LIVE",
                "location_input": {
                  "location_name": stop.location.locationName,
                  "coordinates": stop.location.coordinates.toJson(),
                  "address": stop.location.address.toJson(),
                  "operational_contact":
                      stop.location.operationalContact.toJson(),
                  "scheduling_contact":
                      stop.location.schedulingContact.toJson(),
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
        }
      });
    }
  }
}
