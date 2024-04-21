import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/splash_module/widgets/widgets.dart';
import 'package:ride_talk/utils/utils.dart';

import 'widgets/child_list_tile.dart';

class ProfilePage extends GetView<LanguageController> {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      appBar: const ApplicationBar(
        title: '',
        backgroundColor: AppColors.cScaffoldColor,
        isLeading: false,
        // leading: IconButton(
        //     onPressed: (){
        //       Get.back();
        //     },
        //     icon: Icon(Icons.arrow_back)
        // ),
      ),
      body: _showBody(),
    );
  }

  Widget _showBody(){
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: AppDimens.pagePadding,
      children: [
        _showTitle(),
        _showProfileSection(),
        _buildListItems(),
        const SizedBox(height: 120.0,)
      ],
    );
  }

  Widget _showTitle(){
    return Text(
      'profile.title'.tr,
      style: Styles().subHeaderStyle(
          AppColors.cBackgroundColor,
          AppDimens.minTextSize,
          AppFonts.poppinsRegular
      ),
    );
  }

  Widget _showProfileSection(){
    return Padding(
      padding: const EdgeInsets.only(top:40.0),
      child: Row(
        children: [
          _showProfileImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.profileName,
                    style: TextStyle(
                        color: AppColors.cTextColor,
                        fontSize: AppDimens.largeSize,
                        fontFamily: AppFonts.poppinsRegular,
                        height: 0.9
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 0,
                          child: Image.asset('assets/icons/mail_icon.png',height: 30.0,width: 30.0,),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            AppStrings.emailText,
                            style: Styles().subHeaderStyle(
                                AppColors.cTextMediumColor,
                                AppDimens.minSmallTextSize,
                                AppFonts.robotoRegular
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Image.asset('assets/icons/phone_icon.png',height: 30.0,width: 30.0,),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left:5.0),
                          child: Text(
                            AppStrings.phoneNo,
                            style: Styles().subHeaderStyle(
                                AppColors.cTextMediumColor,
                                AppDimens.minSmallTextSize,
                                AppFonts.robotoRegular
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListItems(){
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          ChildListTile(
            title: 'profile.applyPromo'.tr,
            icon: 'assets/icons/promo_code.png',
            link: '/promo-code',
          ),
          ChildListTile(
            title: 'profile.rideDetails'.tr,
            icon: 'assets/icons/promo_code.png',
            link: '/ride-details',
          ),
          ChildListTile(
            title: 'profile.refer'.tr,
            icon: 'assets/icons/refer.png',
            link: '/refer-page',
          ),
          ChildListTile(
            title: 'profile.payment'.tr,
            icon: 'assets/icons/payment.png',
            link: '/payment',
          ),
          ChildListTile(
            title: 'profile.terms'.tr,
            icon: 'assets/icons/terms.png',
            link: '/terms-page',
          ),
          ChildListTile(
            title: 'profile.setting'.tr,
            icon: 'assets/icons/settings.png',
            link: '/profile-setting',
          ),
          ChildListTile(
            title: 'profile.logout'.tr,
            icon: 'assets/icons/logout.png',
            link: '/login',
          ),
        ],
      ),
    );
  }

  Widget _showProfileImage(){
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.cAccentColor,
          radius: 60,
          child: CachedNetworkImage(
            imageUrl: 'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    Colors.white60,
                    BlendMode.overlay,
                  ),
                ),
              ),
            ),
            placeholder: (context, url) => const LoadingWidget(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
            right: 0,
            top: 0,
            child: InkWell(
              child: SvgPicture.asset('assets/icons/edit_icon.svg'),
              onTap: (){
                Get.toNamed('/edit-profile');
              },
            )
        )
      ],
    );
  }

}
