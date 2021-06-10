import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freightcab_shipper/ui/shared/icons.dart';
import 'package:freightcab_shipper/ui/widgets/drawer.dart';
import 'package:freightcab_shipper/viewmodels/index_provider.dart';
import 'package:provider/provider.dart';
import 'notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 64.0,
        title: SvgPicture.asset(
          "assets/svg/logo.svg",
          height: 32,
        ),
        actions: [
          IconButton(
            icon: const Icon(SvgIcons.notifications),
            onPressed: () => scaffoldKey.currentState.openEndDrawer(),
            //TODO tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.66,
            child: Drawer(child: SafeArea(child: DrawerContent()))),
      ),
      endDrawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: Drawer(child: SafeArea(child: NotificationsContent())),
      ),
      endDrawerEnableOpenDragGesture: false,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        child: Consumer<IndexProvider>(
          builder: (_, state, child) {
            return state.getDrawerSelectedIndex.bodyBuilder(context);
          },
        ),
      ),
    );
  }
}
