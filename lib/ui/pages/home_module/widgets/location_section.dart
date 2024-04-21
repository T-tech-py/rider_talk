import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_talk/utils/utils.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context,int index){
          return Padding(
            padding: const EdgeInsets.only(bottom:10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: SvgPicture.asset('assets/icons/location_icon.svg'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.locationName,
                        style: Styles().h3TextStyle(
                            AppColors.cTextColor
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:5.0,bottom: 8.0),
                        child: Text(
                          AppStrings.favAddress,
                          style: Styles().h4TextStyle(
                              AppColors.cBorderColor
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
