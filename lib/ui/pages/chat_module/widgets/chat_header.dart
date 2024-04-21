import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/chat_controller.dart';
import 'package:ride_talk/utils/utils.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _showChatHeader();
  }

  Widget _showChatHeader() {
    return Row(
      children: [
        Expanded(flex: 4, child: _showRiderName()),
        Expanded(flex: 0, child: _showChatOption()),
      ],
    );
  }

  Widget _showRiderName() {
    return Text(
      'chat.title'.tr,
      style: Styles().pageHeading(),
    );
  }

  Widget _showChatOption() {
    return GetBuilder<ChatController>(
        builder: (ctx) {
        return Row(
          children: [
            InkWell(
              onTap: (){
                ctx.gotoChatVideo();
              },
              child: Image.asset(
                'assets/images/phone_btn.png',
                width: 40.0,
              ),
            ),
            const SizedBox(width: 10.0),
            InkWell(
              onTap: (){
                ctx.gotoChatVideo();
              },
              child: Image.asset(
                'assets/images/video_btn.png',
                width: 40.0,
              ),
            ),

          ],
        );
      }
    );
  }

}
