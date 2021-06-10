import 'package:flutter/material.dart';

import 'buttons.dart';

class DefaultAlertDialog extends StatelessWidget {
  final String contextText;
  final String rejectButtonText;
  final Widget confirmWidget;

  const DefaultAlertDialog({
    Key key,
    @required this.contextText,
    @required this.rejectButtonText,
    @required this.confirmWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
            Text(contextText,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedWhiteButton(
                    title: rejectButtonText,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(child: confirmWidget),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
