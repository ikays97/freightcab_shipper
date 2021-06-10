import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PngIcons {
  PngIcons._();

  // 50dp
  static Image _pngAsset(String assetPath) => Image.asset(assetPath);

  static Widget get howto1 => _pngAsset("assets/png/howto1.png");
  static Widget get howto2 => _pngAsset("assets/png/howto2.png");
  static Widget get howto3 => _pngAsset("assets/png/howto3.png");
}

class SvgIcons {
  static const notifications = Icons.notifications;

  static Widget get search => _svgAsset24dp('assets/svg/search.svg');

  static Widget get createAdd => _svgAsset24dp('assets/svg/createAdd.svg');

  static Widget get add => _svgAsset24dp('assets/svg/add.svg');

  static Widget get clock => _svgAsset24dp('assets/svg/clock.svg');

  static Widget get allShipments =>
      _svgAsset24dp('assets/svg/all_shipments.svg');

  static Widget get inProgressShipments =>
      _svgAsset24dp('assets/svg/in_progress_shipments.svg');

  static Widget get upcomingShipments =>
      _svgAsset24dp('assets/svg/upcoming_shipments.svg');

  static Widget get pastShipments =>
      _svgAsset24dp('assets/svg/past_shipments.svg');

  static Widget get faq => _svgAsset24dp('assets/svg/faq.svg');

  static Widget get terms => _svgAsset24dp('assets/svg/terms.svg');

  static Widget get settings => _svgAsset24dp('assets/svg/settings.svg');

  static Widget get logout => _svgAsset24dp('assets/svg/logout.svg');

  static Widget get calendar => _svgAsset24dp('assets/svg/ic_calendar.svg');

  static Widget get team => _svgAsset24dp('assets/svg/users.svg');

  static Widget get arrowUp => _svgAsset24dp('assets/svg/arrow_up.svg');

  static Widget get trash => _svgAsset18dp('assets/svg/trash.svg');

  static Widget get edit => _svgAsset18dp('assets/svg/edit.svg');

  // unused ones:
  static Widget get p2p => _svgAsset18dp('assets/svg/p2p.svg');

  static Widget get p2m => _svgAsset18dp('assets/svg/p2m.svg');

  static Widget get mPoints => _svgAsset18dp('assets/svg/mpoints.svg');

  static Widget get van => _svgAsset18dp('assets/svg/truck.svg');

  static Widget get reefer => _svgAsset18dp('assets/svg/snowflake.svg');

  static Widget get location => _svgAsset24dp('assets/svg/location.svg');

  // 24dp
  static SvgPicture _svgAsset24dp(String assetPath) =>
      SvgPicture.asset(assetPath, width: 24, height: 24);

  // 18dp
  static SvgPicture _svgAsset18dp(String assetPath) =>
      SvgPicture.asset(assetPath, width: 18, height: 18);

  SvgIcons._();
}
