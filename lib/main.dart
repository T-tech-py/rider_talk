import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ride_talk/utils/app_colors.dart';

import 'controllers/controllers.dart';
import 'launcher/app_config_flavor.dart';
import 'launcher/main_app.dart';

Future<void> main() async {
  Config.appFlavor = Flavor.RELEASE;
  await GetStorage.init();
  _initController();
  _initApp();
}

void mainAppInit() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Color for Android
      systemNavigationBarColor: AppColors.cBackgroundColor,
      systemNavigationBarIconBrightness: AppColors.cPrimaryBrightness,
      statusBarIconBrightness: AppColors.cPrimaryBrightness,
      statusBarBrightness: AppColors.cPrimaryBrightnessDark // Dark == white status bar -- for IOS.
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: [SystemUiOverlay.top]);
}

void _initController(){
  Get.put<WelcomeController>(WelcomeController());
  Get.put<AuthController>(AuthController());
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());
  Get.put<DashboardController>(DashboardController());
  Get.put<ProfileController>(ProfileController());
  Get.put<ChatController>(ChatController());
}

void _initApp() {
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (Config.isDebug) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };
  runZonedGuarded<Future<void>>(() async {
    mainAppInit();
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]).then((_) {
      runApp(const MainApp());
    });
  }, (error, stackTrace) async {
    _reportError(error, stackTrace);
  });
}

/// Reports [error] along with its [stackTrace] to Error report system.
Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  debugPrint('Caught error: $error');
  if (Config.isDebug) {
    debugPrint(stackTrace);
    debugPrint('In dev mode. Not sending report to Error report system.');
    return;
  }
  debugPrint('Reporting to Error report system...');
}