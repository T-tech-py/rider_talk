import 'package:flutter/material.dart';
import 'package:ride_talk/controllers/controllers.dart';
import 'package:ride_talk/utils/utils.dart';

class FlutterSwitch extends StatelessWidget {
  FlutterSwitch({Key? key, 
    this.onClick,
    this.backGroundColor = AppColors.cTextGreyColor,
    this.switchColor = AppColors.cGreenColor,
    this.switchOffColor = AppColors.cTextGreyColor,
    this.onTap = false,
  }) : super(key: key);
  final Function()? onClick;
  final Color backGroundColor;
  final Color switchColor;
  final Color switchOffColor;
  final bool onTap;

  final AuthController _authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(11.0),
            width: 30,
            height: 2,
            decoration: BoxDecoration(
                color: backGroundColor
            ),
          ),
          _authController.onClick.value ? Positioned(
            right: 0,
            child: Icon(
              Icons.circle,
              color: switchColor,
            ),
          ) :
          onTap ? Positioned(
            right: 0,
            child: Icon(
              Icons.circle,
              color: switchColor,
            ),
          ) :
          Positioned(
            left: 0,
            child: Icon(
              Icons.circle,
              color: switchOffColor,
            ),
          )
        ],
      ),
      onTap: onClick,
    );
  }
}
