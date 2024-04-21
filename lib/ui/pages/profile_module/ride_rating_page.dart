import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

import 'widgets/custom_slider.dart';

class RideRatingPage extends GetView<LanguageController> {
  final ProfileController _profileController = ProfileController.to;

   RideRatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cAccentColor,
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(25.0, 60.0, 25.0, 0.0),
          child: Column(
            children: [
              _showRideText(),
              _showHowRideText(),
              _showProfile(),
              _showProfileName(),
              _showContent(),
              _showRating(),
              _showSlider(context),
            ],
          ),
        ),
        _buildBottomSheet(context),
      ],
    );
  }

  Widget _showRideText() {
    return Text(
      'rating.ride'.tr,
      style: Styles().h4TextStyle(AppColors.cPrimaryColor),
    );
  }

  Widget _showHowRideText() {
    return Padding(
      padding: const EdgeInsets.only(top:10.0,bottom: 20.0),
      child: Text(
        'rating.title'.tr,
        style: Styles().subHeaderStyle(
          AppColors.cPrimaryColor,
          AppDimens.h1Size,
          AppFonts.poppinsRegular,
        ),
      ),
    );
  }

  Widget _showProfile() {
    return CustomCircle(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.cPrimaryColor,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
              )
            )
          ),
        ),
        isIcon: true,
        icon: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.asset('assets/icons/circle_check.svg'),
        ),
        outerCircleColor: AppColors.cBorderMediumColor,
    );
  }

  Widget _showProfileName() {
    return Padding(
      padding: const EdgeInsets.only(top:15.0),
      child: Text(
        AppStrings.riderName,
        style: Styles().textSmallStyleLight(),
      ),
    );
  }

  Widget _showContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child: Text(
        AppStrings.hatchBack,
        style: Styles().h4TextStyle(AppColors.cPrimaryColor),
      ),
    );
  }

  Widget _showRating() {
    return RatingBar.builder(
      initialRating: 4,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 25,
      itemPadding: const EdgeInsets.only(right: 4),
      itemBuilder: (context, _) => const Icon(
        CupertinoIcons.star_fill,
        color: AppColors.cPrimaryColor,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Widget _showSlider(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50.0),
      decoration: BoxDecoration(
        color: AppColors.cPrimaryColor,
        borderRadius: BorderRadius.circular(10.0)
      ),
      width: AppUtility().contentWidth(context),
      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'rating.experience'.tr,
                style: Styles().h3TextStyle(AppColors.cTextDarkColor),
              ),
              Text(
                'rating.drag'.tr,
                style: Styles().pTextStyle(AppColors.cTextMediumColor),
              ),
            ],
          ),
          const CustomSlider(),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.cBackgroundDarkColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60.0),
            topLeft: Radius.circular(60.0),
          )
      ),
      padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 20.0),
      child: Column(
        children: [
          _showComplimentText(),
          _showComplimentIcons(context),
          _showTextFieldSection(),
          _showDoneButton(),
        ],
      ),
    );
  }

  Widget _showComplimentText(){
    return Center(
      child: Text(
        'rating.complement'.tr,
        style: Styles().h4TextStyle(AppColors.cPrimaryColor),
      )
    );
  }

  Widget _showComplimentIcons(BuildContext context){
    return SizedBox(
      height: AppUtility().contentWidth(context) *.5,
      child: ListView.builder(
          itemCount: 3,
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 14.0),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right:30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset('assets/icons/ellipse.svg'),
                      Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Transform.scale(
                              scale: (index == 1) ? 0.5 : 0.4,
                              child: SvgPicture.asset('assets/icons/${_profileController.ratingIconList[index]}.svg')
                          )
                      ),
                    ],
                  ),
                  Text(
                    _profileController.ratingList[index].tr,
                    style: Styles().pTextStyleWithH(
                        AppColors.cBorderColor,
                        2.5
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }

  Widget _showTextFieldSection(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: TextField(
        maxLines: 3,
        style: Styles().h4TextStyle(AppColors.cPrimaryColor),
        decoration: InputDecoration(
          filled: true,
          hintText: 'rating.addComment'.tr,
          hintStyle: Styles().h4TextStyle(AppColors.cTextMediumColor),
          fillColor: AppColors.cTextDarkColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _showDoneButton(){
    return Row(
      children: [
        const Expanded(
          flex: 1,
            child: Text('')
        ),
        Expanded(
          flex: 9,
          child: PrimaryButton(
            text: 'app.done'.tr,
            onPressed: () {}
          ),
        ),
        const Expanded(
            flex: 1,
            child: Text('')
        ),
      ],
    );
  }

}
