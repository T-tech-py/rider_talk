import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/chat_module/widgets/chat_header.dart';
import 'package:ride_talk/ui/pages/chat_module/widgets/contact_card.dart';
import 'package:ride_talk/utils/utils.dart';

class ChatListPage extends GetView<LanguageController> {
  final ChatController _chatController = ChatController.to;

   ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cScaffoldColor,
        appBar: const ApplicationBar(
          title: '',
          backgroundColor: AppColors.cScaffoldColor,
        ),
        body: _showBody(context),
      ),
    );
  }

  Widget _showBody(BuildContext context) {
    return Padding(
      padding: AppDimens.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChatHeader(),
              _showCodeField(),
            ],
          ),
          Flexible(
            child: ListView(
              children: [
                _buildContactList(),
                const SizedBox(height: 50,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _showCodeField() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0,bottom: 20),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextFormFields(
                  autoFocus: false,
                  isBorder: false,
                  cursorColor: AppColors.cAccentDarkColor,
                  hintText: 'chat.search'.tr,
                  filled: true,
                  hintStyle: Styles().h4TextStyle(AppColors.cTextMediumColor),
                  fieldStyle: Styles().h4TextStyle(AppColors.cAccentDarkColor),
                  fillColor: AppColors.cShadowColor,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              )
          ),
          Expanded(
            flex: 1,
            child: MaterialButton(
              color: AppColors.cAccentDarkColor,
              splashColor: AppColors.cAccentDarkColor,
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: const Icon(Icons.search_outlined),
              onPressed: () {},
            )
          ),
        ],
      ),
    );
  }

  Widget _buildContactList() {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 20.0),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              _chatController.goToChatDetails();
            },
              child: const ContactCard(),
          );
        }
    );
  }
}
