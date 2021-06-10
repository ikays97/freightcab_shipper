import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class NotificationsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO complete pagination
    //TODO lce
    return Query(
      options: QueryOptions(
        document: NotificationsQuery().document,
        fetchPolicy: FetchPolicy.networkOnly,
        variables: NotificationsArguments(
          first: 1,
          page: 1,
          unread: true,
        ).toJson(),
      ),
      builder: (result, {refetch, fetchMore}) {
        if (result.hasException) {
          //TODO error widget
          return GestureDetector(
            onTap: () => refetch(),
            child: Center(child: Text('Smth went wrong')),
          );
        }

        if (result.isLoading && result.data == null) {
          //TODO loading widget
          return Center(child: CircularProgressIndicator());
        }
        final resultData = Notifications$Query.fromJson(result.data);

        final int nextPage =
            resultData.userNotifications.paginatorInfo.currentPage + 1;

        final items = resultData.userNotifications.data;

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text('Notifications',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  // if (index == 0) {
                  //   return
                  // }

                  // index = index - 1;

                  return InkWell(
                    onTap: () {
                      //TODO
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DecoratedBox(
                        position: DecorationPosition.foreground,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: Divider.createBorderSide(context))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: [
                              Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  color: Color(0xff0f57fb),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Center(
                                  //TODO use from assets
                                  child: Icon(Icons.arrow_upward_rounded,
                                      size: 20, color: Colors.white),
                                ),
                              ),
                              SizedBox(width: 8),
                              //TODO 'Your Quote - #QOTE-4325 is sent to admin'
                              Expanded(
                                child: Text(
                                  items[index].data.title,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
