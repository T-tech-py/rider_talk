import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_config_flavor.dart';
import 'main_app.dart';


void mainAppInit() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  //     statusBarColor: cPrimaryColor, // Color for Android
  //     statusBarIconBrightness: cPrimaryBrightnessDark,
  //     statusBarBrightness:
  //     cPrimaryBrightness // Dark == white status bar -- for IOS.
  // ));
  //TODO: dio initialization here
}

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<void> main() async {
  Config.appFlavor = Flavor.DEVELOPMENT;
  // await DotEnv.load(fileName: ".env");

  // await Sentry.init(
  //       (options) {
  //     options.dsn = DotEnv.env['GUST_SENTRY_DSN'];
  //   },
  // );
  // Init your App.
  initApp();
}

void initApp() {
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // Sentry.
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  runZonedGuarded<Future<void>>(() async {
    mainAppInit();
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]).then((_) {
      runApp(const MainApp());
    });
  }, (error, stackTrace) async {
    _reportError(error, stackTrace);
  });
}

/// Reports [error] along with its [stackTrace] to Sentry.io.
Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  print('Caught error: $error');

  // Errors thrown in development mode are unlikely to be interesting. You can
  // check if you are running in dev mode using an assertion and omit sending
  // the report.
  if (isInDebugMode) {
    print(stackTrace);
    print('In dev mode. Not sending report to Sentry.io.');
    return;
  }

  print('Reporting to Sentry.io...');

  // await Sentry.captureException(
  //   error,
  //   stackTrace: stackTrace,
  // );
}