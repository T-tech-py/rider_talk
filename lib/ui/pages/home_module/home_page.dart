
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/home_module/widgets/search_sheet.dart';
import 'package:ride_talk/ui/pages/home_module/widgets/top_bar.dart';
import 'package:ride_talk/utils/utils.dart';

class HomePage extends GetView<LanguageController> {
  final DashboardController _dashboardController = DashboardController.to;

   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext ctx) {
    return Stack(
      children: [_showMap(ctx), _showBookingOverlay(ctx)],
    );
  }

  Widget _showMap(BuildContext context) {
    return
      // GetBuilder<DashboardController>(
      //   builder: (ctx) {
      //     return Container(
      //       height: AppUtility().contentHeight(context),
      //       width: AppUtility().contentWidth(context),
      //       child: GoogleMap(
      //         mapType: MapType.hybrid,
      //         initialCameraPosition: ctx.kGooglePlex,
      //         onMapCreated: (GoogleMapController controller) {
      //           ctx.mapController.complete(controller);
      //           controller.setMapStyle(ctx.mapStyle);
      //         },
      //       ),
      //     );
      //   }
      // );
      Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/map.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _showBookingOverlay(BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(ctx).size.height * .4,
              color: Colors.transparent,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 50,
              child: Column(
                children: [
                  TopBar(
                    onBellPress: () {
                      Get.toNamed('/notification');
                    },
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: ctx,
                        builder: (context) => SingleChildScrollView(
                          //controller: ModalScrollController.of(context),
                          child: const SearchSheet(),
                        ),
                      );
                    },
                    child: _showLocationSection(ctx),
                  ),
                ],
              ),
            )
          ],
        ),
        Stack(
          children: [
            Column(
              children: [
                Container(
                  height: AppUtility().contentHeight(ctx) * .05,
                  color: Colors.transparent,
                ),
                Container(
                  height: AppUtility().contentHeight(ctx) * .45,
                  decoration: const BoxDecoration(
                    color: AppColors.cAccentDarkColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                    ),
                  ),
                ),
              ],
            ),
            _showBookingDetails(),
          ],
        )
      ],
    );
  }

  Widget _showLocationSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.cPrimaryColor,
          borderRadius: BorderRadius.circular(10.0)),
      height: AppUtility().contentHeight(context) * .16,
      margin: const EdgeInsets.only(top: 10.0, left: 50, right: 50),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _showKilometerText(),
          const DottedLine(),
          _showLocation(),
        ],
      ),
    );
  }

  Widget _showKilometerText() {
    return RotatedBox(
      quarterTurns: -1,
      child: Text(
        AppStrings.kilometerText,
        style: Styles().subHeaderStyle(AppColors.cTextGreyColor,
            AppDimens.minSmallTextSize, AppFonts.robotoRegular),
      ),
    );
  }

  Widget _showLocation() {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'home.leaveFrom'.tr,
            style: Styles().h5TextStyle(
              AppColors.cTextLightColor,
            ),
          ),
          Text(
            AppStrings.locationAddress,
            style: Styles().pTextStyle(
              AppColors.cBackgroundColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          // _showFromAddress(),
          const Divider(
            thickness: 1,
            color: AppColors.cBorderLineColor,
          ),
          Text(
            'home.goTo'.tr,
            style: Styles().h5TextStyle(
              AppColors.cTextLightColor,
            ),
          ),
          Text(
            AppStrings.locationAddress,
            style: Styles().pTextStyle(
              AppColors.cBackgroundColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          // _showToAddress(),
        ],
      ),
    );
  }

  Widget _showBookingDetails() {
    return Column(
      children: [
        _bookingOption(),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: _showBtnSection(),
        ),
        // _useCode()
      ],
    );
  }

  Widget _bookingOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                color: AppColors.cPrimaryColor,
                borderRadius: BorderRadius.circular(12.0)),
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SvgPicture.asset('assets/icons/date_icon.svg'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'home.today'.tr,
                    style: Styles().h5TextStyle(AppColors.cBackgroundColor),
                  ),
                ),
                Text(
                  '17:00',
                  style: Styles().h4TextStyle(AppColors.cBackgroundColor),
                ),
              ],
            ),
          ),
          onTap: () {
            Get.toNamed('/date-page');
          },
        ),
        InkWell(
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                color: AppColors.cPrimaryColor,
                borderRadius: BorderRadius.circular(12.0)),
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SvgPicture.asset('assets/icons/passenger.svg'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'home.passenger'.tr,
                    style: Styles().h5TextStyle(AppColors.cBackgroundColor),
                  ),
                ),
                Text(
                  '1',
                  style: Styles().h4TextStyle(AppColors.cBackgroundColor),
                ),
              ],
            ),
          ),
          onTap: () {
            _dashboardController.gotoSeatSelection();
          },
        ),
      ],
    );
  }

  Widget _showBtnSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: PrimaryButton(
            text: 'home.find'.tr,
            onPressed: () {
              _dashboardController.gotoSearchResult();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextButton(
            onPressed: () {
              _dashboardController.goToPromoCode();
            },
            child: Text(
              'home.useRide'.tr,
              style: Styles().mediumTextStyle(AppColors.cTextLightColor),
            ),
          ),
        ),
      ],
    );
  }
}
