import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

import 'location_section.dart';

class SearchSheet extends StatefulWidget {
  const SearchSheet({Key? key}) : super(key: key);


  @override
  State<SearchSheet> createState() => _SearchSheetState();
}

class _SearchSheetState extends State<SearchSheet> {
  @override
  Widget build(BuildContext context) {
    return _showBody(context);
  }

  Widget _showBody(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            AppColors.cPrimaryColor,
            AppColors.cCardLightColor,
            AppColors.cPrimaryColor,
          ]
        )
      ),
      padding: AppDimens.containerPadding,
      child: Column(
        children: [
          // SizedBox(height: 20,),
          _topSection(),
          const LocationSection(),
          const SizedBox(height: 100,)
        ],
      ),
    );
  }

  Widget _topSection(){
    return Column(
      children: [
        Container(
          width: AppUtility().contentWidth(context),
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close)
          ),
        ),
        _showTopSection(context),
        _showPickMapSection(),
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0,left: 50.0),
          child: Divider(color: AppColors.cBorderColor,height: 0,),
        ),
        _showMyFavSection(),
        const Padding(
          padding: EdgeInsets.only(top: 8.0,bottom: 40.0),
          child: Divider(color: AppColors.cBorderColor,),
        ),
      ],
    );

  }

  Widget _showTopSection(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cPrimaryColor,
        borderRadius: BorderRadius.circular(5.0)
      ),
      padding:  const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.symmetric(vertical: 25),
      height: AppUtility().contentWidth(context) *.3,
      child: Row(
        children: [
          const DottedLine(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormFields(
                  isBorder: false,
                  filled: false,
                  autoFocus: false,
                  dense: true,
                  hintText: AppStrings.locationAddress,
                  hintStyle: Styles().h3TextStyle(
                    AppColors.cTextMediumColor,
                  ),
                  fieldStyle: Styles().h3TextStyle(
                    AppColors.cBackgroundColor,
                  ),
                  contentPadding: EdgeInsets.zero,
                  cursorColor: AppColors.cAccentDarkColor,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const Divider(color: AppColors.cBorderColor,),
                TextFormFields(
                  isBorder: false,
                  filled: false,
                  autoFocus: false,
                  dense: true,
                  hintText: 'search.destination'.tr,
                  hintStyle: Styles().h4TextStyle(
                      AppColors.cTextLightColor
                  ),
                  fieldStyle: Styles().h4TextStyle(
                      AppColors.cAccentDarkColor
                  ),
                  contentPadding: EdgeInsets.zero,
                  cursorColor: AppColors.cAccentDarkColor,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _showPickMapSection(){
    return Padding(
      padding: const EdgeInsets.only(top:10.0,bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      AppColors.cCardLightColor,
                      AppColors.cPrimaryColor,
                    ]
                ),
              shape: BoxShape.circle,
            ),
            height: 50.0,
            width: 50.0,
            child: Transform.scale(
              scale: 0.5,
                child: Image.asset('assets/icons/flag_icon.png')
            ),
          ),
          Text(
            'search.pickMap'.tr,
            style: Styles().h4TextStyle(
              AppColors.cBorderColor
            ),
          )
        ],
      ),
    );
  }

  Widget _showMyFavSection(){
    return ListTile(
       dense: true,
       contentPadding: EdgeInsets.zero,
       horizontalTitleGap: 2,
       leading: Container(
          margin: const EdgeInsets.only(right: 10.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  AppColors.cCardLightColor,
                  AppColors.cPrimaryColor,
                ]
            ),
            shape: BoxShape.circle,
          ),
          height: 50.0,
          width: 50.0,
            child: Transform.scale(
                scale: 0.3,
                child: SvgPicture.asset(
                  'assets/images/rating_star.svg',
                  color: AppColors.cRatingColor,
                )
            ),
       ),
       title: Text(
         'app.myFav'.tr,
         style: Styles().h4TextStyle(
             AppColors.cBorderColor
         ),
       ),
      onTap: (){
        Get.toNamed('/favorite');
      },
    );
  }

}
