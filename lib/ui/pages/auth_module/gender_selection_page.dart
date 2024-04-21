import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/auth_controller.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

class GenderSelectionPage extends StatelessWidget {
  final AuthController _authController = AuthController.to;

   GenderSelectionPage({Key? key}) : super(key: key);

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

  Widget _showBody(BuildContext context) {
    return Container(
      padding: AppDimens.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _showTitle(),
          _showDiscription(),
          _showImageSection(context),
          _showButton(),
        ],
      ),
    );
  }

  Widget _showTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Text(
        'gender.title'.tr,
        style: Styles().titleHeadingStyle(),
      ),
    );
  }

  Widget _showDiscription() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 50.0),
      child: Text(
        'gender.content'.tr,
        style: Styles().descriptionStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _showImageSection(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: InkWell(
              onTap: () {
                _authController.isMale(true);
                print(_authController.isMale.value);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                    child: GetX<AuthController>(
                      builder: (_) {
                        return _.isMale.value
                            ? Image.asset(
                                'assets/icons/male.png',
                                height:
                                    AppUtility().contentWidth(context) * .35,
                                width: AppUtility().contentWidth(context) * .4,
                              )
                            : Image.asset(
                                'assets/icons/male_bw.png',
                                height:
                                    AppUtility().contentWidth(context) * .35,
                                width: AppUtility().contentWidth(context) * .4,
                              );
                      },
                    ),
                  ),
                  // Text(
                  //   AppStrings.male,
                  //   style: Styles().subHeaderStyle(AppColors.cPrimaryColor,
                  //       AppDimens.mediumTextSize, AppFonts.robotoRegular),
                  // ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: InkWell(
              onTap: () {
                _authController.isMale(false);
                print(_authController.isMale.value);
              },
              child: Column(
                children: [
                  GetX<AuthController>(
                    builder: (_) {
                      return _.isMale.value
                          ? Image.asset(
                              'assets/icons/female_bw.png',
                              height: AppUtility().contentWidth(context) * .35,
                              width: AppUtility().contentWidth(context) * .4,
                            )
                          : Image.asset(
                              'assets/icons/female.png',
                              height: AppUtility().contentWidth(context) * .35,
                              width: AppUtility().contentWidth(context) * .4,
                            );
                    },
                  ),
                  // Text(
                  //   AppStrings.female,
                  //   style: Styles().subHeaderStyle(AppColors.cTextLightColor,
                  //       AppDimens.mediumTextSize, AppFonts.robotoRegular),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 180.0, left: 10.0, right: 10.0),
      child: PrimaryButton(
        buttonColor: AppColors.cAccentColor,
        text: 'checkEmail.continue'.tr,
        onPressed: () {
          // Get.toNamed('/login');
          _authController.goToEnableLocationPage();
        },
      ),
    );
  }
}
