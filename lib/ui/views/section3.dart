import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/stopPoint.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/stop_card.dart';
import 'package:freightcab_shipper/viewmodels/create_shipment.dart';
import 'package:provider/provider.dart';
import '../../models/graphql/q.graphql_api.dart';

class Section3 extends StatefulWidget {
  final List<UserLocations$Query$ShipperLocationProfiles$Data> locations;

  const Section3({Key key, @required this.locations}) : super(key: key);

  @override
  _Section3State createState() => _Section3State();
}

class _Section3State extends State<Section3> {
  void onRemoveTap(BuildContext context, int index) {
    var state = Provider.of<CreateShipmentProvider>(context, listen: false);
    if (state.stopPoints.length == 2) {
      showSnackbar(
        context,
        "Should be min 1 pickup and dropoff",
        false,
      );
      return;
    }
    state.onRemoveStopPointTap(index);
  }

  void onSetLocationTap(BuildContext context, StopPoint item, int index) {
    //TODO:
  }

  void onSetTimeTap(BuildContext context, StopPoint item, int index) {
    //TODO:
  }

  void onEditFacilityTap(BuildContext context, StopPoint item, int index) {
    //TODO:
  }

  @override
  void initState() {
    super.initState();
    final state = Provider.of<CreateShipmentProvider>(context, listen: false);
    // state.stopPoints
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CreateShipmentProvider>(context);
    var lastIndex = state.stopPoints.indexOf(state.stopPoints.last);
    return SliverReorderableList(
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = widget.locations.removeAt(oldIndex);
          var indexOf = state.stopPoints.indexWhere(
            (e) => e.location.id == item.id,
          );
          state.onInsertStopPointTap(
            newIndex,
            state.stopPoints[indexOf],
          );
        });
      },
      itemCount: state.stopPoints.length,
      itemBuilder: (context, index) {
        return StopCard(
          key: ValueKey(index.toString()),
          label: state.stopPoints[index].label,
          locations: widget.locations,
          point: state.stopPoints[index],
          isDraggaable: index != 0 && index != lastIndex,
          childIndex: index,
          onRemoveTap: () => onRemoveTap(context, index),
        );
      },
    );
  }
}
