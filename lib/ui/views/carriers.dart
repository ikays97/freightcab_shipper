import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/buttons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'carrier_info.dart';
import 'home.dart';

class RequestedCarriers extends StatefulWidget {
  final id;
  final uuid;
  final String carrierId;

  const RequestedCarriers({
    Key key,
    @required this.carrierId,
    @required this.id,
    @required this.uuid,
  }) : super(key: key);
  @override
  _RequestedCarriersState createState() => _RequestedCarriersState();
}

class _RequestedCarriersState extends State<RequestedCarriers> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Query(
        options: QueryOptions(
            document: OfferQuery().document,
            variables: OfferArguments(
              uuid: widget.uuid,
            ).toJson(),
            fetchPolicy: FetchPolicy.noCache),
        builder: (result, {refetch, fetchMore}) {
          if (result.hasException) {
            return GestureDetector(
              onTap: () => refetch(),
              child:
                  Center(child: Text('Something went wrong, tap to try again')),
            );
          }

          if (result.isLoading && result.data == null) {
            return Center(child: CircularProgressIndicator());
          }

          var data = Offer$Query.fromJson(result.data);
          print('offer uuid');
          print(data.offer.uuid);
          print('offer shipment carrier id, assigned, driver assigned');
          print(data.offer.shipment.carrierId);
          print(data.offer.shipment.carrierAssigned);
          print(data.offer.shipment.driverAssigned);

          List<Offer$Query$Offer$Bid> carriers = data.offer.bid
              .where((e) => e.type == BidTypeEnum.accept)
              .toList();

          return Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Carriers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    physics: carriers.length > 4
                        ? NeverScrollableScrollPhysics()
                        : AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: List.generate(
                        carriers.length,
                        (index) {
                          String carrierName = carriers[index].carrier ?? '';
                          String carrierTrackId = carriers[index]
                                  .carrier
                                  .mcDotNumber
                                  .substring(3) ??
                              '';
                          String companyName = carriers[index].carrier.name;
                          bool isMC = carriers[index]
                                  .carrier
                                  .mcDotNumber
                                  .substring(0, 2) ==
                              'MC';
                          String phone = carriers[index].carrier.contact.phone;
                          bool isAssigned =
                              carriers[index].carrierId == widget.carrierId;
                          return Card(
                            margin: const EdgeInsets.all(0),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                              color: const Color(0xfffafafa),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            minimumSize: Size(50, 10),
                                            alignment: Alignment.centerLeft),
                                        // TODO: add attributes to the page
                                        onPressed: () {},
                                        child: Text(carrierName)),
                                    Text(
                                      carrierTrackId,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 8),
                                    if (isAssigned)
                                      SizedBox(
                                        width: double.infinity,
                                        child: UnSelectCarrier(
                                          carrierId: carriers[index].carrierId,
                                          uuid: widget.uuid,
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> buildDialog(Widget page) async {
    await showDialog(context: context, builder: (BuildContext context) => page);
  }
}

class UnSelectCarrier extends StatefulWidget {
  final uuid;
  final String carrierId;

  const UnSelectCarrier(
      {Key key, @required this.uuid, @required this.carrierId})
      : super(key: key);
  @override
  _UnSelectCarrierState createState() => _UnSelectCarrierState();
}

class _UnSelectCarrierState extends State<UnSelectCarrier> {
  bool isLoading = false;

  void onUnSelected() {
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
        document: UnAssignCarrierToShipmentMutation().document,
        onCompleted: (dynamic resultData) {
          if (resultData != null) {
            Navigator.pop(context);
            onUnSelected();
            showSnackbar(context, 'Driver has been deleted successfully', true);
          }
        },
        onError: (e) {
          Navigator.pop(context);
          // link exception
          if (e.linkException != null) {
            showSnackbar(
                context,
                'Something went wrong, please check your network connection and try again.',
                false);
            return;
          }
        },
      ),
      builder: (runMutation, result) {
        isLoading = result.isLoading;
        return Expanded(
          child: AbsorbPointer(
            absorbing: result.isLoading,
            child: ElevatedPrimaryButton(
              title: "Unselect",
              onPressed: () => onSubmitTap(runMutation),
              isLoading: isLoading,
            ),
          ),
        );
      },
    );
  }

  void onSubmitTap(RunMutation runMutation) {
    hideKeyboard();

    if (isLoading) {
      return;
    }
    runMutation(
      AssignCarrierToShipmentArguments(
              uuid: widget.uuid, carrier_id: widget.carrierId)
          .toJson(),
    );
  }
}
