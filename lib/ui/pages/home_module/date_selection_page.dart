import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateSelectionPage extends StatelessWidget{
  const DateSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
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
    return Container(
      padding: AppDimens.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _showTitle(),
          _showCalenderSection(),
          _showSetDateButton(),
        ],
      ),
    );
  }

  Widget _showTitle(){
    return Text(
      'date.title'.tr,
      style: const TextStyle(
          color: AppColors.cTextDarkColor,
          fontSize: AppDimens.largeSize,
          fontFamily: AppFonts.poppinsSemiBold,
          height: 1
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _showCalenderSection(){
    return GetBuilder<DashboardController>(
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.cCardColor,
            borderRadius: BorderRadius.circular(8.0)
          ),
          padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 35.0),
          child: SfDateRangePicker(
            enablePastDates: false,
            headerHeight: 50,
            view: DateRangePickerView.month,
            showNavigationArrow: false,
            headerStyle: DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor)
            ),
            selectionColor: AppColors.cAccentColor,
            yearCellStyle: DateRangePickerYearCellStyle(
              textStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
              leadingDatesTextStyle: Styles().h2TextStyleRoboto(AppColors.cDateInActiveColor),
              disabledDatesTextStyle: Styles().h2TextStyleRoboto(AppColors.cDateInActiveColor),
              todayTextStyle: Styles().h2TextStyleRoboto(AppColors.cAccentColor),
            ),
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
              leadingDatesTextStyle: Styles().h2TextStyleRoboto(AppColors.cDateInActiveColor),
              trailingDatesTextStyle: Styles().h2TextStyleRoboto(AppColors.cDateInActiveColor),
              disabledDatesTextStyle: Styles().h2TextStyleRoboto(AppColors.cDateInActiveColor),
              todayTextStyle: Styles().h2TextStyleRoboto(AppColors.cAccentColor),
            ),
            monthViewSettings: DateRangePickerMonthViewSettings(
              dayFormat: 'E',
              viewHeaderHeight: 40.0,
              showTrailingAndLeadingDates: true,
              viewHeaderStyle: DateRangePickerViewHeaderStyle(
                textStyle: Styles().h5TextStyle(AppColors.cDateColor)
              ),
            ),
            selectionTextStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
            selectionMode: DateRangePickerSelectionMode.single,
            rangeSelectionColor: AppColors.cTextLightColor,
            endRangeSelectionColor: AppColors.cTextLightColor,
            startRangeSelectionColor: AppColors.cTextLightColor,
            todayHighlightColor: AppColors.cAccentColor,
            toggleDaySelection: true,
            rangeTextStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
            initialSelectedDate: DateTime.now(),
            // initialSelectedRange: PickerDateRange(
            //     DateTime.now().subtract(const Duration(days: 4)),
            //     DateTime.now().add(const Duration(days: 3))
            // ),
            onSelectionChanged:(args){
              ctx.onSelectDate(args);
            },
          ),
        );
      }
    );
  }

  Widget _showSetDateButton(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Row(
        children: [
          const Expanded(flex: 1,child: Text('')),
          Expanded(
            flex: 9,
            child: PrimaryButton(
              text: 'date.setDate'.tr,
              btnTxtStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
              onPressed: (){
                Get.back();
              }
            ),
          ),
          const Expanded(flex: 1,child: Text('')),
        ],
      ),
    );
  }

}
