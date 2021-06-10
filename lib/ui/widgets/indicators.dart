import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freightcab_shipper/ui/shared/options.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ErrorIndicator extends StatelessWidget {
  final ErrorType errorType;
  final Function onTryAgain;
  final String error;

  const ErrorIndicator({
    Key key,
    this.errorType,
    this.onTryAgain,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/svg/errors/' + errorType.icon + '.svg',
              width: 220),
          SizedBox(height: 20),
          Text(error ?? errorType.message,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          SizedBox(height: 24),
          if (onTryAgain != null)
            SizedBox(
              height: 52,
              width: 180,
              child: TextButton(
                onPressed: onTryAgain,
                child: Text('Try again', style: TextStyle(fontSize: 17)),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(appPrimaryColorValue),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

enum ErrorType {
  ServerError,
  NetworkError,
  EmptyBox,
}

extension ErrorTypeExtension on ErrorType {
  String get icon {
    switch (this) {
      case ErrorType.NetworkError:
        return 'connection';
      case ErrorType.EmptyBox:
        return 'empty';
      default:
        return 'server';
    }
  }

  String get message {
    switch (this) {
      case ErrorType.NetworkError:
        return 'No internet connection';
      case ErrorType.EmptyBox:
        return 'Not Found';
      default:
        return 'Service Unavailable';
    }
  }
}

class ProgressIndicatorSmall extends StatelessWidget {
  const ProgressIndicatorSmall();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22.0,
      height: 22.0,
      child: CircularProgressIndicator(strokeWidth: 2.5),
    );
  }
}
