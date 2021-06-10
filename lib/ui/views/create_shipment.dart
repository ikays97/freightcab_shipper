import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freightcab_shipper/ui/views/section1.dart';
import 'package:freightcab_shipper/ui/views/section2.dart';
import 'package:freightcab_shipper/ui/views/section4.dart';
import 'package:freightcab_shipper/viewmodels/create_shipment.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../../models/graphql/q.graphql_api.graphql.dart';

import 'footer.dart';
import 'section3.dart';

class CreateShipmentScreen extends StatefulWidget {
  const CreateShipmentScreen({Key key}) : super(key: key);

  @override
  _CreateShipmentScreenState createState() => _CreateShipmentScreenState();
}

class _CreateShipmentScreenState extends State<CreateShipmentScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CreateShipmentProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 64.0,
        title: Text(
          "Create shipment",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(SvgIcons.notifications),
        //     onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
        //   ),
        // ],
      ),
      // endDrawer: Theme(
      //   data: Theme.of(context).copyWith(canvasColor: Colors.white),
      //   child: Drawer(child: SafeArea(child: NotificationsContent())),
      // ),
      body: SafeArea(
        child: Query(
          options: WatchQueryOptions(
            document: UserLocationsQuery().document,
            fetchPolicy: FetchPolicy.cacheAndNetwork,
            fetchResults: true,
            variables: UserLocationsArguments(
              first: 10,
            ).toJson(),
          ),
          builder: (resultMutation, {refetch, fetchMore}) {
            if (resultMutation.hasException) {
              return GestureDetector(
                onTap: () => refetch(),
                child: Center(
                  child: Text('Something went wrong, tap to try again'),
                ),
              );
            }
            if (resultMutation.isLoading && resultMutation.data == null) {
              return Center(child: const CircularProgressIndicator());
            }

            final a = UserLocations$Query.fromJson(resultMutation.data);
            final locations = a.shipperLocationProfiles.data;

            return Form(
              key: formKey,
              child: CustomScrollView(
                slivers: [
                  // section 1
                  SliverToBoxAdapter(child: Section1()),
                  // section 2
                  SliverToBoxAdapter(child: Section2()),
                  if (state.isMultipleStops)
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
                              var state = Provider.of<CreateShipmentProvider>(
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
                  // stops body
                  Section3(locations: locations),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverToBoxAdapter(child: Section4(formKey: formKey)),
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

  @override
  void initState() {
    final state = Provider.of<CreateShipmentProvider>(context, listen: false);
    state.resetAll();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void getQuery() {
  //   final state = Provider.of<CreateShipmentProvider>(context, listen: false);

  //   if (widget.uuid != null) {
  //     if (canGet && shipment != null) {
  //       state.setAll(shipment);
  //     }
  //   } else {
  //     TODO:
  //     state.resetAll();
  //     // accessories.forEach((e) => e.isChecked = false);
  //   }
  // }
}

class GetDataFromQuer extends StatelessWidget {
  const GetDataFromQuer({Key key, this.uuid, this.id}) : super(key: key);

  final String uuid;
  final String id;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CreateShipmentProvider>(context);
    return Query(
      options: QueryOptions(
          document: UserShipmentQuery().document,
          variables: UserShipmentArguments(
            id: id,
            uuid: uuid,
          ).toJson()),
      builder: (result, {refetch, fetchMore}) {
        if (result.hasException) {
          return GestureDetector(
            onTap: () => refetch(),
            child: Center(
              child: Text('Something went wrong, tap to try again'),
            ),
          );
        }

        if (result.isLoading && result.data == null) {
          return Container();
        }

        final data = UserShipment$Query.fromJson(result.data);
        log(data.userShipment.toString() + " shipment");

        state.shipment = data.userShipment;

        return Container();
      },
    );
  }
}
