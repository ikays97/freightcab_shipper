import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

FToast fToast;

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

void navigateTo(BuildContext context, WidgetBuilder builder) {
  Navigator.push<dynamic>(
      context, MaterialPageRoute<dynamic>(builder: builder));
}

void showSnackbar(BuildContext context, String message, bool success) {
  fToast = FToast();
  fToast.init(context);
  // ScaffoldMessenger.of(context)
  //   ..hideCurrentSnackBar()
  //   ..showSnackBar(SnackBar(content: Text(message)));
  Widget toast = Container(
    margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: success ? Color(0xFF5588FD) : Color(0xFFFD6C6C),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          success ? Icons.check : Icons.cancel_outlined,
          color: Colors.white,
        ),
        SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: Text(
            message,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.SNACKBAR,
    toastDuration: Duration(seconds: 3),
  );
}

void hideKeyboard({BuildContext context}) {
  if (context == null) {
    FocusManager.instance.primaryFocus?.unfocus();
  } else {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

String findValidationErrorOrNull(
    List<GraphQLError> graphqlErrors, String field) {
  for (var e in graphqlErrors) {
    final extensions = e.extensions;
    if (extensions != null) {
      print(extensions);
      dynamic validation = extensions['validation'];
      if (validation != null && validation is Map<String, dynamic>) {
        dynamic fieldValidationErrors = validation[field];
        if (fieldValidationErrors != null && fieldValidationErrors is List) {
          dynamic firstError = fieldValidationErrors.isNotEmpty
              ? fieldValidationErrors[0]
              : null;
          if (firstError != null && firstError is String) {
            return firstError;
          }
        }
      }
    }
  }
  return null;
}

Map<String, String> findValidationErrors(
    List<GraphQLError> graphqlErrors, List<String> fields) {
  final fieldErrors = <String, String>{};
  for (var e in graphqlErrors) {
    final extensions = e.extensions;
    if (extensions != null) {
      dynamic validation = extensions['validation'];
      if (validation != null && validation is Map<String, dynamic>) {
        for (var field in fields) {
          dynamic fieldValidationErrors = validation[field];
          if (fieldValidationErrors != null && fieldValidationErrors is List) {
            dynamic firstError = fieldValidationErrors.isNotEmpty
                ? fieldValidationErrors[0]
                : null;
            if (firstError != null && firstError is String) {
              fieldErrors[field] = firstError;
            }
          }
        }
      }
    }
  }
  return fieldErrors;
}

String getCurrentTimeOfDay() {
  final partsOfDay = [
    {'from': 0, 'to': 4, 'message': "Good night"},
    {'from': 5, 'to': 11, 'message': "Good morning"},
    {'from': 12, 'to': 17, 'message': "Good afternoon"},
    {'from': 18, 'to': 24, 'message': "Good evening"},
  ];

  final hour = DateTime.now().hour;

  return partsOfDay.firstWhere(
      (e) => (e['from'] as int) <= hour && hour <= e['to'])['message'];
}

String getMaskedData(String unFormattedText) {
  var b = unFormattedText.characters.map((char) {
    // return char;
    var a = int.tryParse(char);
    return a;
  });
  var c = b.where((element) => element != null);
  var result = c.toList().join('');
  return result;
}

int intParse(String input) {
  int result;
  if (input != null && input != '') {
    result = int.tryParse(input);
  } else {
    result = 0;
  }
  return result;
}

int castToInt(dynamic value) {
  return (value is int) ? value : (int.tryParse(value.toString()) ?? 0);
}

extension DateFormatter on DateTime {
  String format(String format) {
    return DateFormat(format).format(this);
  }
}

String dateTimeFormat(DateTime dateTime, String format) {
  final DateFormat formatter = DateFormat(format);
  String formatted = formatter.format(dateTime);
  return formatted;
}

///Converts DateTime to ISO format
///"2021-05-03T13:53:12+05:00"
///Output: 2020-09-16T20:41:09.331+05:30
String formatISOTime(DateTime date) {
  DateFormat formatter = DateFormat('yyyy-MM-ddThh:mm:ss');
  final String formatted = formatter.format(date);
  var duration = date.timeZoneOffset;
  if (duration.isNegative)
    return (formatted +
        "-${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
  else
    return (formatted +
        "+${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
}

LatLngBounds boundsFromLatLngList(List<LatLng> list) {
  assert(list.isNotEmpty);
  double x0, x1, y0, y1;
  for (LatLng latLng in list) {
    if (x0 == null) {
      x0 = x1 = latLng.latitude;
      y0 = y1 = latLng.longitude;
    } else {
      if (latLng.latitude > x1) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > y1) y1 = latLng.longitude;
      if (latLng.longitude < y0) y0 = latLng.longitude;
    }
  }
  return LatLngBounds(northeast: LatLng(x1, y1), southwest: LatLng(x0, y0));
}

String tinEinMask(String pattern) {
  bool isTin = pattern.substring(0, 3) == "TIN";
  String tin = pattern.substring(4);
  String tinPattern = isTin
      ? "${tin.substring(0, 3)}-" +
          "${tin.substring(3, 6)}-" +
          "${tin.substring(6, 9)}"
      : "${tin.substring(0, 2)}-" + "${tin.substring(2)}";
  return tinPattern;
}

String convertMintoDay(dynamic m) {
  if (m == null) {
    return '';
  }

  var n = double.tryParse((m is int) ? m.toString() : m);
  if (n == null) {
    return '';
  }

  int day = n ~/ (24 * 60); // 1

  n = n % (24 * 60);
  int hour = n ~/ 60;

  n = n % 60;
  int minutes = n.toInt();

  String dayText = day != 0 ? "$day day " + plural(day) : '';
  String hourText = hour != 0 ? "$hour hour" + plural(hour) : '';
  String minuteText = minutes != 0 ? "$minutes minute" + plural(minutes) : '';

  return dayText + hourText + minuteText;
}

String plural(dynamic n) {
  if (n != null) {
    if (n > 1)
      return 's ';
    else
      return ' ';
  }
  return '';
}

String getFirstLetters(String text) {
  List<String> list = text.split(' ');
  return list.map((e) => e[0]).join('');
}
