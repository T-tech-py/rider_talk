import 'package:get/get.dart';

class ChatController extends GetxController{
  static ChatController to = Get.find();


  void gotoChat(){
    Get.toNamed('/chat');
  }

  void goToChatDetails(){
    Get.toNamed('/chat-details');
  }

  void gotoChatVideo(){
    Get.toNamed('/chat-video');
  }
}