import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

class OrderConfirmPage extends GetView<ThemeController> {
  const OrderConfirmPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(
        title: '',
        backgroundColor:AppColors.cScaffoldColor,
        isLeading: true,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)
        ),
      ),
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context){
    return Container(
      padding: AppDimens.pagePadding,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.cScaffoldColor,
              AppColors.cCardLightColor,
            ]
        ),
      ),
      child: Column(
        children: [
          _showTitle(),
          _showCardSection(context),
          _showTotalPrice(),
          _showPrice(),
          _showButton(),
        ],
      ),
    );
  }

  Widget _showTitle(){
    return Text(
      'order.title'.tr,
      style: Styles().subHeaderStyle(
          AppColors.cTextDarkColor,
          AppDimens.largeSize,
          AppFonts.poppinsSemiBold
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _showCardSection(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cPrimaryColor,
        borderRadius: BorderRadius.circular(5.0)
      ),
      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 12.0),
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _showProfileSection(),
          _showCurrentDate(),
          _showTrackSection(context),
        ],
      ),
    );
  }

  Widget _showProfileSection(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:8.0,top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.profileName,
                style: Styles().h2TextStyle(
                  AppColors.cTextDarkColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: Text(
                  AppStrings.hatchBack,
                  style: Styles().h4TextStyle(
                    AppColors.cBorderColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        const Icon(Icons.star,size: 15,color: AppColors.cRatingColor,),
        Text(
          AppStrings.ratingText,
          style: Styles().h4TextStyle(AppColors.cTextLightColor),
        )
      ],
    );
  }

  Widget _showCurrentDate(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20.0),
      child: Text(
        AppStrings.currentDate,
        style: Styles().h4TextStyle(
            AppColors.cTextDarkColor
        ),
      ),
    );
  }

  Widget _showTrackSection(BuildContext context){
    return SizedBox(
      height: AppUtility().contentWidth(context) *.2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '17.00',
                  style: Styles().pTextStyle(
                      AppColors.cTextDarkColor
                  ),
                ),
                Text(
                  '23.00',
                  style: Styles().pTextStyle(
                      AppColors.cTextDarkColor
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
              flex: 0,
              child: DottedLine()
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.locationAddress,
                  style: Styles().pTextStyle(
                      AppColors.cTextDarkColor
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Divider(),
                Text(
                  AppStrings.locationAddress,
                  style: Styles().pTextStyle(
                      AppColors.cTextDarkColor
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _showTotalPrice(){
    return Padding(
      padding: const EdgeInsets.only(top:50.0),
      // child: Text(
      //   'order.totalPrice'.tr,
      //   style: Styles().h4TextStyle(
      //       AppColors.cCardColor,
      //   ),
      //   textAlign: TextAlign.center,
      // ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'order.totalPrice'.tr,
            style: Styles().h4TextStyle(
              AppColors.cCardColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: AppStrings.passenger,
                style: Styles().h4TextStyle(
                  AppColors.cCardColor,
                ),
              ),
              TextSpan(
                  text: 'order.passenger'.tr,
                  style: Styles().h4TextStyle(
                    AppColors.cCardColor,
                  ),
              )
            ]
        ),
      ),
    );
  }

  Widget _showPrice(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20.0),
      child: Text(
        AppStrings.totalPriceAmount,
        style: Styles().subHeaderStyle(
            AppColors.cInfoColor,
            AppDimens.largeTextSize,
            AppFonts.robotoMedium
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _showButton(){
    return GetBuilder<ProfileController>(
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 30.0),
          child: PrimaryButton(
            text: 'order.continuePayment'.tr,
              btnTxtStyle: Styles().h2TextStyleRoboto(
                AppColors.cPrimaryColor
              ),
              onPressed: (){
                ctx.gotoPaymentPage();
              }
          ),
        );
      }
    );
  }

}
