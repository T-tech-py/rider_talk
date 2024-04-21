import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

class CheckEmailPage extends StatelessWidget {
  final AuthController _authController = AuthController.to;

   CheckEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.cBackgroundColor,
        body: _showBody(context),
      ),
    );
  }

  Widget _showBody(BuildContext context){
    return Container(
      padding: AppDimens.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _showImage(context),
          _showTitleSection(),
          const Spacer(),
          _buildContinueButton(),
        ],
      ),
    );
  }

  Widget _showImage(BuildContext context){
    return Container(
      height: AppUtility().contentWidth(context) *.9,
      padding:AppDimens.containerPadding,
      child: Image.asset('assets/images/email_check.png'),
    );
  }

  Widget _showTitleSection(){
    return Column(
      children: [
        _showTitle(),
        _showDescription(),
      ],
    );
  }

  Widget _showTitle(){
    return Text(
      'checkEmail.title'.tr,
      style: Styles().titleHeadingStyle(),
      textAlign: TextAlign.center,
    );
  }

  Widget _showDescription(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0,top: 10.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'checkEmail.Des1'.tr,
            style: Styles().subHeaderStyle(
                AppColors.cTextMediumColor,
                AppDimens.subTextSize,
                AppFonts.robotoRegular
            ),
            children: <TextSpan>[
              TextSpan(
                  // text: AppStrings.emailText,
                text: _authController.forgetEmail,
                  style: Styles().subHeaderStyle(
                      AppColors.cAccentColor,
                      AppDimens.subTextSize,
                      AppFonts.robotoRegular
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {}
              ),
              TextSpan(
                  text: 'checkEmail.Des2'.tr,
                  style: Styles().subHeaderStyle(
                      AppColors.cTextMediumColor,
                      AppDimens.subTextSize,
                      AppFonts.robotoRegular
                  ),
              )
            ]
        ),
      ),
    );
  }

  Widget _buildContinueButton(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 70.0,right: 10.0,left: 10.0),
      child: PrimaryButton(
        text: 'checkEmail.continue'.tr,
        onPressed: () {
          _authController.goToMobileVerifyPage();
        },
      ),
    );
  }

}
