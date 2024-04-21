import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

import 'widgets/social_media_buttons.dart';

class LoginPage extends GetView<ThemeController> {
  final AuthController _authController = AuthController.to;

   LoginPage({Key? key}) : super(key: key);

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
    return Form(
      key: _authController.formKey,
      child: ListView(
        padding: AppDimens.containerPadding,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          _showImage(context),
          _showTitle(),
          _showFields(),
          _buildLoginButton(),
          _showSinUpSection(),
          _showDivider(),
          SocialMediaButtons(
            fbOnPressed: (){},
            gOnPressed: (){},
            tOnPressed: (){}
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }

  Widget _showImage(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top: 10),
        height: AppUtility().contentHeight(context) *.35,
        child: Image.asset('assets/images/login_image.png')
    );
  }

  Widget _showTitle(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'login.welcome'.tr,
            style: Styles().titleHeadingStyle(),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'login.pleaseLogin'.tr,
          style: Styles().descriptionStyle(),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

Widget _showFields(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35.0, bottom: 8.0),
          child: _buildEmailSection(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: _buildPasswordSection(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: _buildForgotPassSection(),
        ),
      ],
    );
}

  Widget _buildEmailSection(){
    return TextFormFields(
      focusNode: _authController.sEmailFocusNode,
      autoFocus: false,
      textInputAction: TextInputAction.next,
      hintText: 'login.email'.tr,
      isPrefixIcon: true,
      filled: false,
      textInputType: TextInputType.emailAddress,
      prefixIcon: Transform.scale(
       scale: 0.32,
        child: SvgPicture.asset('assets/icons/mail_icon.svg')
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    );
  }

  Widget _buildPasswordSection(){
    return GetX<AuthController>(
      builder: (ctx) {
        return TextFormFields(
          obscureText: ctx.isLPassObscure.value,
          focusNode: _authController.sPassFocusNode,
          autoFocus: false,
          textInputAction: TextInputAction.done,
          hintText: 'login.password'.tr,
          hintStyle: const TextStyle(
            fontFamily: AppFonts.robotoRegular,
            fontSize: AppDimens.subTextSize,
            color: AppColors.cTextLightColor,
          ),
          filled: false,
          isPrefixIcon: true,
          textInputType: TextInputType.text,
          prefixIcon: Transform.scale(
           scale: 0.32,
            child: Image.asset('assets/icons/lock_icon.png')
          ),
          isSuffixIcon: true,
          suffixIcon: Transform.scale(
              scale: 0.32,
              child: InkWell(
                onTap: (){
                  ctx.isLPassObscure.value = !ctx.isLPassObscure.value;
                },
                  child: !ctx.isLPassObscure.value
                      ? SvgPicture.asset('assets/icons/eye.svg')
                      : SvgPicture.asset('assets/icons/eye_strike.svg'),
              )
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        );
      }
    );
  }

  Widget _buildForgotPassSection(){
    return Row(
      children: [
        InkWell(
          child: GetX<AuthController>(
            builder: (_){
              return Container(
                height: 18.0,
                width: 18.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.cAccentColor,
                    width: 1.6
                  ),
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: _.onTap.value
                    ? const Icon(Icons.check,size: 13,color: AppColors.cAccentColor,)
                    : null,
              );
            },
          ),
          onTap: (){
            _authController.onTap.value = !_authController.onTap.value;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left:6.0),
          child: Text(
            'login.rememberMe'.tr,
            style: Styles().subHeaderStyle(
                AppColors.cAccentColor,
                AppDimens.subTextSize,
                AppFonts.robotoRegular
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: (){
            Get.toNamed('/forgot-pass');
          },
          child: Text(
            'login.forgotPass'.tr,
            style: Styles().subHeaderStyle(
                AppColors.cTextMediumColor,
                AppDimens.subTextSize,
                AppFonts.robotoRegular
            ),
          )
        )
      ],
    );
  }

  Widget _buildLoginButton(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: [
          const Expanded(flex: 1,child: Text('')),
          Expanded(
            flex: 9,
            child: PrimaryButton(
              text: 'login.login'.tr,
              onPressed: () {
                _authController.goToDashboardPage();
              },
            ),
          ),
          const Expanded(flex: 1,child: Text('')),
        ],
      ),
    );
  }

  Widget _showSinUpSection(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'login.notAMember'.tr,
          style: Styles().mediumTextStyle(
              AppColors.cTextMediumColor
          ),
          children: <TextSpan>[
            TextSpan(
                text: 'signUp.signUp'.tr,
                style: Styles().mediumTextStyle(
                    AppColors.cPrimaryColor
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                  _authController.goToSignUpPage();
                  }
            )
          ]
      ),
    );
  }

  Widget _showDivider(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0),
      child: Row(
        children: [
          const Expanded(child: Divider(thickness: 1,color: AppColors.cTextMediumColor,)),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
             'login.or'.tr,
              style: Styles().subHeaderStyle(
                  AppColors.cPrimaryColor,
                  AppDimens.subTextSize,
                  AppFonts.robotoRegular
              ),
            ),
          ),
          const Expanded(child: Divider(thickness: 1,color: AppColors.cTextMediumColor,)),
        ],
      ),
    );
  }

}
