import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/profile_module/widgets/child_list_tile.dart';
import 'package:ride_talk/utils/utils.dart';

class ProfileSettingsPage extends GetView<LanguageController> {
  const ProfileSettingsPage({Key? key}) : super(key: key);


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
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: AppDimens.pagePadding,
      children: [
        _showTitle(),
        _showSettingsImage(),
        _buildSettingsCard(),
      ],
    );
  }

  Widget _showTitle(){
    return Text(
      'profile.setting'.tr,
      style: Styles().subHeaderStyle(
          AppColors.cBackgroundColor,
          AppDimens.minTextSize,
          AppFonts.poppinsRegular
      ),
    );
  }

  Widget _showSettingsImage(){
    return Center(
      child: Container(
          margin: const EdgeInsets.only(top: 30.0,bottom: 60.0),
          height: 150.0,
          child: Image.asset('assets/images/setting_circle.png')
      ),
    );
  }

  Widget _buildSettingsCard(){
    return GetX<ProfileController>(
       builder :(_){
         return Container(
           decoration: BoxDecoration(
               color: AppColors.cPrimaryColor,
               borderRadius: BorderRadius.circular(12.0)
           ),
           padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 5.0),
           child: Column(
             children: [
               ChildListTile(
                 title: 'settings.traffic'.tr,
                 isSettings: true,
                 activeSwitch: _.trafficSwitch.value,
                 onClick: (){
                   _.trafficSwitch.value = !_.trafficSwitch.value;
                 },
               ),
               ChildListTile(
                 title: 'settings.cache'.tr,
                 isSettings: true,
                 activeSwitch: _.cacheSwitch.value,
                 onClick: (){
                   _.cacheSwitch.value = !_.cacheSwitch.value;
                 },
               ),
               ChildListTile(
                 title: 'app.notification'.tr,
                 isSettings: true,
                 activeSwitch: _.notificationSwitch.value,
                 onClick: (){
                   _.notificationSwitch.value = !_.notificationSwitch.value;
                 },
               ),
               ChildListTile(
                 title: 'settings.showDriver'.tr,
                 isSettings: true,
                 isBorder: false,
                 activeSwitch: _.driverSwitch.value,
                 onClick: (){
                   _.driverSwitch.value = !_.driverSwitch.value;
                 },
               ),
             ],
           ),
         );
       }
    );
  }

}
