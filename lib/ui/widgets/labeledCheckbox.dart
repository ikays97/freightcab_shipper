import 'package:flutter/material.dart';

class LabeledCheckbox2 extends StatelessWidget {
  const LabeledCheckbox2({
    this.label,
    this.contentPadding,
    this.value,
    this.onTap,
    this.activeColor,
    this.fontSize,
    this.gap = 4.0,
    this.bold = false,
  });

  final Widget label;
  final EdgeInsets contentPadding;
  final bool value;
  final Function onTap;
  final Color activeColor;
  final double fontSize;
  final double gap;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(!value),
      child: Padding(
        padding: contentPadding ?? const EdgeInsets.all(0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Checkbox(
              value: value,
              activeColor: activeColor,
              visualDensity: VisualDensity.compact,
              onChanged: (val) => onTap(val),
            ),
            SizedBox(
              width: gap,
            ), // you can control gap between checkbox and label with this field
            Flexible(child: label),
          ],
        ),
      ),
    );
  }
}
