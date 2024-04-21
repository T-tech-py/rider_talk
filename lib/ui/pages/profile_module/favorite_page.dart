import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/home_module/widgets/location_section.dart';
import 'package:ride_talk/ui/pages/profile_module/widgets/child_list_tile.dart';
import 'package:ride_talk/utils/utils.dart';

class FavoritePage extends GetView<LanguageController> {
  const FavoritePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(
        title: '',
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
      padding: AppDimens.pagePadding,
      children: [
        _showHeading(),
        _showHomeSection(),
        _showOfficeSection(),
        _showContentHeading(),
        _showList(),
      ],
    );
  }

  Widget _showHeading(){
    return Padding(
      padding: const EdgeInsets.only(bottom:15.0),
      child: Text(
        'app.myFav'.tr,
        style: Styles().subHeaderStyle(
            AppColors.cTextColor,
            AppDimens.h1Size,
            AppFonts.poppinsRegular
        ),
      ),
    );
  }

  Widget _showHomeSection(){
    return ChildListTile(
      title: 'app.home'.tr,
      icon: 'assets/icons/home_circle.png',
      link: '/dashboard',
      isFav: true,
    );
  }

  Widget _showOfficeSection(){
    return ChildListTile(
        title: 'app.office'.tr,
        icon: 'assets/icons/office_circle.png',
        link: '/dashboard',
        isFav: true,
    );
  }

  Widget _showContentHeading(){
    return Padding(
      padding: const EdgeInsets.only(bottom:20.0,top: 20.0),
      child: Text(
        'fav.other'.tr,
        style: Styles().subHeaderStyle(
            AppColors.cTextColor,
            AppDimens.h4Size,
            AppFonts.robotoMedium
        ),
      ),
    );
  }

  Widget _showList(){
    return const LocationSection();
  }

}
