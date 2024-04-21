import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ride_talk/ui/component/components.dart';
import 'package:ride_talk/utils/utils.dart';

class ChildListTile extends StatefulWidget {
  const ChildListTile({
    Key? key,
    this.title = '',
    this.icon = '',
    this.link = '',
    this.isFav = false,
    this.isSettings = false,
    this.isBorder = true,
    this.activeSwitch = true,
    this.onClick
  }) : super(key: key);

  final String title;
  final String icon;
  final String link;
  final bool isFav;
  final bool isSettings;
  final bool isBorder;
  final bool activeSwitch;
  final Function()? onClick;

  @override
  _ChildListTileState createState() => _ChildListTileState();
}

class _ChildListTileState extends State<ChildListTile> {
  @override
  Widget build(BuildContext context) {
    return widget.isSettings ?
    Column(
      children: [
        ListTile(
          dense: true,
          title: Text(
            widget.title,
            style: Styles().subHeaderStyle(
                AppColors.cTextGreyColor,
                AppDimens.mediumTextSize,
                AppFonts.robotoMedium
            ),
          ),
          trailing: FlutterSwitch(
            onTap: widget.activeSwitch,
            onClick: widget.onClick,
          ),
        ),
        widget.isBorder
          ? const Padding(
            padding: EdgeInsets.symmetric(horizontal:15.0),
            child: Divider(color: AppColors.cBorderColor),
          )
          : const SizedBox()
      ],
    ) :
    widget.isFav
     ? Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              widget.title,
              style: Styles().h4TextStyle(
                  AppColors.cTextDarkColor
              ),
            ),
            dense: true,
            leading: Image.asset(
              widget.icon,
              height: 40.0,
            ),
            onTap: (){
              Get.toNamed(widget.link);
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left:50.0),
            child: Divider(color: AppColors.cBorderColor,),
          ),
        ],
     )
      : Padding(
        padding: const EdgeInsets.symmetric(vertical:8.0),
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          horizontalTitleGap: 6,
          leading: Padding(
            padding: const EdgeInsets.only(top:3.0),
            child: Image.asset(
              widget.icon,
              width: 25.0,
              height: 25.0,
            ),
          ),
          tileColor: AppColors.cPrimaryColor,
          title: Text(
            widget.title,
            style: Styles().mediumTextStyle(
                AppColors.cTextGreyColor
            ),
          ),
          trailing: SvgPicture.asset('assets/icons/forward.svg'),
          onTap: (){
            Get.toNamed(widget.link);
          },
        ),
      );
  }
}