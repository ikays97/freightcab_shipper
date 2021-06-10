import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freightcab_shipper/ui/widgets/validators.dart';

class MyPhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final String phoneError;
  final Function(String v) onChanged;
  final Function(String v) onSaved;
  final bool isValidate;
  final bool enabled;

  const MyPhoneTextField({
    Key key,
    @required this.controller,
    this.phoneError,
    this.onChanged,
    this.onSaved,
    this.isValidate = true,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      enabled: enabled,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 12, right: 8),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 2),
          child: Text(
            '+ 1  ',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minHeight: 0,
          minWidth: 0,
        ),
        hintText: '(XXX) XXX-XXXX',
        errorText: phoneError,
      ),
      validator: isValidate ? validatePhone : null,
      onChanged: onChanged,
      onSaved: onSaved,
      inputFormatters: [
        LengthLimitingTextInputFormatter(17),
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
