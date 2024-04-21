import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

class ForgotPassPage extends StatelessWidget {
 final AuthController _authController = AuthController.to;

   ForgotPassPage({Key? key}) : super(key: key);

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
      key: _authController.forgotPassKey,
      child: ListView(
        padding: AppDimens.pagePadding,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          _showImage(context),
          _showTitle(),
          _showDiscription(),
          _buildEmailSection(),
          _buildSendButton(context),
        ],
      ),
    );
  }

  Widget _showImage(BuildContext context){
    return Container(
      height: AppUtility().contentWidth(context) *.8,
      padding:AppDimens.containerPadding,
      child: Image.asset('assets/images/forgot_pass.png'),
    );
  }

  Widget _showTitle(){
    return Text(
      'forgot.title'.tr,
      style: Styles().titleHeadingStyle(),
      textAlign: TextAlign.center,
    );
  }

  Widget _showDiscription(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0,top: 10.0),
      child: Text(
        'forgot.desc'.tr,
        style: Styles().descriptionStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildEmailSection(){
    return TextFormFields(
      focusNode: _authController.forgetEmailFocusNode,
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
      onChanged: (String value){
        print('Changed');
        _authController.forgetEmail=value;
      },
    );
  }


  Widget _buildSendButton(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(
          top: AppUtility().contentWidth(context) *.51,
          bottom: 35.0,right: 10.0,left: 10.0
      ),
      child: PrimaryButton(
        text: 'forgot.send'.tr,
        onPressed: () {
          _authController.goToCheckEmailPage();
        },
      ),
    );
  }

}
