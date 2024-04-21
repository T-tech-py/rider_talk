import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/auth_controller.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

class EnableLocationPage extends StatelessWidget {
  final AuthController _authController=AuthController.to;

   EnableLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cBackgroundColor,
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context){
    return Container(
      padding: AppDimens.pagePadding,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _showLocationImage(context),
          _showTitle(),
          const Spacer(),
          _showButtons(),
        ],
      ),
    );
  }

  Widget _showLocationImage(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      height: AppUtility().contentWidth(context) *.8,
      padding:AppDimens.containerPadding,
      child: Image.asset('assets/images/enable_location.png'),
    );
  }

  Widget _showTitle(){
    return Column(
      children: [
        Text(
          'enable.title'.tr,
          style: Styles().titleHeadingStyle(),
          textAlign: TextAlign.center,
        ),
        Text(
          'enable.desc'.tr,
          style: Styles().descriptionStyle(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _showButtons(){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 50.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: PrimaryButton(
              text: 'enable.access'.tr,
              onPressed: (){
                // Get.toNamed('/enable-location');
                _authController.checkLocationPermission();
              },
            ),
          ),
          InkWell(
            onTap: (){
             _authController.goToDashboardPage();
            },
            child: Text(
              'enable.skip'.tr,
              style: Styles().mediumTextStyle(
                  AppColors.cPrimaryColor
              ),
            ),
          ),
        ],
      ),
    );
  }

}
