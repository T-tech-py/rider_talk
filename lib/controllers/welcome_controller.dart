import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController{
  static WelcomeController to = Get.find();
  late AnimationController splashAnimationController;
  RxBool isSplashExpanded = false.obs;
  RxBool isSkipDark=false.obs;
  RxBool isLoginLight=false.obs;
  Duration splashTransitionDuration = const Duration(seconds: 1);
  PageController welcomePageController = PageController(initialPage: 0, viewportFraction: 1, keepPage: true);
  int count = 3;


  void goToStartPage(){
    Get.offNamed('/intro-page');
  }

  void goToLoginPage(){
    Get.offNamed('/login');
  }

}