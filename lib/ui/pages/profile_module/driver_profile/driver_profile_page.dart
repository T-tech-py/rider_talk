import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/application_bar.dart';
import 'package:ride_talk/utils/utils.dart';

class DriverProfile extends GetView<LanguageController> {
  const DriverProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
      appBar: ApplicationBar(
        title: '',
        elevation: 0.0,
        backgroundColor: const Color(0xffF8F8FA),
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

  Widget _showBody() {
    return ListView(
      padding: AppDimens.pagePadding,
      children: [
        _showTitle(),
        _driverDetails(),
        _rideDetails(),
        _vehicleDetailsTitle(),
        _vehicleDetails(),
        _driverAddress(),
        _showReportText(),
        const SizedBox(height: 100,)
      ],
    );
  }

  Widget _showTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'driveProfile.title'.tr,
          style: Styles().h1TextStyle(AppColors.cTextDarkColor),
        ),
        _showChatOption()
      ],
    );
  }

  Widget _showChatOption(){
    return  GetBuilder<ChatController>(
      builder: (ctx) {
        return Row(
          children: [
            InkWell(
              onTap: (){
                ctx.gotoChatVideo();
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.cShadowColor, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10.0)),
                child: SvgPicture.asset('assets/icons/phone_icon.svg'),
              ),
            ),
            InkWell(
              onTap: (){
                ctx.gotoChat();
              },
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.cShadowColor, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10.0)),
                child: SvgPicture.asset('assets/icons/msg_icon.svg'),
              ),
            )
          ],
        );
      }
    );
  }

  Widget _driverDetails() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 48,
                  child: Image.asset('assets/images/driver_pic.png'),
                ),
                Positioned(
                  right: 20,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: AppColors.cGreenColor,
                    radius: 10,
                    child: SvgPicture.asset('assets/icons/tick_icon.svg'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppStrings.riderName,
                      style: TextStyle(
                        color: AppColors.cBackgroundColor,
                        fontFamily: AppFonts.poppinsMedium,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Member since 2006',
                      style: Styles().pTextStyle(AppColors.cBorderColor),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [_profileRatingBadge(), _profileTimeBadge()],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _profileRatingBadge() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Stack(
            children: [
              Image.asset(
                'assets/icons/yellow_circle.png',
                width: 40,
              ),
              Positioned(
                left: 0,
                top: 12,
                right: 0,
                child: SvgPicture.asset('assets/icons/star_icon.svg'),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '4.9',
              style: Styles().h3TextStyle(AppColors.cCardColor),
            ),
            Text(
              '(300)',
              style: Styles().pTextStyle(AppColors.cBorderColor),
            )
          ],
        )
      ],
    );
  }

  Widget _profileTimeBadge() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Stack(
            children: [
              Image.asset(
                'assets/icons/yellow_circle.png',
                width: 40,
              ),
              Positioned(
                left: 0,
                top: 12,
                right: 0,
                child: SvgPicture.asset('assets/icons/star_icon.svg'),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '95%',
              style: Styles().h3TextStyle(AppColors.cCardColor),
            ),
            Text(
              'Ontime',
              style: Styles().pTextStyle(AppColors.cBorderColor),
            )
          ],
        )
      ],
    );
  }

  Widget _rideDetails() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 25),
          itemCount: 2,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.cPrimaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/icons/car_icon.svg'),
                      ),
                      Positioned(
                        left: 5,
                        top: 2,
                        child: CircleAvatar(
                          backgroundColor: AppColors.cGreenColor,
                          radius: 8,
                          child: SvgPicture.asset('assets/icons/tick_icon.svg'),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '150 RIDE',
                        style: TextStyle(
                          color: AppColors.cBackgroundColor,
                          fontFamily: AppFonts.robotoMedium,
                          fontSize: AppDimens.mediumTextSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'driveProfile.complete'.tr,
                        style: const TextStyle(
                          color: AppColors.cBackgroundColor,
                          fontFamily: AppFonts.robotoRegular,
                          fontSize: AppDimens.pSize,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget _vehicleDetailsTitle(){
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 15),
      child: Text(
        'driveProfile.vehicle'.tr,
        style: const TextStyle(
          color: AppColors.cBackgroundColor,
          fontFamily: AppFonts.robotoMedium,
          fontSize: AppDimens.pSize,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }

  Widget _vehicleDetails(){
     return GridView.count(
       shrinkWrap: true,
       childAspectRatio: (2 / 2.5),
       crossAxisCount: 2,
       mainAxisSpacing: 10,
       crossAxisSpacing: 10,
       physics: const ClampingScrollPhysics(),
       children: List.generate(
           2,(index){
         return Container(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10.0),
             color: AppColors.cTextLightColor,
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 25),
                 child: Stack(
                   children: [
                     const Positioned(
                       right: 10,
                       top: 0,
                       child: CircleAvatar(
                         radius: 34,
                         backgroundColor: AppColors.cShadowColor,
                       ),
                     ),
                     Image.asset('assets/images/car_img.png')
                   ],
                 ),
               ),
               const Padding(
                 padding: EdgeInsets.all(4.0),
                 child: Text(
                   'Hatchback-Maruti',
                   style: TextStyle(
                     color: AppColors.cTextWhiteColor,
                     fontFamily: AppFonts.robotoRegular,
                     fontSize: AppDimens.h4Size,
                     fontWeight: FontWeight.w400,
                   ),
                 ),
               ),
               const Padding(
                 padding: EdgeInsets.all(4.0),
                 child: Text(
                   'Suzuki Swift',
                   style: TextStyle(
                     color: AppColors.cTextWhiteColor,
                     fontFamily: AppFonts.robotoRegular,
                     fontSize: AppDimens.h4Size,
                     fontWeight: FontWeight.w400,
                   ),
                 ),
               ),
               const Padding(
                 padding: EdgeInsets.all(4.0),
                 child: Text(
                   'MH14D1533',
                   style: TextStyle(
                     color: AppColors.cPrimaryColor,
                     fontFamily: AppFonts.robotoMedium,
                     fontSize: AppDimens.h4Size,
                     fontWeight: FontWeight.w700,
                   ),
                 ),
               ),
             ],
           ),
         );

       }),
     );
  }

  Widget _driverAddress(){
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset('assets/icons/home_icon.svg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'app.home'.tr,
                    style: Styles().h4TextStyle(AppColors.cCardColor),
                  ),
                  Text('472 Oklahoma Rd. Midland, MI 48640',
                    style: Styles().h4TextStyle(AppColors.cBackgroundColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset('assets/icons/office_icon.svg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'app.office'.tr,
                    style: Styles().h4TextStyle(AppColors.cCardColor),
                  ),
                  Text('8122C Cardinal Lane Brunswick, GA 31525',
                    style: Styles().h4TextStyle(AppColors.cBackgroundColor),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _showReportText(){
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextButton(
          child: Text(
            'driveProfile.report'.tr,
            style: const TextStyle(
              color: AppColors.cTextMediumColor,
              decoration: TextDecoration.underline,
              fontFamily: AppFonts.robotoRegular,
              fontSize: AppDimens.h3Size,
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: (){},
      ),
    );
  }

}
