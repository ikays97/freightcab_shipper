import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  final Widget label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  const LabeledCheckbox({
    @required this.label,
    @required this.padding,
    @required this.value,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            SizedBox(
              width: Checkbox.width + 8,
              child: Checkbox(value: value, onChanged: onChanged),
            ),
            SizedBox(width: 8),
            Expanded(child: label),
          ],
        ),
      ),
    );
  }
}
