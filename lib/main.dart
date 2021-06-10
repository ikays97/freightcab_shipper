import 'package:flutter/material.dart';
import 'package:freightcab_shipper/ui/shared/options.dart';
import 'package:freightcab_shipper/ui/views/login.dart';
import 'package:freightcab_shipper/ui/views/home.dart';
import 'package:freightcab_shipper/viewmodels/auth_api.dart';
import 'package:freightcab_shipper/viewmodels/create_shipment.dart';
import 'package:freightcab_shipper/viewmodels/edit_shipment.dart';
import 'package:freightcab_shipper/viewmodels/index_provider.dart';
import 'package:freightcab_shipper/viewmodels/push_notification.dart';
import 'package:freightcab_shipper/viewmodels/userlocations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'viewmodels/graphql_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  final PushNotificationService _pushNotificationService =
      PushNotificationService();
  _pushNotificationService.initialise();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IndexProvider()),
        ChangeNotifierProvider(create: (_) => ApiAuth()),
        ChangeNotifierProvider(create: (_) => UserSelectedLocationsProvider()),
        ChangeNotifierProvider(create: (_) => CreateShipmentProvider()),
        ChangeNotifierProvider(create: (_) => EditShipmentProvider())
      ],
      child: SoluchainApp(),
    ),
  );
}

class SoluchainApp extends StatefulWidget {
  @override
  _SoluchainAppState createState() => _SoluchainAppState();
}

class _SoluchainAppState extends State<SoluchainApp> {
  Future<SharedPreferences> prefsFuture;

  Widget buildContent(BuildContext context, SharedPreferences prefs) {
    const localeEn = const Locale('en', 'US');
    const supportedLocales = [localeEn];
    return ModelBinding(
      initialModel: AppSettings(
        theme: genAppLightTheme(appPrimarySwatch),
        locale: localeEn,
      ),
      child: Builder(builder: (context) {
        final settings = AppSettings.of(context);
        final token = prefs?.getString('token');
        final fcmToken = prefs?.getString('fcm_token');
        return GraphQLProvider(
          client: ValueNotifier(graphqlClient),
          child: MaterialApp(
            title: 'Soluchain Shipper',
            debugShowCheckedModeBanner: false,
            theme: settings.theme,
            locale: settings.locale,
            supportedLocales: supportedLocales,
            builder: (context, child) => _Unfocus(child: child),
            home: token != null ? HomeScreen() : AuthorizationScreen(),
            routes: {
              '/home': (context) => HomeScreen(),
              '/login': (context) => AuthorizationScreen(),
            },
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (prefsFuture == null) {
      prefsFuture = SharedPreferences.getInstance();
    }

    return FutureBuilder<SharedPreferences>(
      future: prefsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildContent(context, snapshot.data);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
