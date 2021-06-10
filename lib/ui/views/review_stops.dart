import 'package:flutter/material.dart';
import 'package:freightcab_shipper/ui/widgets/viewStopCard.dart';

import '../../models/graphql/q.graphql_api.dart';

class StopsBody extends StatefulWidget {
  final List<UserShipment$Query$UserShipment$Stops> locations;

  const StopsBody({Key key, @required this.locations}) : super(key: key);

  @override
  _StopsBodyState createState() => _StopsBodyState();
}

class _StopsBodyState extends State<StopsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.locations.length, (index) {
        final item = widget.locations[index];
        return StopCard2(
          label: item.type == StopTypesEnum.dropoff ? 'Drop off' : 'Pick up',
          point: item,
          childIndex: index,
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
