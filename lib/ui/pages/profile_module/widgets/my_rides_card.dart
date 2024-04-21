import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/dotted_line.dart';
import 'package:ride_talk/utils/utils.dart';

class MyRidesCard extends StatelessWidget {
  const MyRidesCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 120.0),
      itemCount: 5,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context,int index){
        return Container(
          decoration: BoxDecoration(
            color: AppColors.cPrimaryColor,
            borderRadius: BorderRadius.circular(10.0)
          ),
          margin: const EdgeInsets.only(bottom:20.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 20.0),
          height: AppUtility().contentWidth(context) *.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DottedLine(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.locationAddress,
                          style: Styles().subHeaderStyle(
                            AppColors.cTextGreyColor,
                            AppDimens.minSmallTextSize,
                            AppFonts.robotoRegular,
                          ),
                        ),
                        Text(
                          AppStrings.locationAddress,
                          style: Styles().subHeaderStyle(
                            AppColors.cTextGreyColor,
                            AppDimens.minSmallTextSize,
                            AppFonts.robotoRegular,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/icons/horizontal_dots.svg')
                  ],
                ),
              ),
              const Divider(color: AppColors.cBorderColor,),
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex:1,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: 3,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context,int index){
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          const CircleAvatar(
                                            radius: 20.0,
                                            backgroundImage: NetworkImage(
                                                'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                                            ),
                                          ),
                                          Text(
                                              'signUp.name'.tr,
                                            style: Styles().subHeaderStyle(
                                              AppColors.cBorderColor,
                                              AppDimens.smallTextSize,
                                              AppFonts.robotoRegular,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: GetBuilder<DashboardController>(
                                builder: (ctx) {
                                  return InkWell(
                                    onTap:(){
                                      ctx.gotoChat();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 30, left: 5, right: 20),
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.cGreenColor,
                                        radius: 20,
                                        child: Image.asset('assets/icons/chat_icon.png', width: 15,),
                                      ),
                                    ),
                                  );
                                }
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.dateTime,
                              style: Styles().subHeaderStyle(
                                AppColors.cBorderColor,
                                AppDimens.minSmallTextSize,
                                AppFonts.robotoRegular,
                              ),
                              overflow: TextOverflow.fade,
                            ),
                            Text(
                              AppStrings.hatchBack,
                              style: Styles().subHeaderStyle(
                                AppColors.cBorderColor,
                                AppDimens.minSmallTextSize,
                                AppFonts.robotoRegular,
                              ),
                              overflow: TextOverflow.fade,
                            ),
                            MaterialButton(
                              padding: EdgeInsets.zero,
                              elevation: 0,
                              color: AppColors.cGreenLightColor,
                              child: Text(
                                'ride.ongoing'.tr,
                                style: Styles().subHeaderStyle(
                                  AppColors.cGreenColor,
                                  AppDimens.minSmallTextSize,
                                  AppFonts.robotoRegular,
                                ),
                                overflow: TextOverflow.fade,
                              ),
                              onPressed: (){},
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ],
          ),
        );
      },
    );
  }

}
