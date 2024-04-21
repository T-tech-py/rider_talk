import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_talk/utils/utils.dart';

class ReferAppButtons extends StatefulWidget {
  const ReferAppButtons({
    Key? key,
    required this.fbOnPressed,
    required this.whatsAppPressed,
    required this.tOnPressed,
    required this.otherPressed
  }) : super(key: key);

  final Function()? fbOnPressed;
  final Function()? whatsAppPressed;
  final Function()? tOnPressed;
  final Function()? otherPressed;


  @override
  State<ReferAppButtons> createState() => _ReferAppButtonsState();
}

class _ReferAppButtonsState extends State<ReferAppButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () => widget.fbOnPressed!(),
          textColor: AppColors.cPrimaryColor,
          child: Image.asset(
            'assets/icons/fb_icon.png',
            width: 45,
          ),
          padding: const EdgeInsets.all(2.0),
          shape: const CircleBorder(),
        ),
        InkWell(
          child: CircleAvatar(
            backgroundColor: AppColors.cGreenColor,
            radius: 24,
            child: SvgPicture.asset('assets/icons/whatsapp.svg'),
          ),
          onTap: () => widget.whatsAppPressed!(),
        ),
        MaterialButton(
          onPressed: () => widget.tOnPressed!(),
          textColor: AppColors.cPrimaryColor,
          child: Image.asset(
            'assets/icons/twiter_icon.png',
            width: 45,
          ),
          padding: const EdgeInsets.all(2.0),
          shape: const CircleBorder(),
        ),
        InkWell(
          onTap: () => widget.otherPressed!(),
          child: CircleAvatar(
            backgroundColor: AppColors.cTextMediumColor,
            radius: 24,
            child: SvgPicture.asset(
              'assets/icons/horizontal_dots.svg',
              color: AppColors.cPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}