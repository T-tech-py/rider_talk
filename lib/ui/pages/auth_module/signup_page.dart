import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/auth_controller.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

import 'widgets/social_media_buttons.dart';

class SignUpPage extends StatelessWidget {
  final AuthController _authController=AuthController.to;

   SignUpPage({Key? key}) : super(key: key);

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
      key: _authController.signUpFormKey,
      child: ListView(
        padding: AppDimens.pagePadding,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          _showImage(context),
          _showTitle(),
          _buildNameSection(),
          _buildEmailSection(),
          _buildPasswordSection(),
          _buildSignUpButton(),
          _showSignInSection(),
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
        child: Image.asset('assets/images/signup_image.png')
    );
  }

  Widget _showTitle(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: Text(
            'signUp.createProfile'.tr,
            style: Styles().titleHeadingStyle(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Text(
            'signUp.createProfileText'.tr,
            style: Styles().descriptionStyle(),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  Widget _buildNameSection(){
    return TextFormFields(
      autoFocus: false,
      focusNode: _authController.nameFocusNode,
      hintText: 'signUp.name'.tr,
      isPrefixIcon: true,
      filled: false,
      textInputType: TextInputType.text,
      prefixIcon: Transform.scale(
          scale: 0.32,
          child: SvgPicture.asset('assets/icons/user.svg')
      ),
      textInputAction: TextInputAction.newline,
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    );
  }

  Widget _buildEmailSection(){
    return Padding(
      padding: const EdgeInsets.only(top:17.0),
      child: TextFormFields(
        autoFocus: false,
        focusNode: _authController.emailFocusNode,
        hintText: 'login.email'.tr,
        isPrefixIcon: true,
        filled: false,
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.newline,
        prefixIcon: Transform.scale(
            scale: 0.32,
            child: SvgPicture.asset('assets/icons/mail_icon.svg')
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }

  Widget _buildPasswordSection(){
    return GetX<AuthController>(
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical:17.0),
          child: TextFormFields(
            obscureText: ctx.isSPassObscure.value,
            autoFocus: false,
            focusNode: _authController.passFocusNode,
            hintText: 'login.password'.tr,
            filled: false,
            isPrefixIcon: true,
            textInputType: TextInputType.text,
            prefixIcon: Transform.scale(
                scale: 0.32,
                child: Image.asset('assets/icons/lock_icon.png')
            ),
            isSuffixIcon: true,
            textInputAction: TextInputAction.done,
            suffixIcon: InkWell(
              onTap: (){
                ctx.isSPassObscure.value = !ctx.isSPassObscure.value;
              },
              child: Transform.scale(
                  scale: 0.32,
                  child: !ctx.isSPassObscure.value
                      ? SvgPicture.asset('assets/icons/eye.svg')
                      : SvgPicture.asset('assets/icons/eye_strike.svg')
              ),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
        );
      }
    );
  }

  Widget _buildSignUpButton(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          const Expanded(flex: 1,child: Text('')),
          Expanded(
            flex: 9,
            child: PrimaryButton(
              text: 'signUp.signUp'.tr,
              onPressed: () {
                _authController.goToCheckEmailPage();
              },
            ),
          ),
          const Expanded(flex: 1,child: Text('')),
        ],
      ),
    );
  }

  Widget _showSignInSection(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'login.notAMember'.tr,
          style: Styles().mediumTextStyle(
              AppColors.cTextMediumColor
          ),
          children: <TextSpan>[
            TextSpan(
                text: 'signUp.signIn'.tr,
                style: Styles().mediumTextStyle(
                    AppColors.cPrimaryColor
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _authController.goToLoginPage();
                  }
            )
          ]
      ),
    );
  }

  Widget _showDivider(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
