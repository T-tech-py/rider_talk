import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/splash_module/widgets/widgets.dart';
import 'package:ride_talk/utils/utils.dart';

class NotificationPage extends GetView<LanguageController> {
  const NotificationPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      appBar: ApplicationBar(
        title: '',
        backgroundColor: AppColors.cScaffoldColor,
        isLeading: true,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)
        ),
      ),
      body: _showBody(),
    );
  }

  Widget _showBody(){
    return Padding(
      padding: AppDimens.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _showTitle(),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                _showNotificationList(),
                const SizedBox(height: 120,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _showTitle(){
    return Text(
      'app.notification'.tr,
      style: Styles().subHeaderStyle(
          AppColors.cTextColor,
          AppDimens.minTextSize,
          AppFonts.poppinsRegular
      ),
    );
  }

  Widget _showNotificationList(){
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 25.0),
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context,int index){
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.cPrimaryColor,
          ),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _showImage(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _showContent(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _showTime(),
                            const Spacer(),
                            _showButton()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
        );
      }
    );
  }

  Widget _showImage(){
    return CircleAvatar(
      radius: 30.0,
      child: CachedNetworkImage(
        imageUrl: 'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.white60,
                BlendMode.overlay,
              ),
            ),
          ),
        ),
        placeholder: (context, url) => const LoadingWidget(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _showContent(){
    return const Text(
      AppStrings.arrivingDetails,
      style: TextStyle(
          color: AppColors.cTextColor,
          fontSize: AppDimens.subTextSize,
          fontFamily: AppFonts.robotoRegular,
          height: 1.3
      ),
    );
  }

  Widget _showTime(){
    return Text(
      AppStrings.timeAgo,
      style: Styles().subHeaderStyle(
          AppColors.cBorderColor,
          AppDimens.subTextSize,
          AppFonts.robotoRegular
      ),
    );
  }

  Widget _showButton(){
    return MaterialButton(
      padding: EdgeInsets.zero,
      elevation: 0,
      height: 25,
      color: AppColors.cGreenLightColor,
      child: Text(
        'notification.complete'.tr,
        style: Styles().subHeaderStyle(
          AppColors.cGreenColor,
          AppDimens.minSmallTextSize,
          AppFonts.robotoRegular,
        ),
      ),
      onPressed: (){},
    );
  }

}
