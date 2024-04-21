import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/splash_module/widgets/widgets.dart';
import 'package:ride_talk/utils/utils.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
      appBar: const ApplicationBar(
        title: '',
        elevation: 0.0,
        backgroundColor: Color(0xffF8F8FA),
        // leading: IconButton(
        //     onPressed: (){},
        //     icon: Icon(Icons.arrow_back)
        // ),
      ),
      body: _showBody(),
    );
  }

  Widget _showBody() {
    return ListView(
      padding: AppDimens.pagePadding,
      children: [
        _showTitle(),
        _showCard(),
        _showAmount(),
        _showButtons(),
        _showStatementList(),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }

  Widget _showTitle() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        'wallet.title'.tr,
        style: Styles().h1TextStyle(AppColors.cTextDarkColor),
      ),
    );
  }

  Widget _showCard() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Image.asset('assets/images/card_design.png'),
    );
  }

  Widget _showAmount() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            'wallet.balance'.tr.toUpperCase(),
            style: Styles().pTextStyle(AppColors.cBorderColor),
          ),
          Text('\$10,000'.toUpperCase(),
              style: Styles().subHeaderStyle(
                  AppColors.cInfoColor,
                  AppDimens.largeTextSize,
                  AppFonts.robotoMedium,
              ),
          )
        ],
      ),
    );
  }

  Widget _showButtons(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: AppColors.cBorderColor,
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/add_icon.svg',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('wallet.add'.tr.toUpperCase(),
                    style: Styles().pTextStyle(AppColors.cPrimaryColor),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: AppColors.cBorderColor,
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/send_fill_icon.svg',
                  color: AppColors.cPrimaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('forgot.send'.tr.toUpperCase(),
                    style: Styles().pTextStyle(AppColors.cPrimaryColor),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _showStatementList() {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 20),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _listItems();
        }
    );
  }

  Widget _listItems(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        color: AppColors.cPrimaryColor,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _showImage(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('wallet.ridePayment'.tr,
                    style: Styles().h4TextStyle(AppColors.cTextDarkColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Text('12 Jun, 2020',
                      style: Styles().pTextStyle(AppColors.cTextLightColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('wallet.amountStatus'.tr,
                      style: Styles().pTextStyle(AppColors.cTextLightColor),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$200',
                      style: Styles().h3TextStyle(AppColors.cAccentColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Barry Kade',
                        style: Styles().h5TextStyle(
                            AppColors.cTextLightColor
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showImage(){
    return CircleAvatar(
      radius: 60.0,
      child: CachedNetworkImage(
        imageUrl: 'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.white60,
                BlendMode.overlay,
              ),
            ),
          ),
        ),
        placeholder: (context, url) => const LoadingWidget(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }


}
