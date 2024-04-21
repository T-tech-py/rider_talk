import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/chat_controller.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/chat_module/widgets/chat_header.dart';
import 'package:ride_talk/utils/utils.dart';

class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cScaffoldColor,
        appBar: ApplicationBar(
          title: '',
          backgroundColor: AppColors.cScaffoldColor,
          isLeading: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: _showBody(context),
      ),
    );
  }

  Widget _showBody(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: AppDimens.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChatHeader(),
              Flexible(
                child: _showChatList(),
              ),
            ],
          ),
        ),
        Positioned(bottom: 0, left: 0, right: 0, child: _msgSection(context))
      ],
    );
  }

  Widget _msgSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
      width: AppUtility().contentWidth(context),
      color: AppColors.cScaffoldColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
            child: Text(
              'Chris Typing ...',
              style: Styles().h3TextStyle(AppColors.cBorderColor),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormFields(
                    autoFocus: false,
                    isBorder: false,
                    cursorColor: AppColors.cAccentDarkColor,
                    hintText: 'chatDetails.type'.tr,
                    filled: true,
                    hintStyle: Styles().h4TextStyle(AppColors.cTextMediumColor),
                    fieldStyle:
                        Styles().h4TextStyle(AppColors.cAccentDarkColor),
                    fillColor: AppColors.cShadowColor,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: MaterialButton(
                    color: AppColors.cAccentDarkColor,
                    splashColor: AppColors.cAccentDarkColor,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: SvgPicture.asset('assets/icons/send_icon.svg'),
                    onPressed: () {},
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _showChatList() {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: [
          _showFromChat(),
          _showToChat(),
          // _showFromChat(),
          // _showToChat(),
          _showToVideoSection(),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget _showFromChat() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.cTextDarkColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )),
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Suspendisse congue pretium convallis. Sed mauris odio, tristique id sollicitudin',
                    style: Styles().h3TextStyle(AppColors.cPrimaryColor),
                  ),
                ),
              ),
              const Expanded(flex: 1, child: Text(''))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                const Expanded(flex: 1, child: Text('')),
                Expanded(
                    flex: 3,
                    child: Text(
                      '2 min ago',
                      textAlign: TextAlign.start,
                      style: Styles().h4TextStyle(AppColors.cBorderColor),
                    )),
                const Expanded(flex: 1, child: Text('')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _showToChat() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(flex: 1, child: Text('')),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.cShadowColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      )),
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                    style: Styles().h3TextStyle(AppColors.cTextGreyColor),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(flex: 1, child: Text('')),
                Expanded(
                    flex: 3,
                    child: Text(
                      '5 min ago',
                      textAlign: TextAlign.end,
                      style: Styles().h4TextStyle(AppColors.cBorderColor),
                    )),
                const Expanded(flex: 1, child: Text('')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _showToVideoSection() {
    return GetBuilder<ChatController>(builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(flex: 1, child: Text('')),
            Expanded(
              flex: 5,
              child: InkWell(
                onTap: () {
                  ctx.gotoChatVideo();
                },
                child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.cShadowColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        )),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    child: Row(
                      children: [
                        Container(
                            height: 50.0,
                            width: 50.0,
                            margin: const EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffFFB461),
                                      Color(0xffFF9724),
                                    ]),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Transform.scale(
                                scale: 0.5,
                                child: SvgPicture.asset(
                                    'assets/icons/video_call.svg'
                                )
                            )
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'chatDetails.videoChat'.tr,
                              style: Styles().chatTextStyle(AppColors.cCardColor)
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                'chatDetails.callAgain'.tr,
                                style: Styles()
                                    .h4TextStyle(AppColors.cBorderColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ),
            const Expanded(flex: 1, child: Text('')),
          ],
        ),
      );
    });
  }
}
