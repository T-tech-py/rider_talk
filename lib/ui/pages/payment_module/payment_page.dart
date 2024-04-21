import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/profile_controller.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      appBar: ApplicationBar(
        backgroundColor: AppColors.cScaffoldColor,
        title: '',
        isLeading: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.clear)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset('assets/icons/plus_fill_icon.svg'),
          )
        ],
      ),
      body: _showBody(),
    );
  }

  Widget _showBody() {
    return ListView(
      padding: AppDimens.pagePadding,
      children: [
        _showPageTitle(),
        _showPaymentMethods(),
      ],
    );
  }

  Widget _showPageTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'payment.title'.tr,
          style: Styles().h1TextStyle(AppColors.cTextDarkColor),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 20.0),
          child: Text(
            'payment.content'.tr,
            style: Styles().h4TextStyle(AppColors.cTextMediumColor),
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }

  Widget _showPaymentMethods() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      children: [
        Text(
          'payment.method',
          style: Styles().h4TextStyle(AppColors.cTextDarkColor),
        ),
        _masterCardRow(),
        _visaCardRow(),
        _paypalRow(),
        _cashRow(),
        _showBtn()
      ],
    );
  }

  Widget _masterCardRow(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.cCardColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Image.asset(
                'assets/icons/mastercard_icon.png',
                width: 35,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '**** **** **** 4567',
                  style: Styles().h4TextStyle(AppColors.cTextGreyColor),
                ),
                Text(
                  'Expair 12/30',
                  style: Styles().pTextStyle(AppColors.cBorderColor),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: SvgPicture.asset('assets/icons/green_tick_icon.svg'),
          ),
        ],
      ),
    );
  }

  Widget _visaCardRow(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.cCardColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Image.asset(
                'assets/icons/visacard_icon.png',
                width: 40,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '**** **** **** 3578',
                  style: Styles().h4TextStyle(AppColors.cTextGreyColor),
                ),
                Text(
                  'Expair 27/32',
                  style: Styles().pTextStyle(AppColors.cBorderColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _paypalRow(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.cCardColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Image.asset(
                'assets/icons/paypal_icon.png',
                height: 30,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'res.student@gmail.com',
              style: Styles().h3TextStyle(AppColors.cTextGreyColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cashRow(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.cCardColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Image.asset(
                'assets/icons/cash_icon.png',
                width: 35,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'payment.cash'.tr,
              style: Styles().h3TextStyle(AppColors.cTextDarkColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showBtn() {
    return GetBuilder<ProfileController>(
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: PrimaryButton(
            text: 'app.done'.tr,
            onPressed: () {
             // ctx.gotoBookingSuccess();
            },
          ),
        );
      }
    );
  }

}
