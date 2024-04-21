import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthController extends GetxController{
  static AuthController to = Get.find();
  String email='';
  String password='';
  String phoneNumber='';
  String forgetEmail='';
  RxBool isMale=true.obs;
  RxBool onClick = false.obs;
  RxBool onTap = false.obs;
  Rx<bool> isLPassObscure  = true.obs;
  Rx<bool> isSPassObscure  = true.obs;
  final GlobalKey<FormState> forgotPassKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  int index = 0;
  StreamController<ErrorAnimationType>? errorController;
  FocusNode nameFocusNode = FocusNode();
  FocusNode sEmailFocusNode=FocusNode();
  FocusNode sPassFocusNode=FocusNode();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passFocusNode=FocusNode();
  FocusNode forgetEmailFocusNode=FocusNode();
  late Position currentLocation;

  @override
  void onInit() {
    errorController = StreamController<ErrorAnimationType>();
    super.onInit();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }



  void goToSignUpPage(){
    Get.toNamed('/sign-up');
  }

  void goToLoginPage(){
    Get.toNamed('/login');
  }
  
  void goToCheckEmailPage(){
    Get.toNamed('/check-email');
  }
  
  void goToMobileVerifyPage(){
    Get.toNamed('/mobile-verify');
  }

  void goToEnableLocationPage(){
    Get.toNamed('/enable-location');
  }

  void goToGenderSelectionPage(){
    Get.toNamed('/gender-page');
  }

  void goToDashboardPage(){
    Get.offNamed('/dashboard');
  }

  Future<void> checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    currentLocation= await Geolocator.getCurrentPosition();
    print('LOCATION SUCCESS');
    print(currentLocation);
  }

}