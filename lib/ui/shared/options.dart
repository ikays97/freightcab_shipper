import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String _appFontFamily = 'IBMPlexSans';
const String googleMapApiKey = "AIzaSyDyTmeFXw83O3hC1zjETWI9ZQaYMknjmfM";

const int appPrimaryColorValue = 0xff0f57fb;
const MaterialColor appPrimarySwatch = MaterialColor(
  appPrimaryColorValue,
  <int, Color>{
    50: Color(0xffe2ebff),
    100: Color(0xffb7cdfe),
    200: Color(0xff87abfd),
    300: Color(0xff5789fc),
    400: Color(0xff3370fc),
    500: Color(appPrimaryColorValue),
    600: Color(0xff0d4ffa),
    700: Color(0xff0b46fa),
    800: Color(0xff083cf9),
    900: Color(0xff042cf8),
  },
);

TextTheme _lightTextTheme(Typography typography) {
  final textTheme = typography.black;
  return textTheme.apply(
    fontFamily: _appFontFamily,
    displayColor: Color(0xff161616),
    bodyColor: Color(0xff161616),
  );
}

ThemeData genAppLightTheme(MaterialColor primarySwatch) {
  final typography = Typography.material2014();
  final lightTextTheme = _lightTextTheme(typography);
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: _appFontFamily,
    typography: typography,
    textTheme: lightTextTheme,
    primarySwatch: primarySwatch,
    canvasColor: const Color(0xffeff2f8),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: const EdgeInsets.only(left: 12, right: 8),
      filled: true,
      fillColor: Color(0xffFAFAFA),
      border: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      backgroundColor: Colors.white,
      foregroundColor: Color(0xff161616),
    ),
    // This makes the visual density adapt to the platform that you run
    // the app on. For desktop platforms, the controls will be smaller and
    // closer together (more dense) than on mobile platforms.
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: Map.fromIterable(
        TargetPlatform.values,
        key: (dynamic e) => e as TargetPlatform,
        value: (dynamic e) => CupertinoPageTransitionsBuilder(),
      ),
    ),
  );
}

class AppSettings {
  final ThemeData theme;
  final Locale locale;

  const AppSettings({
    @required this.theme,
    @required this.locale,
  });

  SystemUiOverlayStyle resolvedSystemUiOverlayStyle() {
    return theme.brightness == Brightness.dark
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;
  }

  AppSettings copyWith({
    ThemeData theme,
    Locale locale,
  }) {
    return AppSettings(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettings && theme == other.theme && locale == other.locale;

  @override
  int get hashCode => theme.hashCode ^ locale.hashCode;

  static AppSettings of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, AppSettings newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    scope.modelBindingState.updateModel(newModel);
  }
}

class _ModelBindingScope extends InheritedWidget {
  final _ModelBindingState modelBindingState;

  _ModelBindingScope({
    Key key,
    @required this.modelBindingState,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  final AppSettings initialModel;
  final Widget child;

  ModelBinding({
    Key key,
    @required this.initialModel,
    @required this.child,
  }) : super(key: key);

  @override
  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  AppSettings currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(AppSettings newModel) {
    if (currentModel != newModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(
      modelBindingState: this,
      child: widget.child,
    );
  }
}
