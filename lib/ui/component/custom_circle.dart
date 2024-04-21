import 'package:flutter/material.dart';
import 'package:ride_talk/utils/utils.dart';

class CustomCircle extends StatefulWidget {
  const CustomCircle({Key? key, 
    this.firstRadius = 40.0,
    required this.child,
    required this.icon,
    this.outerCircleColor = AppColors.cTextLightColor,
    this.innerCircleColor = AppColors.cTextColor,
    this.isIcon = false,
    this.isBorder = false,
  }) : super(key: key);

  final double firstRadius;
  final Widget child;
  final Widget icon;
  final Color outerCircleColor;
  final Color innerCircleColor;
  final bool isIcon;
  final bool isBorder;

  @override
  _CustomCircleState createState() => _CustomCircleState();
}

class _CustomCircleState extends State<CustomCircle> {
  @override
  Widget build(BuildContext context) {
    return widget.isBorder
        ? Stack(
          children: [
            CircleAvatar(
              radius: widget.firstRadius,
              child: widget.child,
              backgroundColor: widget.innerCircleColor,
            ),
            Positioned(
                right: 5,
                top: 5,
                child: widget.isIcon
                    ? widget.icon
                    : Container()
            )
          ],
        )
        : Stack(
         children: [
          CircleAvatar(
            radius: widget.firstRadius + 3,
            backgroundColor: widget.outerCircleColor,
            child: CircleAvatar(
              radius: widget.firstRadius,
              child: widget.child,
              backgroundColor: widget.innerCircleColor,
            ),
          ),
          Positioned(
            right: 2,
            top: 2,
            child: widget.isIcon
              ? widget.icon
              : Container()
          )
        ],
       );
  }
}
