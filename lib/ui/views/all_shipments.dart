import 'package:flutter/material.dart';
import 'package:freightcab_shipper/constants/enums/shipment_status.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/models/paginator.dart';
import 'package:freightcab_shipper/models/shipment.dart';
import 'package:freightcab_shipper/models/shipper.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/Shipment_card.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/ui/widgets/page_title.dart';
import 'package:freightcab_shipper/ui/widgets/search_bar.dart';
import 'package:freightcab_shipper/ui/widgets/intro.dart';
import 'package:freightcab_shipper/viewmodels/graphql_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllShipmentsPage extends StatefulWidget {
  @override
  _AllShipmentsPageState createState() => _AllShipmentsPageState();
}

class _AllShipmentsPageState extends State<AllShipmentsPage> {
  final _pagingController = PagingController<int, Shipment>(firstPageKey: 1);
  bool userVerified = false;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await graphqlClient.query(
      QueryOptions(
        document: UserShipmentsQuery().document,
        fetchPolicy: FetchPolicy.cacheAndNetwork,
        variables: {
          "states": [
            ShipmentStatus.CREATED.describe,
            ShipmentStatus.REQUEST_IN_PROGRESS.describe,
            ShipmentStatus.REJECTED_BY_SHIPPER.describe,
            ShipmentStatus.PRICE_DEFINED.describe,
            ShipmentStatus.PRICE_ACCEPTED.describe,
            ShipmentStatus.UNASSIGNED.describe,
            ShipmentStatus.CARRIER_ASSIGNED.describe,
            ShipmentStatus.DRIVER_ASSIGNED.describe,
            ShipmentStatus.DISPATCHED.describe,
            ShipmentStatus.AT_PICKUP.describe,
            ShipmentStatus.IN_TRANSIT.describe,
            ShipmentStatus.AT_DELIVERY.describe,
            ShipmentStatus.DELIVERED.describe,
            ShipmentStatus.COMPLETED.describe,
            ShipmentStatus.PENDING.describe,
            ShipmentStatus.FINISHED.describe,
            ShipmentStatus.PAYMENT_IN_PROGRESS.describe,
            ShipmentStatus.IN_PROGRESS.describe,
            ShipmentStatus.ALERTS.describe,
            ShipmentStatus.EXCEPTIONS.describe,
            ShipmentStatus.WARNINGS.describe,
            ShipmentStatus.ALL.describe,
            ShipmentStatus.ARCHIVED.describe,
            ShipmentStatus.TRASH.describe
          ],
          "first": 5,
          "page": pageKey
        },
      ),
    );

    if (result.hasException) {
      _pagingController.error = result.exception;
    } else {
      Paginator paginator =
          Paginator(json: result.data['userShipments']['paginatorInfo']);
      List<Shipment> offers = List.from(result.data['userShipments']['data']
          .map((json) => Shipment(json: json)));

      if (paginator.hasMorePages) {
        _pagingController.appendPage(offers, pageKey + 1);
      } else {
        _pagingController.appendLastPage(offers);
      }
    }
  }

  fetchMe() async {
    final result = await graphqlClient.query(
      QueryOptions(
        document: MeQuery().document,
        fetchPolicy: FetchPolicy.cacheAndNetwork,
      ),
    );

    if (result.hasException) {
      if (result.exception is LinkException) {
        showSnackbar(
          context,
          'Something went wrong, please check your network connection and try again.',
          false,
        );
      }
    } else {
      Shipper shipper = Shipper(json: result.data['me']['shipper']);
      userVerified = shipper.verified;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitle("All Shipments"),
        const SizedBox(height: 16),
        SearchBar(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => Future.sync(_pagingController.refresh),
            child: PagedListView.separated(
              pagingController: _pagingController,
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 12),
              builderDelegate: PagedChildBuilderDelegate<Shipment>(
                itemBuilder:
                    (BuildContext context, Shipment offer, int index) =>
                        ShipmentCard(shipment: offer),
                firstPageErrorIndicatorBuilder: (context) =>
                    ErrorIndicator(onTryAgain: _pagingController.refresh),
                noItemsFoundIndicatorBuilder: (context) =>
                    IntroCards(isVerified: userVerified),
              ),
            ),
          ),
        ),
        DebugBar(),
      ],
    );
  }
}

class DebugBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final token = prefs.getString('token');
              print(token);
            },
            child: Text('get token'),
          ),
          TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.remove('token');
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
            child: Text('logout'),
          ),
        ],
      ),
    );
  }
}
