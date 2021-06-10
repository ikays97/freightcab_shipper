import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/icons.dart';
import 'package:freightcab_shipper/ui/widgets/team_member_card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'add_driver.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Query(
      options: WatchQueryOptions(
        document: MeQuery().document,
        fetchPolicy: FetchPolicy.noCache,
      ),
      builder: (result, {refetch, fetchMore}) {
        if (result.hasException) {
          return GestureDetector(
            onTap: () => refetch(),
            child: Center(
              child: Text('Something went wrong, tap to try again'),
            ),
          );
        }

        if (result.isLoading && result.data == null) {
          return Center(child: CircularProgressIndicator());
        }

        final resultData = Me$Query.fromJson(result.data);
        final drivers = resultData.me.shipper.users;
        final myId = resultData.me.id;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Team',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _buildDialog,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcons.add,
                    const SizedBox(width: 10),
                    Text(
                      'Add shipper',
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 14,
                  ),
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  drivers.length,
                  (index) {
                    return TeamMemberCard(driver: drivers[index], myId: myId);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: AddDriverPage(),
        );
      },
    );
  }
}
