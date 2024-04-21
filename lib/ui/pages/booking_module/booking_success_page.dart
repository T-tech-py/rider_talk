import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/app_colors.dart';
import 'package:ride_talk/utils/app_dimens.dart';
import 'package:ride_talk/utils/styles.dart';

class BookingSuccessPage extends StatelessWidget {
  const BookingSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cBackgroundColor,
      body: _showBody(),
    );
  }

  Widget _showBody(){
    return Padding(
      padding: AppDimens.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Image.asset('assets/images/success_img.png'),
          Text(
            'booking.title'.tr,
            style: Styles().h1TextStyle(AppColors.cSecondaryColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              'booking.content'.tr,
              style: Styles().pTextStyle(AppColors.cTextLightColor),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          _showBtn(),
        ],
      ),
    );
  }

  Widget _showBtn() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 60.0),
            child: PrimaryButton(
              text: 'app.done'.tr,
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
      ],
    );
  }
}
