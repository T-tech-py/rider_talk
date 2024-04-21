import 'package:flutter/material.dart';
import 'package:ride_talk/utils/utils.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    Key? key,
    this.isLeading = false,
    this.isAlert = true,
    this.onLeadingPress,
    this.onBellPress,
  }) : super(key: key);

  final bool isLeading;
  final bool isAlert;
  final Function? onLeadingPress;
  final Function? onBellPress;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 0,
            child: widget.isLeading ? IconButton(
              onPressed: () => widget.onLeadingPress!(),
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.cPrimaryColor,
              ),
            ) : const SizedBox(width: 50,),
        ),
        Expanded(
            flex: 0,
            child: widget.isAlert ? InkWell(
              onTap:() => widget.onBellPress!(),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/icons/bell_icon.png',
                      width: 15,
                    ),
                  ),
                  const Positioned(
                    top: 5,
                    right: 4,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColors.cGreenColor,
                    ),
                  )
                ],
              ),
            ) : const SizedBox(width: 50,)
        ),
      ],
    );
  }
}
