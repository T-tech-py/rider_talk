import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/share_ride_module/widget/cancel_alert.dart';
import 'package:ride_talk/utils/app_colors.dart';
import 'package:ride_talk/utils/app_dimens.dart';
import 'package:ride_talk/utils/app_strings.dart';
import 'package:ride_talk/utils/app_utility.dart';
import 'package:ride_talk/utils/styles.dart';

class ShareRidePage extends GetView<LanguageController> {
  final DashboardController _dashboardController = DashboardController.to;

   ShareRidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cPrimaryColor,
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context){
    return ListView(
      children: [
        _showRiderDesc(),
        _showRouteInfo(context),
        const CancelAlert()
      ],
    );
  }

  Widget _showRiderDesc(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 40.0),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: _showRiderInfo()
          ),
          Expanded(
              flex:0,
              child: _showRiderContact()
          ),
        ],
      ),
    );
  }

  Widget _showRiderContact(){
    return Row(
      children: [
        InkWell(
          onTap: (){
            _dashboardController.gotoChatVideo();
          },
          child: Image.asset(
            'assets/images/phone_btn.png',
            width: 40.0,
          ),
        ),
        const SizedBox(width: 10.0),
        InkWell(
          onTap: (){
            _dashboardController.gotoChat();
          },
          child: Image.asset(
            'assets/images/message_btn.png',
            width: 40.0,
          ),
        ),
      ],
    );
  }

  Widget _showRiderInfo(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: _showRiderName(),
        ),
        _showRiderRating()
      ],
    );
  }

  Widget _showRiderName(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppStrings.riderName,
          style: Styles().pageHeading(),
        ),
        Text(
          AppStrings.riderDesc,
          style: Styles().descriptionStyle(),
        ),
      ],
    );
  }

  Widget _showRiderRating(){
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        children: [
          SvgPicture.asset('assets/images/rating_back.svg'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(
                  'assets/images/rating_star.svg',
                  color: AppColors.cInfoColor,
                ),
              ),
              Text(
                AppStrings.ratingText,
                style: Styles().ratingStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _showRouteInfo(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.cBackgroundDarkColor,
          borderRadius:BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0)
          )
      ),
      child: Column(
        children: [
          Padding(
            padding: AppDimens.containerPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/card_icon.svg'),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: Text(
                        AppStrings.totalPriceAmount,
                        style: Styles().priceStyle(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        AppStrings.kilometerText,
                        style: Styles().pTextStyle(
                            AppColors.cTextMediumColor
                        ),
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'ride.avgDur'.tr,
                          style: Styles().h5TextStyle(
                              AppColors.cTextLightColor
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '45 min',
                              style: Styles().h5TextStyle(
                                  AppColors.cPrimaryColor
                              ),
                            )
                          ]
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: AppUtility().contentWidth(context) *.2,
            padding: const EdgeInsets.only(bottom: 20.0,left: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 0,
                    child: DottedLine(lineColor: AppColors.cTextLightColor)
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.locationAddress,
                        style: Styles().h4TextStyle(AppColors.cTextLightColor),
                      ),
                      Text(
                        AppStrings.locationAddress,
                        style: Styles().h4TextStyle(AppColors.cTextLightColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          _showPassengerInfo(context),
        ],
      ),
    );
  }

  Widget _showPassengerInfo(BuildContext context){
    return Container(
        width: AppUtility().contentWidth(context),
        decoration: const BoxDecoration(
            color: AppColors.cPrimaryColor,
            borderRadius:BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20.0,left: 20.0),
              child: Text(
                'ride.co-Passenger'.tr,
                style: Styles().h4TextStyle(AppColors.cTextDarkColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical:5.0,horizontal: 20.0),
              height: AppUtility().contentWidth(context) *.2,
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (BuildContext context,int index){
                  return const Padding(
                    padding: EdgeInsets.only(right:8.0),
                    child: CircleAvatar(
                      radius: 28.0,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                      ),
                    )
                  );
                },
              ),
            ),
            _showRidersReview(context),
          ],
        )
    );
  }

  Widget _showRidersReview(BuildContext context){
    return Container(
        decoration: const BoxDecoration(
            color: AppColors.cBackgroundDarkColor,
            borderRadius:BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 10.0),
              child: Text(
                'ride.review'.tr,
                style: Styles().h4TextStyle(AppColors.cPrimaryColor),
              ),
            ),
            _showReviewList(),
          ],
        )
    );
  }

  Widget _showReviewList(){
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 0,
                 child: CircleAvatar(
                   radius: 32.0,
                   backgroundColor: AppColors.cPrimaryColor,
                   child: CircleAvatar(
                     radius: 30.0,
                     backgroundImage: NetworkImage(
                         'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                     ),
                   ),
                 )
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         AppStrings.riderName,
                        style: Styles().h3TextStyle(
                          AppColors.cBorderColor
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent congue',
                          style: Styles().pTextStyle(
                              AppColors.cBorderColor
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '2 days ago',
                  style: Styles().h5TextStyle(AppColors.cBorderColor),
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return (index != 3) ? const Divider(color: AppColors.cBorderColor,) : const SizedBox(height: 0);
      },
    );
  }

}