import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/shared/icons.dart';
import 'package:freightcab_shipper/ui/views/all_shipments.dart';
import 'package:freightcab_shipper/ui/views/create_shipment.dart';
import 'package:freightcab_shipper/ui/views/faq.dart';
import 'package:freightcab_shipper/ui/views/in_progress_shipments.dart';
import 'package:freightcab_shipper/ui/views/locations.dart';
import 'package:freightcab_shipper/ui/views/past_shipments.dart';
import 'package:freightcab_shipper/ui/views/settings.dart';
import 'package:freightcab_shipper/ui/views/teams.dart';
import 'package:freightcab_shipper/ui/views/upcoming_shipments.dart';
import 'package:freightcab_shipper/viewmodels/auth_api.dart';
import 'package:freightcab_shipper/viewmodels/index_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerItem {
  final String title;
  final Widget icon;
  final WidgetBuilder bodyBuilder;

  const DrawerItem({
    @required this.title,
    @required this.icon,
    @required this.bodyBuilder,
  });
}

class DrawerGroup {
  final String title;
  final List<DrawerItem> items;

  const DrawerGroup({@required this.title, @required this.items});
}

final drawerGroups = [
  DrawerGroup(
    title: 'Shipments',
    items: [
      DrawerItem(
        title: 'All shipments',
        icon: SvgIcons.allShipments,
        bodyBuilder: (context) => AllShipmentsPage(),
      ),
      DrawerItem(
        title: 'In progress',
        icon: SvgIcons.inProgressShipments,
        bodyBuilder: (context) => InprogressShipments(),
      ),
      DrawerItem(
        title: 'Upcoming',
        icon: SvgIcons.upcomingShipments,
        bodyBuilder: (context) => UpcomingShipmentsPage(),
      ),
      DrawerItem(
        title: 'Past',
        icon: SvgIcons.pastShipments,
        bodyBuilder: (context) => PastShipmentsPage(),
      ),
    ],
  ),
  DrawerGroup(
    title: 'Help',
    items: [
      DrawerItem(
        title: 'Team',
        icon: SvgIcons.team,
        bodyBuilder: (context) => TeamPage(),
      ),
      DrawerItem(
        title: 'Locations',
        icon: SvgIcons.location,
        bodyBuilder: (context) => LocationPage(),
      ),
      DrawerItem(
        title: 'FAQ',
        icon: SvgIcons.faq,
        bodyBuilder: (context) => FaqPage(),
      ),
      DrawerItem(
        title: 'Settings',
        icon: SvgIcons.settings,
        bodyBuilder: (context) => SettingsPage(),
      ),
    ],
  )
];

class DrawerContent extends StatefulWidget {
  @override
  _DrawerContentState createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  final formKey = GlobalKey<FormState>();

  void closeDrawer() {
    Navigator.of(context).pop();
  }

  void onDrawerItemTap(DrawerItem item) {
    closeDrawer();
    final state = Provider.of<IndexProvider>(context, listen: false);
    setState(() {
      state.setDrawerSelectedIndex = item;
    });
  }

  void onLogoutTap() async {
    closeDrawer();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
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
                  'Do you really want to logout?',
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
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final state = Provider.of<IndexProvider>(context,
                              listen: false);
                          state.setDrawerSelectedIndex =
                              drawerGroups.first.items.first;
                          final prefs = await SharedPreferences.getInstance();
                          prefs.remove('token');
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        },
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 150),
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.resolveWith<EdgeInsets>(
                                  (states) {
                            return EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            );
                          }),
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
  }

  @override
  Widget build(BuildContext context) {
    final indexState = Provider.of<IndexProvider>(context);
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

        if (result.data == null || result.data['me'] == null) {
          ApiAuth.logout();
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
          return SizedBox.shrink();
        }

        final resultData = Me$Query.fromJson(result.data);

        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: getCurrentTimeOfDay() + ', ',
                          style: const TextStyle(
                              color: Color(0xff9ba9c6),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          //TODO from profile
                          text: resultData.me.firstname,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Icon(
                              Icons.check_circle,
                              color: resultData.me.shipper.verified
                                  ? Theme.of(context).colorScheme.primary
                                  : Color(0xff9BA9C6),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 18,
                      ),
                    ),
                    onPressed: () {
                      closeDrawer();
                      navigateTo(context, (_) => CreateShipmentScreen());
                    },
                    icon: SvgIcons.createAdd,
                    label: Text('Create shipment',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListTileTheme(
                  contentPadding: const EdgeInsets.only(left: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: List<Widget>.generate(drawerGroups.length,
                              (index) {
                            final group = drawerGroups[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                        top: 8,
                                        bottom: 22,
                                      ),
                                      child: Text(
                                        group.title.toUpperCase(),
                                        style: const TextStyle(
                                            color: Color(0xff9ba9c6),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ] +
                                  List.generate(
                                    group.items.length,
                                    (index) {
                                      final item = group.items[index];
                                      int currentIndex = group.items.indexOf(
                                          indexState.getDrawerSelectedIndex);
                                      return InkWell(
                                        onTap: () => onDrawerItemTap(item),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 22, bottom: 11, top: 11),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    width: 30,
                                                    child: item.icon),
                                                const SizedBox(width: 12),
                                                Text(
                                                  item.title,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Spacer(),
                                                if (currentIndex == index)
                                                  Container(
                                                    width: 4,
                                                    height: 25,
                                                    color: Color(0xff0f57fb),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                  ),
                                              ]),
                                        ),
                                      );
                                    },
                                  ),
                            );
                          }) +
                          [
                            InkWell(
                              onTap: () => onLogoutTap(),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 22, bottom: 11, top: 11),
                                child: Row(
                                  children: [
                                    SizedBox(width: 30, child: SvgIcons.logout),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Log out',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  closeDrawer();
                  _buildNeedHelpDialog(context);
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xff0f57fb).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.headset_mic_rounded,
                            size: 32, color: Color(0xff0F57FB)),
                        SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Need help?',
                              style: TextStyle(
                                  color: Color(0xff0F57FB),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Contact with us',
                              style: TextStyle(
                                  color: Color(0xff0F57FB),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildNeedHelpDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: _dialogContent(context),
        );
      },
    );
  }

  _dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Need Help?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.topRight,
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: const Color(0xFF727272),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Text(
              'Choose the way to contact us. We will be pleased to help you 24/7.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () => _makePhoneCall('tel:+1532642125'),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Call us now',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '+1 (532) 642-1254',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            InkWell(
              onTap: () {
                final Uri _emailLaunch = Uri(
                  scheme: 'mailto',
                  path: "help@freightcab.com",
                );

                launch(_emailLaunch.toString());
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Send us mail',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'help@freightcab.com',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
