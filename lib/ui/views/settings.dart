import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/models/notification_subscription.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/views/profile_info.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<NotificationSubscription> subscriptions;
  bool queryLoading = false;
  bool mutationLoading = false;
  bool _isNotificationsPage = false;

  Widget _buildNotificationsForm(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: NotificationSubsciptionQuery().document,
        fetchPolicy: FetchPolicy.cacheAndNetwork,
        variables: NotificationSubsciptionArguments(subscribed: true).toJson(),
      ),
      builder: (QueryResult result, {Refetch refetch, FetchMore fetchMore}) {
        if (result.hasException) {
          print(result.exception);
          return GestureDetector(
            onTap: () => refetch(),
            child: Center(child: Text('Tap to refetch notification settings')),
          );
        }

        if (result.isLoading && result.data == null) {
          return Center(child: CircularProgressIndicator());
        }

        subscriptions = List.from(
          result.data['userNotificationSubscriptions'].map(
            (json) => NotificationSubscription(json: json),
          ),
        );

        queryLoading = result.isLoading;

        return Stack(
          children: [
            Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FixedColumnWidth(50),
                    2: FixedColumnWidth(50),
                  },
                  children: <TableRow>[
                        TableRow(
                          children: [
                            Text('Type'),
                            Text('Email', textAlign: TextAlign.center),
                            Text('Sms', textAlign: TextAlign.center),
                          ],
                        ),
                      ] +
                      NotificationSubscription.predefinedNotifications.entries
                          .map((e) {
                        bool mailChecked = subscriptions.firstWhere(
                                (NotificationSubscription el) =>
                                    el.channel == 'mail' &&
                                    describeEnum(el.type) == e.key,
                                orElse: () => null) !=
                            null;
                        bool smsChecked = subscriptions.firstWhere(
                                (NotificationSubscription el) =>
                                    el.channel == 'sms' &&
                                    describeEnum(el?.type) == e.key,
                                orElse: () => null) !=
                            null;

                        return TableRow(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(e.value['name']),
                            ),
                            _buildCheckbox(mailChecked,
                                {'type': e.key, 'channel': 'mail'}, refetch),
                            _buildCheckbox(smsChecked,
                                {'type': e.key, 'channel': 'sms'}, refetch),
                          ],
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xffEBEBEB),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
            if (queryLoading || mutationLoading)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  child: Center(child: CircularProgressIndicator()),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: MeQuery().document,
        fetchPolicy: FetchPolicy.cacheAndNetwork,
      ),
      builder: (result, {refetch, fetchMore}) {
        if (result.hasException) {
          print(result.exception);
          return GestureDetector(
            onTap: () => refetch(),
            child:
                Center(child: Text('Something went wrong, tap to try again')),
          );
        }

        if (result.isLoading && result.data == null) {
          return Center(child: CircularProgressIndicator());
        }

        final resultData = Me$Query.fromJson(result.data);
        var me = resultData.me;
        var addressIsNull = me.shipper.address == null;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Settings',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_isNotificationsPage) {
                              setState(() {
                                _isNotificationsPage = false;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: _isNotificationsPage
                                  ? Color(0xfffafafa)
                                  : Color(0xff0f57fb),
                              onPrimary: _isNotificationsPage
                                  ? Colors.black
                                  : Colors.white),
                          icon: Icon(Icons.person_outline_rounded),
                          label: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: Text(
                              'Profile info',
                              style: TextStyle(
                                  color: _isNotificationsPage
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (!_isNotificationsPage) {
                              setState(() {
                                _isNotificationsPage = true;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: _isNotificationsPage
                                  ? Color(0xff0f57fb)
                                  : Color(0xfffafafa),
                              onPrimary: _isNotificationsPage
                                  ? Colors.white
                                  : Colors.black),
                          icon: Icon(Icons.notifications_outlined),
                          label: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: Text(
                              'Notificaitons',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _isNotificationsPage
                      ? _buildNotificationsForm(context)
                      : ProfileForm(me: me),
                ),
                SizedBox(height: 56),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckbox(bool value, Map<String, dynamic> subscribeRunMutation,
      Function refetchQuery) {
    return Mutation(
      options: MutationOptions(
        document: value
            ? UnSubscribeNotificationMutation().document
            : SubscribeNotificationMutation().document,
        fetchPolicy: FetchPolicy.networkOnly,
        onCompleted: (dynamic result) {
          refetchQuery();
          showSnackbar(context, "Subscription updated successfully", true);
        },
        onError: (OperationException e) {
          print(e);
          if (e.linkException != null) {
            showSnackbar(
                context,
                'Something went wrong, please check your network connection and try again.',
                false);
            return;
          }
          if (e.graphqlErrors.isNotEmpty) {
            showSnackbar(
                context,
                e.graphqlErrors[0].message?.toUpperCase() ??
                    'Something went wrong',
                false);
          } else {
            showSnackbar(context, 'Something went wrong', false);
          }
        },
      ),
      builder: (RunMutation runMutation, QueryResult result) {
        mutationLoading = result.isLoading;
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Checkbox(
            value: value,
            onChanged: (_) {
              runMutation(subscribeRunMutation);
            },
          ),
        );
      },
    );
  }
}
