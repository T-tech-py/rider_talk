import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/profile_module/widgets/refer_app_buttons.dart';
import 'package:ride_talk/utils/utils.dart';

class ReferPage extends GetView<LanguageController> {
  final ProfileController _profileController = ProfileController.to;

   ReferPage({Key? key}) : super(key: key);

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
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context){
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: AppDimens.pagePadding,
      children: [
        _showTitle(),
        _showReferImage(),
        _showReferCodeCard(),
        _showReferContent(),
        SizedBox(
          height: AppUtility().contentWidth(context) *.25,
        ),
        _showSocialMediaButtons(),
      ],
    );
  }

  Widget _showTitle(){
    return Text(
      'profile.refer'.tr,
      style: Styles().subHeaderStyle(
          AppColors.cBackgroundColor,
          AppDimens.minTextSize,
          AppFonts.poppinsRegular
      ),
    );
  }

  Widget _showReferImage(){
    return Stack(
      children: [
        Center(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 150.0,
              width: 150.0,
              child: Image.asset('assets/images/refer_circle.png')
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/refer_icon.svg',
                color: AppColors.cAccentColor,
              ),
            )
        )
      ],
    );
  }

  Widget _showReferCodeCard(){
    return Container(
      margin: const EdgeInsets.only(left: 35.0,right: 35.0,top: 30.0,bottom: 50.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
      decoration: BoxDecoration(
        color: AppColors.cBackgroundColor,

        borderRadius: BorderRadius.circular(8.0)
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'refer.referral'.tr,
            style: Styles().h6TextStyle(
                AppColors.cPrimaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Text(
              AppStrings.referCode,
              style: Styles().codeStyle(),
            ),
          )
        ],
      ),
    );
  }

  Widget _showReferContent(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30.0),
      child: Text(
        'refer.content'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.cTextMediumColor,
          fontSize: AppDimens.h3Size,
          fontFamily: AppFonts.robotoRegular,
          height: 1.5
        ),
      ),
    );
  }

  Widget _showSocialMediaButtons(){
    return ReferAppButtons(
      fbOnPressed: (){
        _profileController.fbURL();
      },
      whatsAppPressed: (){
        _profileController.whatsAppURL();
      },
      tOnPressed: (){
        _profileController.twitterURL();
      },
      otherPressed: (){
        _profileController.twitterURL();
      }
    );
  }

}
