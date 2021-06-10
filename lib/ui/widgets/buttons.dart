import 'package:flutter/material.dart';

import 'indicators.dart';

class ElevatedWhiteButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const ElevatedWhiteButton({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        side: BorderSide(color: Theme.of(context).primaryColor),
      ),
    );
  }
}

class ElevatedPrimaryButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final bool isLoading;
  final Color bgColor;

  const ElevatedPrimaryButton(
      {Key key,
      @required this.title,
      @required this.onPressed,
      @required this.isLoading,
      this.bgColor = const Color(0xff0f57fb)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 150),
        child: isLoading
            ? Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                child: const ProgressIndicatorSmall(),
              )
            : Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
      ),
      style: ElevatedButton.styleFrom(
        primary: bgColor,
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
      ),
    );
  }
}
