import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key, 
    @required
    this.lineColor,
    this.contentMargin = const EdgeInsets.symmetric(horizontal: 15.0,vertical: 2.0),
    this.height = 50.0,
  }) : super(key: key);

  final Color? lineColor;
  final EdgeInsets? contentMargin;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!,
      child: Column(
        children: [
          Image.asset(
              'assets/images/top_triangle.png',
            width: 10,
            height: 10,
          ),
          Expanded(
            child: Container(
              width: 1,
              margin: contentMargin!,
              decoration: DottedDecoration(
                  color: lineColor!,
                  shape: Shape.line,
                  linePosition: LinePosition.left
              ),
            ),
          ),
          Image.asset(
            'assets/images/bottom_triangle.png',
            width: 10,
            height: 10,),
        ],
      ),
    );
  }
}
