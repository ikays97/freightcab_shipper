import 'package:flutter/material.dart';

class EmptyIndicator extends StatelessWidget {
  const EmptyIndicator({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/png/nodata.png"),
        const SizedBox(height: 14),
        Text(
          "No data available in table",
          style: TextStyle(
            color: Color(0xff9BA9C6),
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
