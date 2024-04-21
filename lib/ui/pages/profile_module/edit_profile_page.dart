import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

class EditProfilePage extends GetView<LanguageController> {
  const EditProfilePage({Key? key}) : super(key: key);


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
    return ListView(
      padding: AppDimens.pagePadding,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        _showTitle(),
        _showEditImage(),
        _showNameSection(),
        _showDobSection(),
        _showPhoneSection(),
        _showEmailSection(),
        _showUpdateButton(),
      ],
    );
  }

  Widget _showTitle(){
    return Text(
      'edit.title'.tr,
      style: Styles().subHeaderStyle(
          AppColors.cBackgroundColor,
          AppDimens.minTextSize,
          AppFonts.poppinsRegular
      ),
    );
  }

  Widget _showEditImage(){
    return Stack(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            height: 130.0,
            width: 130.0,
              child: Image.asset('assets/images/edit_circle.png')
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 0,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/person_icon.svg',
              ),
            )
        )
      ],
    );
  }

  Widget _showNameSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: Text(
            'signUp.name'.tr,
            style: Styles().subHeaderStyle(
                AppColors.cBackgroundColor,
                AppDimens.smallTextSize,
                AppFonts.robotoRegular
            ),
          ),
        ),
        TextFormFields(
          autoFocus: false,
          hintText: AppStrings.profileName,
          filled: false,
          isBorder: true,
          hintStyle: Styles().subHeaderStyle(
            AppColors.cTextGreyColor,
            AppDimens.smallTextSize,
            AppFonts.robotoRegular
          ),
          fieldStyle: Styles().subHeaderStyle(
              AppColors.cTextColor,
              AppDimens.subTextSize,
              AppFonts.robotoRegular
          ),
          isSuffixIcon: true,
          suffixIcon: Transform.scale(
            scale: 0.4,
              child: SvgPicture.asset('assets/icons/close_icon.svg')
          ),
          cursorColor: AppColors.cTextGreyColor,
          borderColor: AppColors.cTextMediumColor,
          focusBorderColor: AppColors.cTextMediumColor,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.newline,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      ],
    );
  }

  Widget _showDobSection(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Text(
              'edit.dob'.tr,
              style: Styles().subHeaderStyle(
                  AppColors.cBackgroundColor,
                  AppDimens.smallTextSize,
                  AppFonts.robotoRegular
              ),
            ),
          ),
          TextFormFields(
            autoFocus: false,
            hintText: AppStrings.dobText,
            filled: false,
            isBorder: true,
            hintStyle: Styles().subHeaderStyle(
              AppColors.cTextGreyColor,
              AppDimens.smallTextSize,
              AppFonts.robotoRegular
            ),
            fieldStyle: Styles().subHeaderStyle(
                AppColors.cTextColor,
                AppDimens.subTextSize,
                AppFonts.robotoRegular
            ),
            cursorColor: AppColors.cTextGreyColor,
            borderColor: AppColors.cTextMediumColor,
            focusBorderColor: AppColors.cTextMediumColor,
            textInputType: TextInputType.datetime,
            textInputAction: TextInputAction.newline,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
        ],
      ),
    );
  }

  Widget _showPhoneSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: Text(
            'edit.phone'.tr,
            style: Styles().subHeaderStyle(
                AppColors.cBackgroundColor,
                AppDimens.smallTextSize,
                AppFonts.robotoRegular
            ),
          ),
        ),
        TextFormFields(
          autoFocus: false,
          hintText: AppStrings.phoneNo,
          filled: false,
          isBorder: true,
          hintStyle: Styles().subHeaderStyle(
            AppColors.cTextGreyColor,
            AppDimens.subTextSize,
            AppFonts.robotoRegular
          ),
          fieldStyle: Styles().subHeaderStyle(
              AppColors.cTextColor,
              AppDimens.smallTextSize,
              AppFonts.robotoRegular
          ),
          cursorColor: AppColors.cTextGreyColor,
          borderColor: AppColors.cTextMediumColor,
          focusBorderColor: AppColors.cTextMediumColor,
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.newline,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      ],
    );
  }

  Widget _showEmailSection(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Text(
              'edit.mail'.tr,
              style: Styles().subHeaderStyle(
                  AppColors.cBackgroundColor,
                  AppDimens.smallTextSize,
                  AppFonts.robotoRegular
              ),
            ),
          ),
          TextFormFields(
            autoFocus: false,
            hintText: AppStrings.emailText,
            filled: false,
            isBorder: true,
            hintStyle: Styles().subHeaderStyle(
              AppColors.cTextGreyColor,
              AppDimens.smallTextSize,
              AppFonts.robotoRegular
            ),
            fieldStyle: Styles().subHeaderStyle(
                AppColors.cTextColor,
                AppDimens.subTextSize,
                AppFonts.robotoRegular
            ),
            cursorColor: AppColors.cTextGreyColor,
            borderColor: AppColors.cTextMediumColor,
            focusBorderColor: AppColors.cTextMediumColor,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
        ],
      ),
    );
  }

  Widget _showUpdateButton(){
    return Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 80.0,bottom: 50.0),
      child: PrimaryButton(
        text: 'edit.update'.tr,
          onPressed: (){},
      ),
    );
  }

}
