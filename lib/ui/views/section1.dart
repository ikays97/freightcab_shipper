import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freightcab_shipper/constants/enums/temperature_unit.dart';
import 'package:freightcab_shipper/ui/widgets/validators.dart';
import 'package:freightcab_shipper/viewmodels/create_shipment.dart';
import 'package:provider/provider.dart';

class Section1 extends StatefulWidget {
  @override
  _Section1State createState() => _Section1State();
}

class _Section1State extends State<Section1> {
  final temperatureMaxController = TextEditingController();
  final temperatureMinController = TextEditingController();
  bool isMultipleStops = false;
  bool isReefer = false;
  TemperatureUnit selectedTempType;

  @override
  void initState() {
    super.initState();
    final state = Provider.of<CreateShipmentProvider>(context, listen: false);

    // booleans
    isMultipleStops = state.isMultipleStops;
    isReefer = state.isReefer;

    // selected temperature
    selectedTempType = state.selectedTempType;
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CreateShipmentProvider>(context);
    // booleans
    isMultipleStops = state.isMultipleStops;
    isReefer = state.isReefer;

    // selected temperature
    selectedTempType = state.selectedTempType;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select shipment type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (isMultipleStops) {
                        state.setMultipleOrNot = false;
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 120),
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        border: isMultipleStops
                            ? Border.all(color: Color(0xffebebeb))
                            : null,
                        color: isMultipleStops
                            ? Color(0xfffafafa)
                            : Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/p2p.svg",
                            color: isMultipleStops
                                ? Colors.black
                                : Theme.of(context).colorScheme.onPrimary,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Point to point',
                            style: TextStyle(
                              color: isMultipleStops
                                  ? Colors.black
                                  : Theme.of(context).colorScheme.onPrimary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (!isMultipleStops) {
                        state.setMultipleOrNot = true;
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 120),
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isMultipleStops
                            ? Theme.of(context).colorScheme.primary
                            : Color(0xfffafafa),
                        border: isMultipleStops
                            ? null
                            : Border.all(color: Color(0xffebebeb)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //TODO icon
                          SvgPicture.asset(
                            "assets/svg/p2m.svg",
                            color: isMultipleStops
                                ? Theme.of(context).colorScheme.onPrimary
                                : Colors.black,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Multiple stops',
                            style: TextStyle(
                              color: isMultipleStops
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Select truck type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (isReefer) {
                        state.setReeferOrNot = false;
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 120),
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        border: isReefer
                            ? Border.all(color: Color(0xffebebeb))
                            : null,
                        color: isReefer
                            ? Color(0xfffafafa)
                            : Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/truck.svg",
                            color: isReefer
                                ? Colors.black
                                : Theme.of(context).colorScheme.onPrimary,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Dry van',
                            style: TextStyle(
                              color: isReefer
                                  ? Colors.black
                                  : Theme.of(context).colorScheme.onPrimary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (!isReefer) {
                        state.setReeferOrNot = true;
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 120),
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isReefer
                            ? Theme.of(context).colorScheme.primary
                            : Color(0xfffafafa),
                        border: isReefer
                            ? null
                            : Border.all(color: Color(0xffebebeb)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/snowflake.svg",
                              color: isReefer
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Colors.black),
                          const SizedBox(width: 8),
                          Text(
                            'Reefer',
                            style: TextStyle(
                              color: isReefer
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (isReefer)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: temperatureMinController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          errorText: state.minError,
                          hintText: 'min',
                        ),
                        validator: validateMin,
                        onChanged: (v) {
                          if (state.minError != null) {
                            setState(() => state.setMinError = null);
                          }
                        },
                        onSaved: (v) {
                          setState(() {
                            state.minSaved = v;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: temperatureMaxController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          errorText: state.maxError,
                          hintText: 'max',
                        ),
                        validator: validateCommon,
                        onChanged: (v) {
                          if (state.maxError != null) {
                            setState(() => state.setMaxError = null);
                          }
                        },
                        onSaved: (v) {
                          setState(() {
                            state.maxSaved = v;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: DropdownButtonFormField<TemperatureUnit>(
                        value: selectedTempType,
                        onChanged: (v) {
                          setState(() {
                            state.setTemperatureType = v;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                        ),
                        items: TemperatureUnit.values.map((type) {
                          return DropdownMenuItem(
                            child: Text(type.text),
                            value: type,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
