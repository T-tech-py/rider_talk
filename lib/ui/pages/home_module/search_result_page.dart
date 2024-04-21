import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/home_module/widgets/search_list_item.dart';
import 'package:ride_talk/ui/pages/home_module/widgets/top_bar.dart';
import 'package:ride_talk/utils/utils.dart';

class SearchResultPage extends GetView<LanguageController> {
  SearchResultPage({Key? key}) : super(key: key);

  final DashboardController _dashboardController = DashboardController.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cScaffoldColor,
        body: _showBody(context),
      ),
    );
  }

  Widget _showBody(BuildContext ctx) {
    return Stack(
      children: [_showMap(), _showBookingOverlay(ctx)],
    );
  }

  Widget _showMap() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/route_map.png'),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _showBookingOverlay(BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(top: 30.0),
          child: TopBar(
              isLeading: true,
              onLeadingPress: () {
                _dashboardController.goToHome();
              }),
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.cAccentDarkColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            ),
          ),
          child: _buildListBottomSheet(ctx),
        ),
      ],
    );
  }

  Widget _buildListBottomSheet(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 30.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hey John,',
                  style: Styles().h3TextStyle(AppColors.cSecondaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We have found 3 rides for your request',
                  style: Styles().pTextStyle(AppColors.cBorderColor),
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: (){
            _dashboardController.goToShareRide();
          },
          child: SizedBox(
            height: AppUtility().contentHeight(context) * .35,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GetBuilder<ProfileController>(
                    builder: (ctx) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: SearchListItem(
                          imageUrl: 'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                          name: AppStrings.riderName,
                          onPressed: (){
                            ctx.gotoDriverProfile();
                          },
                          description: AppStrings.hatchBack,
                          fromLocation: AppStrings.locationAddress,
                          toLocation: AppStrings.locationAddress,
                        ),
                      );
                    }
                  );
                }),
          ),
        ),
        const SizedBox(height: 40,)
        // _showBtnSection()
      ],
    );
  }

  Widget _showBtnSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      child: PrimaryButton(
        text: 'search.request'.tr,
        onPressed: () {
          _dashboardController.goToShareRide();
        },
      ),
    );
  }
}
