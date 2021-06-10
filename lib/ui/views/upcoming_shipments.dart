import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/models/paginator.dart';
import 'package:freightcab_shipper/models/shipment.dart';
import 'package:freightcab_shipper/ui/widgets/Shipment_card.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/ui/widgets/page_title.dart';
import 'package:freightcab_shipper/ui/widgets/search_bar.dart';
import 'package:freightcab_shipper/viewmodels/graphql_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UpcomingShipmentsPage extends StatefulWidget {
  @override
  _UpcomingShipmentsPageState createState() => _UpcomingShipmentsPageState();
}

class _UpcomingShipmentsPageState extends State<UpcomingShipmentsPage> {
  final _pagingController = PagingController<int, Shipment>(firstPageKey: 1);

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
        variables: UserShipmentsArguments(
          states: [
            ShipmentStatusEnum.created,
            ShipmentStatusEnum.requestInProgress,
            ShipmentStatusEnum.priceDefined,
            ShipmentStatusEnum.priceAccepted,
            ShipmentStatusEnum.unassigned,
            ShipmentStatusEnum.carrierAssigned,
          ],
          first: 5,
          page: pageKey,
        ).toJson(),
      ),
    );

    if (result.hasException) {
      _pagingController.error = result.exception;
    } else {
      debugPrint(result.data.toString(), wrapWidth: 1024);
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitle("Upcoming"),
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
                    ErrorIndicator(errorType: ErrorType.EmptyBox),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
