import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final WelcomeController _welcomeController=WelcomeController.to;

  @override
  void initState() {
    _initAnimationController();
    _showLogoAndNavigate();
    super.initState();
  }

  void _initAnimationController() {
    _welcomeController.splashAnimationController = AnimationController(
      vsync: this,
      duration: _welcomeController.splashTransitionDuration,
    );
  }

  void _showLogoAndNavigate() {
    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() => _welcomeController.isSplashExpanded = true.obs))
        .then(
          (value) => Future.delayed(_welcomeController.splashTransitionDuration * 2).then(
            (value) => _welcomeController.splashAnimationController
                .forward()
                .then((value) => {_welcomeController.goToStartPage()}),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: _showMaterialBody(),
    );
  }

  Widget _showMaterialBody() {
    return Material(
      child: Container(
        color: AppColors.cAccentDarkColor,
        child: Stack(
          children: [
            _showTopVector(),
            _showBottomVector(),
            _showCenterSection(),
          ],
        ),
      ),
    );
  }

  Widget _showTopVector() {
    return Positioned(
        top: 0, child: Image.asset('assets/images/splash_top_vector.png'));
  }

  Widget _showBottomVector() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Image.asset('assets/images/splash_bottom_vector.png'));
  }

  Widget _showCenterSection() {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _showAnimatedCrossFade(),
          _showSplashLogo(),
        ],
      ),
    );
  }

  Widget _showAnimatedCrossFade(){
    return AnimatedCrossFade(
      firstCurve: Curves.fastOutSlowIn,
      crossFadeState: !_welcomeController.isSplashExpanded.value
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: _welcomeController.splashTransitionDuration,
      firstChild: const Text('R'),
      secondChild: RotatedBox(
        quarterTurns: -1,
        child: Text(
          'app.title'.tr,
          style: Styles().titleStyle(),
        ),
      ),
      alignment: Alignment.centerLeft,
      sizeCurve: Curves.easeIn,
    );
  }

  Widget _showSplashLogo(){
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: AnimatedDefaultTextStyle(
          duration: _welcomeController.splashTransitionDuration,
          curve: Curves.fastOutSlowIn,
          style: const TextStyle(),
          child: Image.asset('assets/images/logo.png')),
    );
  }

}
