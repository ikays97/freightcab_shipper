import 'package:freightcab_shipper/ui/shared/extensions.dart';

String validatePhone(String value) {
  // TODO: value
  if (value == null || value.isEmpty) return 'Enter phone number';
  if (getMaskedData(value).length != 10) {
    return "invalid phone";
  }
  return null;
}

String validateTinEin(String value) {
  if (value == null || value.isEmpty) {
    //TODO: value
    return 'Enter your TIN/EIN number';
  }
  return null;
}

String validateFirstName(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter your name';
  } else if (value.contains(RegExp(r'[0-9]'))) {
    return "Doesn't support numbers";
  }
  return null;
}

String validateCommon(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter some text';
  }
  return null;
}

String validateLastName(String value) {
  if (value == null || value.isEmpty) {
    //TODO: value
    return 'Enter your surname';
  }
  return null;
}

String validateEmail(String value) {
  if (value == null || value.isEmpty) {
    //TODO: value
    return 'Enter a valid email';
  } else if (!value.contains('@') || !value.contains('.')) {
    return 'Invalid email';
  }
  return null;
}

String validateCompanyName(String value) {
  if (value == null || value.isEmpty) {
    //TODO: value
    return 'Enter your company name';
  }
  return null;
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

String validateLocationName(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter a location name';
  }
  return null;
}

String validateAddress(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter a valid address';
  }
  return null;
}

String validateState(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter a valid state name';
  }
  return null;
}

String validateCity(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter a valid city name';
  }
  return null;
}

String validateStreet(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter street name';
  }
  return null;
}

String validateZip(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter zip number';
  }
  return null;
}

String validateStreetNo(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter street number';
  }
  return null;
}

String validateLat(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter latitude';
  }
  return null;
}

String validateLng(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter longitude';
  }
  return null;
}

String validateWeight(String value) {
  if (int.tryParse(value) != null && int.tryParse(value) > 55000) {
    return 'Must be less than 55000';
  }
  return null;
}

String validateMin(String value) {
  if (value == null || value.isEmpty) {
    return 'Enter min';
  }
  return null;
}
