import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/buttons.dart';
import 'package:freightcab_shipper/ui/widgets/drawer.dart';
import 'package:freightcab_shipper/viewmodels/index_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class BookShipment extends StatefulWidget {
  final String uuid;

  const BookShipment({Key key, @required this.uuid}) : super(key: key);

  @override
  _BookShipmentState createState() => _BookShipmentState();
}

class _BookShipmentState extends State<BookShipment> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: BookShipmentMutation().document,
        onCompleted: (dynamic result) {
          if (result != null) {
            print(result);
            bookCompleted();
          }
        },
        onError: (e) => print(e),
      ),
      builder: (runMutation, result) {
        isLoading = result.isLoading;
        return AbsorbPointer(
          absorbing: result.isLoading,
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
                const SizedBox(height: 10),
                Text('Do you really want to book this shipment?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedWhiteButton(
                        title: "No",
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedPrimaryButton(
                        title: "Yes",
                        isLoading: isLoading,
                        onPressed: () {
                          hideKeyboard();

                          if (isLoading) {
                            return;
                          }

                          runMutation(BookShipmentArguments(uuid: widget.uuid)
                              .toJson());
                        },
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

  bookCompleted() {
    final state = Provider.of<IndexProvider>(context, listen: false);
    state.setDrawerSelectedIndex = drawerGroups.first.items[2];
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (route) => false,
    );
  }
}
