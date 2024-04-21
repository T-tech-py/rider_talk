import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DashboardController extends GetxController {
  static DashboardController to = Get.find();
  var tabIndex = 0;
  late TabController pageController;
  RxBool onClick = false.obs;
  RxBool isCurrentRide = true.obs;
  final String title = 'Home Title';
  FocusNode locationFromFocusNode = FocusNode();
  FocusNode locationToFocusNode = FocusNode();
  final PersistentTabController controller = PersistentTabController(initialIndex: 0);

  Completer<GoogleMapController> mapController = Completer();

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  late String mapStyle;


@override
  void onReady() {
  rootBundle.loadString('assets/styles/styles.txt').then((string) {
    mapStyle = string;
  });
    super.onReady();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void goToHome(){
    Get.back();
  }

  void goToShareRide(){
    Get.toNamed('/share-ride');
  }

  void gotoSearchResult(){
    Get.toNamed('/search-result');
  }

  void goToPromoCode(){
    Get.toNamed('/promo-code');
  }

  void gotoChat(){
    Get.toNamed('/chat');
  }
  void gotoChatVideo(){
    Get.toNamed('/chat-video');
  }

  void gotoBookingSuccess(){
    Get.toNamed('/booking-success');
  }

  void gotoSeatSelection(){
    Get.toNamed('/seat-selection-page');
  }


  void onSelectDate(DateRangePickerSelectionChangedArgs args){
    // print(args.value.startDate);
    // print(args.value.endDate);
    print(args.value);
  }

}
