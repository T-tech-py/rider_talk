import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/pages/pages.dart';
import 'package:ride_talk/utils/utils.dart';

class DashboardPage extends GetView<DashboardController> {
  DashboardPage({Key? key}) : super(key: key);
  final DashboardController _dashboardController = DashboardController();

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom:35.0),
            child:KeyboardVisibilityBuilder(
                builder: (context, isKeyboardVisible) {
                  return isKeyboardVisible
                   ? const SizedBox(height: 0,)
                   : FloatingActionButton(
                    backgroundColor: AppColors.cAccentColor,
                    child: SvgPicture.asset('assets/icons/search_icon.svg'),
                      elevation: 1.0,
                      onPressed: (){
                        Get.toNamed('/search-result');
                      }
                  );
                }
            )

          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: _showBody(context)
        );
  }

  Widget _showBody(BuildContext context){
    return PersistentTabView(
      context,
      controller: _dashboardController.controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      padding: const NavBarPadding.symmetric(vertical: 20.0),
      navBarHeight: AppUtility().contentWidth(context) * .15,
      backgroundColor: AppColors.cBackgroundColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
        colorBehindNavBar: AppColors.cBackgroundColor,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.simple,
    );
  }

  List<Widget> _buildScreens() {
    return [
       HomePage(),
       ChatListPage(),
      // RideDetails(),
      const WalletPage(),
      const ProfilePage(),
      // DriverProfile()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/icons/home_selected_icon.png'),
        inactiveIcon: Image.asset('assets/icons/home_icon.png'),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/icons/chat_selected_icon.png'),
        inactiveIcon: Image.asset('assets/icons/chat_icon.png'),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/icons/wallet_selected_icon.png'),
        inactiveIcon: Image.asset('assets/icons/wallet_icon.png'),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/icons/profile_selected_icon.png'),
        inactiveIcon: Image.asset('assets/icons/profile_icon.png'),
      ),
    ];
  }

}
