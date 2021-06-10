import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freightcab_shipper/constants/enums/accessory.dart';
import 'package:freightcab_shipper/constants/enums/item_unit.dart';
import 'package:freightcab_shipper/constants/enums/piece_type.dart';
import 'package:freightcab_shipper/models/accessories.dart';
import 'package:freightcab_shipper/ui/widgets/labeled_check_box.dart';
import 'package:freightcab_shipper/ui/widgets/text_fields.dart';
import 'package:freightcab_shipper/ui/widgets/validators.dart';
import 'package:freightcab_shipper/viewmodels/create_shipment.dart';
import 'package:provider/provider.dart';

class Section2 extends StatefulWidget {
  @override
  _Section2State createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  TextEditingController descriptionController;
  TextEditingController shortController;
  TextEditingController weightController;
  TextEditingController quantityController;
  TextEditingController packingController;
  TextEditingController loadDescController;

  @override
  void initState() {
    super.initState();
    final state = Provider.of<CreateShipmentProvider>(context, listen: false);
    descriptionController = TextEditingController(text: state.descSaved);
    shortController = TextEditingController(text: state.shortSaved);
    weightController = TextEditingController(text: state.weightSaved);
    quantityController = TextEditingController(text: state.quantitySaved);
    packingController = TextEditingController(text: state.packingSaved);
    loadDescController = TextEditingController(text: state.loadDescSaved);
    state.accessoriesList.addAll(Accessory.values.map((e) {
      return Accessories(type: e, label: e.text);
    }).toList());
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CreateShipmentProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: "Commodity Info",
                children: [
                  TextSpan(
                    text: '  (optional)',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                errorText: state.descError,
              ),
              onChanged: (v) {
                setState(() {
                  state.setDesc = v;
                });
              },
              onSaved: (v) {
                setState(() {
                  state.setDesc = v;
                });
              },
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                        text: "Tracking ID",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: shortController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          errorText: state.shortError,
                        ),
                        onChanged: (v) {
                          if (state.shortError != null)
                            setState(() => state.setTrackIDError = null);
                        },
                        onSaved: (v) => state.setTrackID = v,
                        inputFormatters: [
                          UpperCaseTextFormatter(),
                          LengthLimitingTextInputFormatter(5)
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weight",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          suffix: Text('LB'),
                          errorText: state.weightError,
                          hintText: '0',
                        ),
                        validator: validateWeight,
                        onChanged: (v) {
                          if (state.weightError != null)
                            setState(() => state.weightError = null);
                        },
                        onSaved: (v) => state.setWeight = v,
                        inputFormatters: [LengthLimitingTextInputFormatter(5)],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                "Item quantity",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TODO: dropdown units
                      TextFormField(
                        controller: quantityController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorText: state.quantityError,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                        ),
                        onChanged: (v) {
                          if (state.quantityError != null)
                            setState(() => state.quantityError = null);
                        },
                        onSaved: (v) => state.setQuantity = v,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        DropdownButtonFormField<ItemUnit>(
                          isDense: true,
                          value: state.selectedQuantityType,
                          onChanged: (v) => state.setQuantityType = v,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                          ),
                          items: ItemUnit.values.map((e) {
                            return DropdownMenuItem(
                              child:
                                  Text(e.text, style: TextStyle(fontSize: 14)),
                              value: e,
                            );
                          }).toList(),
                        ),
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                "Item packaging",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: packingController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorText: state.packingError,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                        ),
                        onChanged: (v) {
                          if (state.packingError != null)
                            setState(() => state.packingError = null);
                        },
                        onSaved: (v) => state.setPacking = v,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        DropdownButtonFormField<PieceType>(
                          isDense: true,
                          value: state.selectedPackageType,
                          onChanged: (v) => state.setPackingType = v,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                          ),
                          items: PieceType.values.map((e) {
                            return DropdownMenuItem(
                              child: Text(e.text),
                              value: e,
                            );
                          }).toList(),
                        ),
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Accessories & credentials",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: state.accessoriesList.map((e) {
                return LabeledCheckbox(
                  value: e.isChecked,
                  padding: const EdgeInsets.all(0),
                  onChanged: (bool v) {
                    setState(() {
                      e.isChecked = !e.isChecked;
                    });
                  },
                  label: Text(e.label),
                );
              }).toList(),
            ),
            Text(
              "Load Description",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: loadDescController,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
              maxLines: 3,
              maxLength: 250,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                errorText: state.loadDescError,
              ),
              onChanged: (v) {
                if (state.loadDescError != null)
                  setState(() => state.loadDescError = null);
              },
              onSaved: (v) => state.setLoadDesc = v,
            ),
          ],
        ),
      ),
    );
  }
}
