import 'package:flutter/material.dart';

class UnverifiedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      child: Container(
        color: const Color(0xfffffbdb),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Text(
          "You must be verified in order to get quote for your shipment.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
