import 'package:flutter/material.dart';
import 'package:freightcab_shipper/ui/shared/icons.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22, bottom: 8),
          child: Text('How it works',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PngIcons.howto1,
                const SizedBox(height: 8),
                Text('1. Explore guaranteed rates',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 8),
                Text(
                  'Tell us about your pickup and dropoff locations and pick your preferred dates based on pricing',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                PngIcons.howto2,
                const SizedBox(height: 8),
                Text('2. Review your quote',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 8),
                Text(
                  'Take a look at your final quote and provide more information about your shipment’s facilities',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                PngIcons.howto3,
                const SizedBox(height: 8),
                Text('3. Finalize the details',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 8),
                Text(
                  'Add additional details to create your shipment and let us know if you have any questions',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
