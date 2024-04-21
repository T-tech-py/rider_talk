import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  static ProfileController to = Get.find();
  RxBool trafficSwitch = false.obs;
  RxBool cacheSwitch = false.obs;
  RxBool notificationSwitch = false.obs;
  RxBool driverSwitch = false.obs;
  // RxBool isSetFSeat = false.obs;
  RxBool isSet1Seat = false.obs;
  RxBool isSet2Seat = false.obs;
  RxBool isSet3Seat = false.obs;
  RxBool isSet4Seat = true.obs;

  final List<String> icons = [
    'promo_code',
    'refer',
    'payment',
    'terms',
    'settings',
    'logout',
  ];

  final List<String> ratingList = [
   'rating.service',
   'rating.car',
   'rating.route',
  ];

  final List<String> ratingIconList = [
    'good_service',
    'car_image',
    'location',
  ];

  final String _fbUrl = 'https://www.facebook.com/';
  final String _twitterUrl = 'https://twitter.com/';
  final String _whatsAppUrl = 'https://www.whatsapp.com/';

  void fbURL() async =>
      await canLaunch(_fbUrl)
          ? await launch(_fbUrl)
          : throw 'Could not launch $_fbUrl';
  
  void twitterURL() async =>
      await canLaunch(_twitterUrl)
          ? await launch(_twitterUrl)
          : throw 'Could not launch $_twitterUrl';

  void whatsAppURL() async =>
      await canLaunch(_whatsAppUrl)
          ? await launch(_whatsAppUrl)
          : throw 'Could not launch $_whatsAppUrl';

  void gotoWalletPage(){
    Get.toNamed('/wallet');
  }

  void gotoPaymentPage(){
    Get.toNamed('/payment');
  }

  void gotoBookingSuccess(){
    Get.toNamed('/booking-success');
  }

  void gotoOrderConfirmPage(){
    Get.toNamed('/order-confirm');
  }

  void gotoDriverProfile(){
    Get.toNamed('/driver-profile');
  }




  void selectSeat(int ch){
    switch(ch){
      case 1: isSet1Seat.value = true;
              isSet2Seat.value = false;
              isSet3Seat.value = false;
              isSet4Seat.value = false;
              break;
      case 2: isSet1Seat.value = false;
              isSet2Seat.value = true;
              isSet3Seat.value = false;
              isSet4Seat.value = false;
              break;
      case 3: isSet1Seat.value = false;
              isSet2Seat.value = false;
              isSet3Seat.value = true;
              isSet4Seat.value = false;
              break;
      case 4: isSet1Seat.value = false;
              isSet2Seat.value = false;
              isSet3Seat.value = false;
              isSet4Seat.value = true;
              break;
      default:
            isSet1Seat.value = true;
            isSet2Seat.value = false;
            isSet3Seat.value = false;
            isSet4Seat.value = false;
    }
  }



}