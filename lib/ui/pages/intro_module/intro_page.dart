import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatelessWidget {
  final WelcomeController welcomeController = WelcomeController.to;

   IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: _showBody(),
      ),
    );
  }

  Widget _showBody() {
    return Container(
      child: Stack(
        children: [
          PageView(
            onPageChanged: (int pageNumber) {
              if (pageNumber == 1) {
                welcomeController.isSkipDark(true);
                welcomeController.isLoginLight(false);
              } else if (pageNumber == 2) {
                welcomeController.isSkipDark(false);
                welcomeController.isLoginLight(true);
              } else {
                welcomeController.isSkipDark(false);
                welcomeController.isLoginLight(false);
              }
            },
            controller: welcomeController.welcomePageController,
            children: [
              _buildFirstPage(),
              _buildSecondPage(),
              _buildThirdPage(),
            ],
          ),
          _showSkipButton(),
          _showDotSection(),
        ],
      ),
    );
  }

  Widget _buildFirstPage() {
    return IntroDots(
      image: Container(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Image.asset('assets/images/neighbour_image.png'),
              Positioned(
                  child: Container(
                      padding: AppDimens.intoFirstPadding,
                      child: Image.asset('assets/images/taxi.png')
                  )
              ),
            ],
          )
      ),
      title: 'intro.neighbours'.tr,
      content: 'intro.neighboursContent'.tr,
    );
  }

  Widget _buildSecondPage() {
    return IntroDots(
      image: Container(
          alignment: Alignment.topRight,
          child: Stack(
            children: [
              Image.asset('assets/images/split_cost.png'),
              Positioned(
                  child: Container(
                      padding: AppDimens.intoSecondPadding,
                      child: Image.asset('assets/images/young_people.png')
                  )
              ),
            ],
          )
      ),
      title: 'intro.split'.tr,
      content: 'intro.splitSave'.tr,
      bgColor: AppColors.cLightPinkColor,
      headingColor: AppColors.cMediumVioletColor,
    );
  }

  Widget _buildThirdPage() {
    return IntroDots(
      image: Container(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Image.asset('assets/images/track_ride_image.png'),
              Positioned(
                  child: Container(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Image.asset('assets/images/man.png')
                  )
              )
            ],
          )
      ),
      title: 'intro.trackRide'.tr,
      content: 'intro.knowDrive'.tr,
      bgColor: AppColors.cLightBlueColor,
      headingColor: AppColors.cPrimaryColor,
    );
  }

  Widget _showSkipButton() {
    return Positioned(
        right: 0,
        top: 30,
        child: TextButton(
          child: GetX<WelcomeController>(
            builder: (_) {
              return _.isSkipDark.value
                ? Text(
                  'intro.skip'.tr,
                  style: Styles().subHeaderStyle(
                      AppColors.cIconLightColor,
                      AppDimens.smallTextSize,
                      AppFonts.robotoRegular
                  ),
                )
              : Text(
                   'intro.skip'.tr,
                    style: Styles().subHeaderStyle(AppColors.cPrimaryColor,
                        AppDimens.smallTextSize,
                        AppFonts.robotoRegular
                    ),
               );
            },
          ),
          onPressed: () {
            welcomeController.goToLoginPage();
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
          },
        )
    );
  }

  Widget _showDotSection() {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: Column(
        children: [
          _showPageIndicator(),
          _showLoginButton(),
        ],
      ),
    );
  }

  Widget _showPageIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SmoothPageIndicator(
        controller: welcomeController.welcomePageController,
        count: welcomeController.count,
        effect: const ExpandingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          spacing: 3.0,
          expansionFactor: 2.0,
          dotColor: AppColors.cPrimaryColor,
          activeDotColor: AppColors.cPrimaryColor,
        ),
      ),
    );
  }


  Widget _showLoginButton() {
    return GetX<WelcomeController>(
      builder: (_) {
        return RichText(
          text: TextSpan(
              text: 'intro.welcome'.tr,
              style: Styles().mediumTextStyle(
                  _.isLoginLight.value
                  ? AppColors.cPrimaryColor
                  : AppColors.cTextBrownColor
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'intro.login'.tr,
                  style: _.isLoginLight.value
                      ? Styles().textSmallStyleLight()
                      : Styles().textSmallStyle(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      welcomeController.goToLoginPage();
                      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
                    }
                 )
              ]
          ),
        );
      },
    );
  }
}
