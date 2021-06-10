import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/shared/icons.dart';
import 'package:freightcab_shipper/ui/views/create_shipment.dart';
import 'package:freightcab_shipper/ui/views/home.dart';
import 'package:freightcab_shipper/viewmodels/index_provider.dart';
import 'package:provider/provider.dart';

import 'drawer.dart';

class IntroCards extends StatefulWidget {
  final bool isVerified;

  const IntroCards({Key key, @required this.isVerified}) : super(key: key);
  @override
  _IntroCardsState createState() => _IntroCardsState();
}

class _IntroCardsState extends State<IntroCards> {
  bool showCreate = true;
  bool showReview = true;
  bool showUnverified = true;

  void onTap() {
    var state = Provider.of<IndexProvider>(context, listen: false);
    state.setDrawerSelectedIndex = drawerGroups.last.items.last;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showCreate)
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Welcome to Freightcab",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () => setState(() => showCreate = !showCreate),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.cancel_outlined),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 9),
                    Text(
                      "Create, Get quote, Track, and Rate your shipments here. Let's create your shipment to get started!",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 9),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 18,
                          ),
                        ),
                        onPressed: () =>
                            navigateTo(context, (_) => CreateShipmentScreen()),
                        icon: SvgIcons.createAdd,
                        label: Text('Create shipment',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (showReview)
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/svg/warehouse.svg"),
                        Spacer(),
                        GestureDetector(
                          onTap: () => setState(() => showReview = !showReview),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.cancel_outlined),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 9),
                    Text(
                      "Application review & Credit check",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      "We will contact you at your primary email address when your account has been verified, or if additional information is needed.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 9)
                  ],
                ),
              ),
            ),
          if (showUnverified && !widget.isVerified)
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 18,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/verify.svg"),
                          Spacer(),
                          GestureDetector(
                            onTap: () => setState(
                                () => showUnverified = !showUnverified),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.cancel_outlined),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 9),
                      Text(
                        "You are not Verified",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 9),
                      Text(
                        "Fill up the forms inside the Profile section about your company which simplifies and accelerates the verification of your account in order to create a shipment.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
