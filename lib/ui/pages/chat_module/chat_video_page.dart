import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/splash_module/widgets/widgets.dart';
import 'package:ride_talk/utils/utils.dart';

class ChatVideoPage extends StatelessWidget {
  const ChatVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      appBar: const ApplicationBar(
        title: '',
        backgroundColor: AppColors.cScaffoldColor,
      ),
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (ctx) {
        return Stack(
          children: [
            SizedBox(
              height: AppUtility().contentHeight(context),
              width: AppUtility().contentWidth(context),
              child: CachedNetworkImage(
                imageUrl: 'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Colors.white12,
                        BlendMode.overlay,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) => const LoadingWidget(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 30,
              child: _videoAction(),
            ),
          ],
        );
      }
    );
  }
  Widget _videoAction(){
    return  GetBuilder<ChatController>(
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
            color: AppColors.cPrimaryColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.cGoogleDarkColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: AppColors.cGoogleDarkColor,
                          blurRadius: 15,
                          offset: Offset(1.0, 8.0)
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                  child: SvgPicture.asset(
                    'assets/icons/mobile_icon.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Image.asset(
                  'assets/images/video_camera.png',
                  width: 60,
                ),
              ),
              Image.asset(
                'assets/images/video_chat.png',
                width: 60,
              ),
            ],
          ),
        );
      }
    );
  }

}
