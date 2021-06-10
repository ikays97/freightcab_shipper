import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/drawer.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/viewmodels/index_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class GetQuote extends StatefulWidget {
  final id;
  final uuid;

  const GetQuote({
    Key key,
    this.id,
    @required this.uuid,
  }) : super(key: key);

  @override
  _GetQuoteState createState() => _GetQuoteState();
}

class _GetQuoteState extends State<GetQuote> {
  bool isLoading = false;

  onGetQuoteTap(RunMutation runMutation) {
    hideKeyboard();
    if (isLoading) {
      return;
    }

    runMutation(GetQuoteArguments(uuid: widget.uuid).toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: GetQuoteMutation().document,
        onCompleted: (dynamic quoteResult) {
          if (quoteResult != null) {
            print(quoteResult);
            quoteCompleted();
          }
        },
        onError: (e) {
          if (e.linkException != null) {
            showSnackbar(
                context,
                'Something went wrong, please check your network connection and try again.',
                false);
            return;
          }

          if (e.graphqlErrors.isNotEmpty) {
            debugPrint(e.graphqlErrors.toString(), wrapWidth: 1024);
          } else {
            showSnackbar(context, 'Something went wrong', false);
          }
        },
      ),
      builder: (runMutation, result) {
        isLoading = result.isLoading;
        return ElevatedButton(
          onPressed: () => onGetQuoteTap(runMutation),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            child: result.isLoading
                ? Theme(
                    data: Theme.of(context).copyWith(accentColor: Colors.white),
                    child: const ProgressIndicatorSmall(),
                  )
                : Text(
                    'Get quote',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
          ),
          style:
              ButtonStyle(padding: MaterialStateProperty.resolveWith((state) {
            return const EdgeInsets.symmetric(horizontal: 22, vertical: 16);
          })),
        );
      },
    );
  }

  quoteCompleted() {
    final state = Provider.of<IndexProvider>(context, listen: false);
    state.setDrawerSelectedIndex = drawerGroups.first.items[2];
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (route) => false,
    );
  }
}
