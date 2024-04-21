import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_talk/utils/utils.dart';

import 'divider_line.dart';

class PromoCard extends StatefulWidget {
  const PromoCard({
    Key? key,
    this.cardColor = AppColors.cAccentColor,
    @required
    this.title,
    this.titleColor = AppColors.cPrimaryColor,
    @required
    this.content,
    this.contentColor = AppColors.cAccentLightColor,
    this.buttonColor = AppColors.cSecondaryLightColor,
    @required
    this.buttonText,
    this.buttonTextColor = AppColors.cAccentColor,
    this.dividerColor = AppColors.cBorderDarkColor,

  }) : super(key: key);

  final Color? cardColor;
  final String? title;
  final Color? titleColor;
  final String? content;
  final Color? contentColor;
  final Color? buttonColor;
  final String? buttonText;
  final Color? buttonTextColor;
  final Color? dividerColor;

  @override
  State<PromoCard> createState() => _PromoCardState();
}

class _PromoCardState extends State<PromoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.cardColor!,
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: SvgPicture.asset('assets/icons/coupon_icon.svg'),
            ),
          ),
          Expanded(
            flex: 0,
            child: DividerLine(lineColor: widget.dividerColor!,height: 100,),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex:2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.title}',
                          style: Styles().h2TextStyleRoboto(widget.titleColor!),
                          overflow: TextOverflow.clip,
                        ),
                        Text(
                          '${widget.content}',
                          style: Styles().pTextStyle(widget.contentColor!),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: MaterialButton(
                      elevation: 0.0,
                      color: widget.buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          '${widget.buttonText}',
                          style: Styles().pTextStyle(widget.buttonTextColor!),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: (){},
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
