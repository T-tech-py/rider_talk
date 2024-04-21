import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

import 'widgets/my_rides_card.dart';

class RideDetails extends GetView<LanguageController> {
  final DashboardController _dashboardController = DashboardController.to;

   RideDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      appBar: ApplicationBar(
        title: '',
        backgroundColor: AppColors.cScaffoldColor,
        isLeading: true,
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

  Widget _showBody(){
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          _showTopSection(),
          _showBottomList(),
        ],
      ),
    );
  }

  Widget _showTopSection(){
    return Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: Text(
                'ride.title'.tr,
                style: Styles().subHeaderStyle(
                    AppColors.cTextColor,
                    AppDimens.minTextSize,
                    AppFonts.poppinsRegular
                ),
              ),
            ),
            GetX<DashboardController>(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20.0),
                  child: TabBar(
                    onTap: (int index){
                      if (index == 0) {
                        _dashboardController.isCurrentRide(true);
                      } else if (index == 1) {
                        _dashboardController.isCurrentRide(false);
                      }
                    },
                    indicatorWeight: 1,
                    indicatorColor: AppColors.cScaffoldColor,
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: _.isCurrentRide.value
                              ? AppColors.cTextGreyColor
                              : AppColors.cScaffoldColor,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'ride.current'.tr,
                            style: Styles().mediumTextStyle(
                                _.isCurrentRide.value
                                    ? AppColors.cPrimaryColor
                                    : AppColors.cTextGreyColor
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: _.isCurrentRide.value
                                ? AppColors.cScaffoldColor
                                : AppColors.cTextGreyColor,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'ride.history'.tr,
                            style: Styles().mediumTextStyle(
                                _.isCurrentRide.value
                                  ? AppColors.cTextGreyColor
                                  : AppColors.cPrimaryColor
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                );
              }
            ),
          ],
        )
    );
  }

  Widget _showBottomList(){
    return const Expanded(
      flex: 4,
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          MyRidesCard(),
          MyRidesCard(),
        ]
      ),
    );
  }

}