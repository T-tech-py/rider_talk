import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

class OtpVerificationPage extends StatelessWidget {
  final AuthController _authController = AuthController.to;

   OtpVerificationPage({Key? key}) : super(key: key);

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
    return Padding(
      padding: AppDimens.pagePadding,
      child: SingleChildScrollView(
        child: SizedBox(
          height:AppUtility().contentHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 0,),
              _showImage(context),
              _showTitle(),
              _showDescription(),
              _showOtpSection(context),
              _showVerifyButton(),
              _showResendSection(),
              const SizedBox(height: 0,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showImage(BuildContext context){
    return Container(
        padding: const EdgeInsets.only(top: 10),
        height: AppUtility().contentHeight(context) *.35,
        child: Image.asset('assets/images/otp_verification.png')
    );
  }

  Widget _showTitle(){
    return Text(
      'verify.title'.tr,
      style: Styles().subHeaderStyle(
          AppColors.cPrimaryColor,
          AppDimens.mediumSize,
          AppFonts.poppinsRegular
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _showDescription(){
    return Padding(
       padding: const EdgeInsets.only(top:0.0,bottom: 0.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'verify.content'.tr,
            style: Styles().mediumTextStyle(
                AppColors.cTextMediumColor
            ),
            children: <TextSpan>[
              TextSpan(
                  text: AppStrings.phoneNo,
                  style: Styles().mediumTextStyle(
                      AppColors.cAccentColor
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {}
              )
            ]
        ),
      ),
    );
  }

  Widget _showOtpSection(BuildContext context){
    return Form(
      key: _authController.otpKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PinCodeTextField(
          appContext: context,
          length: 4,
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          // validator: (v) {
          //   if (v!.length < 3) {
          //     return "I'm from validator";
          //   } else {
          //     return null;
          //   }
          // },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(20),
            fieldHeight: 60,
            fieldWidth: 60,
            selectedColor: AppColors.cAccentColor,
            inactiveColor: AppColors.cBorderColor,
            activeColor: AppColors.cBorderColor,
            inactiveFillColor: AppColors.cBorderColor,
            selectedFillColor: AppColors.cBorderColor,
            activeFillColor: AppColors.cBorderColor,
            borderWidth: 1.2
          ),
          keyboardType: TextInputType.number,
          onCompleted: (v) {
            print("Completed");
          },
          animationDuration: const Duration(milliseconds: 300),
          onChanged: (value) {},
          // errorAnimationController: _authController.errorController,
          // controller: _authController.otpController,
          textStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              color: AppColors.cPrimaryColor,
              fontSize: 28,
              fontFamily: AppFonts.robotoRegular
          ),
        ),
      ),
    );
  }

  Widget _showVerifyButton(){
    return Padding(
      padding: const EdgeInsets.only(top:0.0,left: 10.0,bottom: 0.0,right: 10.0),
      // padding: EdgeInsets.only(top:70.0,left: 10.0,bottom: 50.0,right: 10.0),
      child: PrimaryButton(
        text: 'mobile.verify'.tr,
        onPressed: (){
          _authController.goToGenderSelectionPage();
        },
      ),
    );
  }

  Widget _showResendSection(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'mobile.receiveSms'.tr,
          style: Styles().mediumTextStyle(
              AppColors.cTextLightColor
          ),
          children: <TextSpan>[
            TextSpan(
                text: 'mobile.resendCode'.tr,
                style: Styles().mediumTextStyle(
                    AppColors.cPrimaryColor
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {}
            )
          ]
      ),
    );
  }

}
