import 'package:flutter/material.dart';
import 'package:freightcab_shipper/ui/shared/icons.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Track your shipment",
                hintStyle: TextStyle(
                  color: const Color(0xff9BA9C6),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xffEBEBEB),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xffEBEBEB),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                suffixIcon: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xff0F57FB),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: SvgIcons.search,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
