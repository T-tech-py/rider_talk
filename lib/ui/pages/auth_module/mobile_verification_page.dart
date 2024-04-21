import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

class MobileVerificationPage extends StatelessWidget {
final AuthController _authController = AuthController.to;

   MobileVerificationPage({Key? key}) : super(key: key);

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
  return SingleChildScrollView(
    child: Container(
      padding: AppDimens.pagePadding,
    height:AppUtility().contentHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _showImage(context),
          _showTitle(),
          _showDescription(),
          _showPhoneField(context),
          _showVerifyButton(),
          _showResendSection(),
        ],
      ),
    ),
  );
}

  Widget _showImage(BuildContext context){
    return Container(
        padding: const EdgeInsets.only(top: 10),
        height: AppUtility().contentHeight(context) *.35,
        child: Image.asset('assets/images/mobile_verification.png'),
    );
  }

  Widget _showTitle(){
    return Text(
     'mobile.enterPhone'.tr,
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
      child: Text(
        'mobile.enterMobile'.tr,
        style: Styles().descriptionStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _showPhoneField(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cLightNavyBlueColor,
        borderRadius: BorderRadius.circular(6.0)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 3.0),
      margin: const EdgeInsets.only(top:40.0),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {},
        onInputValidated: (bool value) {
          print(value);
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        textStyle: const TextStyle(
          color: AppColors.cPrimaryColor,
        ),
        spaceBetweenSelectorAndTextField: 0.0,
        ignoreBlank: true,
        maxLength: 10,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: const TextStyle(color: AppColors.cPrimaryColor),
        initialValue: _authController.number,
        textFieldController: _authController.textController,
        formatInput: false,
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: 'mobile.hint'.tr,
          hintStyle: Styles().mediumTextStyle(AppColors.cPrimaryColor)
        ),
        keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        },
      ),
    );
  }


Widget _showVerifyButton(){
    return Padding(
      padding: const EdgeInsets.only(top:0.0,left: 10.0,bottom: 0.0,right: 10.0),
      child: PrimaryButton(
        text: 'mobile.verify'.tr,
        onPressed: () {
          Get.toNamed('/otp-verify');
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
              ..onTap = () {
                _authController.formKey.currentState!.validate();
              }
          )
        ]
      ),
    );
  }

}
