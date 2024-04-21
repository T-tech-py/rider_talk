import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/component/rich_dialog_box.dart';
import 'package:ride_talk/utils/utils.dart';

class CancelAlert extends StatefulWidget {
  const CancelAlert({Key? key}) : super(key: key);

  @override
  _CancelAlertState createState() => _CancelAlertState();
}

class _CancelAlertState extends State<CancelAlert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cBackgroundDarkColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: PrimaryButton(
        buttonColor: AppColors.cErrorColor,
        splashColor: AppColors.cErrorColor,
        text: 'ride.cancelRide'.tr,
        btnTxtStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
        onPressed: (){
          _showCancelRideAlertBox();
        },
      ),
    );
  }

  void _showCancelRideAlertBox() {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return RichDialogBox(
          title: 'ride.cancelRideTitle'.tr,
          titleStyle: Styles().h1TextStyle(AppColors.cTextDarkColor),
          titlePadding:const EdgeInsets.only(top: 30,bottom: 20),
          borderRadius: 20.0,
          content:   Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20,),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'ride.wantCancel'.tr,
                      style: Styles().pTextStyle(AppColors.cTextMediumColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: AppStrings.amount,
                            style: Styles().pTextStyle(AppColors.cTextMediumColor),
                        ),
                        TextSpan(
                            text: 'ride.feeApply'.tr,
                            style: Styles().pTextStyle(AppColors.cTextMediumColor),
                        )
                      ]
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: AppColors.cAccentColor,
                        splashColor: AppColors.cAccentColor,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'ride.cancel'.tr,
                              style: Styles().h3TextStyle(AppColors.cPrimaryColor),
                              children: <TextSpan>[
                                TextSpan(
                                    text: AppStrings.amount,
                                    style: Styles().h3TextStyle(AppColors.cPrimaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}
                                ),
                                TextSpan(
                                    text: 'ride.fee'.tr,
                                    style: Styles().h3TextStyle(AppColors.cPrimaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}
                                )
                              ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<ProfileController>(
                builder: (ctx) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    child: PrimaryButton(
                      buttonColor: AppColors.cSecondaryColor,
                      splashColor: AppColors.cSecondaryColor,
                      text: 'ride.DoNotCancel'.tr,
                      btnTxtStyle: Styles().h2TextStyleRoboto(AppColors.cTextLightColor),
                      onPressed: () {
                        Get.back();
                        ctx.gotoOrderConfirmPage();
                      }
                    ),
                  );
                }
              ),
              const SizedBox(height: 20,)
            ],
          ),
        );
      },
    );
  }
}
