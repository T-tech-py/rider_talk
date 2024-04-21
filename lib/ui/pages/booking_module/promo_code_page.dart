import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/booking_module/widgets/promo_card.dart';
import 'package:ride_talk/utils/utils.dart';

class PromoCodePage extends GetView<LanguageController> {
  const PromoCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
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

  Widget _showBody() {
    return ListView(
      padding: AppDimens.pagePadding,
      children: [
        _showPageTitle(),
        _showCodeField(),
        _showActiveCodeCard(),
        _showInActiveCodeCard(),
        _useCodeButton()
      ],
    );
  }

  Widget _showPageTitle() {
    return Text(
      'promo.title'.tr,
      style: Styles().h1TextStyle(AppColors.cTextDarkColor),
    );
  }

  Widget _showCodeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0),
      child: Row(
        children: [
          Expanded(
            flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: TextFormFields(
                  autoFocus: false,
                  isBorder: false,
                  cursorColor: AppColors.cAccentDarkColor,
                  hintText: 'promo.enterPromoCode'.tr,
                  filled: true,
                  hintStyle: Styles().h4TextStyle(
                      AppColors.cTextMediumColor
                  ),
                  fieldStyle: Styles().h4TextStyle(
                      AppColors.cAccentDarkColor
                  ),
                  fillColor: AppColors.cShadowColor,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.newline,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              )
          ),
          Expanded(
            flex: 2,
            child: PrimaryButton(
              buttonColor: AppColors.cAccentDarkColor,
              splashColor: AppColors.cAccentDarkColor,
              text: 'promo.apply'.tr,
              btnTxtStyle: Styles().pTextStyle(AppColors.cPrimaryColor),
              onPressed: () => null,
            ),
          ),
        ],
      ),
    );
  }
  Widget _showActiveCodeCard() {
    return Column(
      children: [
        PromoCard(
          title: 'Your next ride is on us',
          content: 'Valid to 09/25/2020',
          buttonText: 'promo.get'.tr,
        ),
      ],
    );
  }

  Widget _showInActiveCodeCard() {
    return  Column(
      children: [
        PromoCard(
          cardColor: AppColors.cCardColor,
          title: 'Carpool starting at rs 3 per KM',
          titleColor: AppColors.cCardTextColor,
          content: 'Valid to 09/25/2020',
          contentColor: AppColors.cBorderColor,
          buttonColor: AppColors.cBorderColor,
          buttonText: 'promo.get'.tr,
          buttonTextColor: AppColors.cPrimaryColor,
        ),
        PromoCard(
          cardColor: AppColors.cCardColor,
          title: 'Save upto 30% Off',
          titleColor: AppColors.cCardTextColor,
          content: 'Valid to 09/25/2020',
          contentColor: AppColors.cBorderColor,
          buttonColor: AppColors.cBorderColor,
          buttonText: 'promo.get'.tr,
          buttonTextColor: AppColors.cPrimaryColor,
        ),
        PromoCard(
          cardColor: AppColors.cCardColor,
          title: 'Save upto 30% Off',
          titleColor: AppColors.cCardTextColor,
          content: 'Valid to 09/25/2020',
          contentColor: AppColors.cBorderColor,
          buttonColor: AppColors.cBorderColor,
          buttonText: 'promo.get'.tr,
          buttonTextColor: AppColors.cPrimaryColor,
        ),
      ],
    );
  }

  Widget _useCodeButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 50),
      child: PrimaryButton(
        buttonColor: AppColors.cAccentColor,
        splashColor: AppColors.cAccentColor,
        text: 'promo.button'.tr,
        btnTxtStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
        onPressed: () => null,
      ),
    );
  }

}
