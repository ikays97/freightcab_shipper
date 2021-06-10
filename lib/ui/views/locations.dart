import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/icons.dart';
import 'package:freightcab_shipper/ui/widgets/empty.dart';
import 'package:freightcab_shipper/ui/widgets/location_card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'add_location.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  // paginator
  Future<QueryResult> Function(FetchMoreOptions options) initFetchMore;
  ScrollController _scrollController;
  Widget fetchMoreWidget = Container();
  bool fetchNow = false;
  int perPage = 3;
  int page = 1;
  int currentPage;
  bool hasMorePage = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Query(
      options: WatchQueryOptions(
        document: UserLocationsQuery().document,
        fetchPolicy: FetchPolicy.networkOnly,
        fetchResults: true,
        variables: UserLocationsArguments(first: perPage, page: page).toJson(),
      ),
      builder: (queryResult, {refetch, fetchMore}) {
        if (queryResult.hasException) {
          return GestureDetector(
            onTap: () => refetch(),
            child: Align(
              alignment: Alignment.center,
              child: Text('Something went wrong, tap to try again'),
            ),
          );
        }

        if (queryResult.isLoading && queryResult.data == null) {
          return Center(child: CircularProgressIndicator());
        }

        final result = UserLocations$Query.fromJson(queryResult.data);
        var locations = result.shipperLocationProfiles.data;

        currentPage = result.shipperLocationProfiles.paginatorInfo.currentPage;
        hasMorePage = result.shipperLocationProfiles.paginatorInfo.hasMorePages;

        return ListView(
          controller: _scrollController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
                  child: Text(
                    'Locations',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: ElevatedButton(
                    onPressed: _buildDialog,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgIcons.add,
                        SizedBox(width: 10),
                        Text('Add location'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 14,
                      ),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (locations.length == 0)
              SizedBox(
                height: size.height / 2,
                child: Center(child: const EmptyIndicator()),
              ),
            if (locations.length != 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List<Widget>.generate(locations.length, (index) {
                      return LocationCard(location: locations[index]);
                    }) +
                    [
                      fetchMoreWidget,
                    ],
              ),
          ],
        );
      },
    );
  }

  _buildDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 24.0,
          ),
          elevation: 0,
          child: AddLocationPage(),
        );
      },
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - 50 &&
        !_scrollController.position.outOfRange) {
      print(_scrollController.position.maxScrollExtent);
      // options
      FetchMoreOptions opts = FetchMoreOptions(
        variables: {'page': currentPage + 1},
        updateQuery: (previousResultData, fetchMoreResultData) {
          final List<dynamic> repos = [
            ...previousResultData['userShipments']['data'] as List<dynamic>,
            ...fetchMoreResultData['userShipments']['data'] as List<dynamic>
          ];

          fetchMoreResultData['userShipments']['data'] = repos;

          return fetchMoreResultData;
        },
      );
      print(hasMorePage);
      // init fetch more
      fetchMoreWidget = Column(
        children: [
          AbsorbPointer(
            absorbing: hasMorePage,
            child: AnimatedContainer(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                padding: const EdgeInsets.all(8.0),
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
                child: hasMorePage
                    ? FutureBuilder(
                        future: initFetchMore(opts),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return Text('');
                          }
                        },
                      )
                    : Text('All data fetched')),
          ),
          Padding(padding: const EdgeInsets.only(top: 14)),
        ],
      );
    }
  }
}
