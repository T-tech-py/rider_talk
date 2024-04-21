import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/ui/pages/splash_module/widgets/loading_widget.dart';
import 'package:ride_talk/utils/utils.dart';

class SeatSelectionPage extends GetView<LanguageController> {
  const SeatSelectionPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      appBar: ApplicationBar(
        backgroundColor: AppColors.cScaffoldColor,
        title: '',
        isLeading: true,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)
        ),
      ),
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context){
    return ListView(
      padding: AppDimens.pagePadding,
      children: [
        _showTitle(),
        _showCarSeatSection(context),
        _showRandomText(),
        const SizedBox(height: 20,),
        _showConfirmButton(),
        const SizedBox(height: 50,),
      ],
    );
  }

  Widget _showTitle(){
    return Text(
      'seat.title'.tr,
      style: const TextStyle(
          color: AppColors.cTextDarkColor,
          fontSize: AppDimens.largeSize,
          fontFamily: AppFonts.poppinsSemiBold,
          height: 1
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _showCarSeatSection(BuildContext context){
    return GetX<ProfileController>(
      builder: (ctx) {
        return Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: AppUtility().contentHeight(context) *.75,
                child: Image.asset('assets/images/seat_booking_image.png')
            ),
            Positioned(
              left: 70.0,
              top: AppUtility().contentWidth(context) *.8,
               child: Row(
                 children: [
                   Transform.scale(
                     scale: 0.8,
                     child: FloatingActionButton(
                       heroTag: 'Set1Seat',
                       backgroundColor: AppColors.cAccentColor,
                       child: ctx.isSet1Seat.value
                           ? _showRiderImage()
                           : const Icon(Icons.add,color: AppColors.cPrimaryColor,),
                       onPressed: (){
                         ctx.selectSeat(1);
                       },
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left:8.0),
                     child: Transform.scale(
                       scale: 0.8,
                       child: FloatingActionButton(
                         heroTag: 'Set2Seat',
                         backgroundColor: AppColors.cAccentColor,
                         child: ctx.isSet2Seat.value
                             ? _showRiderImage()
                             : const Icon(Icons.add,color: AppColors.cPrimaryColor,),
                         onPressed: (){
                           ctx.selectSeat(2);
                         },
                       ),
                     ),
                   ),
                 ],
               )
            ),
            Positioned(
                left: 70.0,
                top: AppUtility().contentWidth(context) *.5,
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: FloatingActionButton(
                        heroTag: 'Set4Seat',
                        backgroundColor: AppColors.cAccentColor,
                        child: ctx.isSet4Seat.value
                            ? _showRiderImage()
                            : const Icon(Icons.add,color: AppColors.cPrimaryColor,),
                        onPressed: (){
                          ctx.selectSeat(4);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:5.0),
                      child: Transform.scale(
                        scale: 0.8,
                        child: FloatingActionButton(
                          heroTag: 'Set3Seat',
                          backgroundColor: AppColors.cAccentColor,
                          child: ctx.isSet3Seat.value
                              ? _showRiderImage()
                              : const Icon(Icons.add,color: AppColors.cPrimaryColor,),
                          onPressed: (){
                            ctx.selectSeat(3);
                          },
                        ),
                      ),
                    ),
                  ],
                )
            ),
            Positioned(
                left: AppUtility().contentWidth(context) *.48,
                bottom: AppUtility().contentWidth(context) *.32,
                child: Stack(
                  children: [
                    SvgPicture.asset('assets/icons/info_back.svg', width: AppUtility().contentWidth(context) *.4,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'seat.choosy'.tr,
                            style: Styles().h3TextStyle(AppColors.cPrimaryColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text(
                              'seat.content'.tr,
                              style: Styles().h5TextStyle(AppColors.cBorderColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ],
        );
      }
    );
  }


  Widget _showRiderImage(){
    return CircleAvatar(
      radius: 28.0,
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

  Widget _showRandomText(){
    return Center(
      child: Text(
        'seat.random'.tr,
        style: Styles().h3TextStyle(
          AppColors.cTextDarkColor
        ),
      ),
    );
  }

  Widget _showConfirmButton(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0,30.0),
      child: PrimaryButton(
          text: 'seat.confirm'.tr,
          btnTxtStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
          onPressed: (){
            Get.back();
          }
      ),
    );
  }

}
