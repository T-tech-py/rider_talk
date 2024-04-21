import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

class TermsPage extends GetView<LanguageController> {
  const TermsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      appBar: ApplicationBar(
        backgroundColor: AppColors.cScaffoldColor,
        title: '',
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
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: AppDimens.pagePadding,
      children: [
        _showTitle(),
        _showTermsImage(),
        _showSubHeading(),
        _showFirstContent(),
        _showSecondContent(),
        _showFinalContent(),
        const SizedBox(height: 50,)
      ],
    );
  }

  Widget _showTitle(){
    return Text(
      'terms.title'.tr,
      style: Styles().h1TitleStyle(),
    );
  }

  Widget _showTermsImage(){
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom:40.0),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
                height: 150.0,
                width: 150.0,
                child: Image.asset('assets/icons/terms_circle.png')
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Center(
                child: Image.asset('assets/icons/file_icon.png',height: 60,),
              )
          )
        ],
      ),
    );
  }

  Widget _showSubHeading(){
    return Text(
      'terms.subTitle'.tr,
      style: Styles().h3TextStyle(AppColors.cTextDarkColor),
    );
  }

  Widget _showFirstContent(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:15.0),
      child: Text(
        'terms.paragraph1'.tr,
        style: Styles().pTextStyleWithH(
          AppColors.cTextMediumColor,
          1.8
        ),
      ),
    );
  }

  Widget _showSecondContent(){
    return Text(
      'terms.paragraph2'.tr,
      style: Styles().pTextStyleWithH(
          AppColors.cTextMediumColor,
          1.8
      ),
    );
  }

  Widget _showFinalContent(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20.0),
      child: Text(
        'terms.paragraph3'.tr,
        style: Styles().pTextStyleWithH(
            AppColors.cTextMediumColor,
            1.8
        ),
      ),
    );
  }

}