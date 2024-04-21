import 'package:flutter/material.dart';
import 'package:ride_talk/utils/utils.dart';
class SocialMediaButtons extends StatefulWidget {
  const SocialMediaButtons({
    Key? key,
    required this.fbOnPressed,
    required this.gOnPressed,
    required this.tOnPressed
  }) : super(key: key);

  final Function()? fbOnPressed;
  final Function()? gOnPressed;
  final Function()? tOnPressed;


  @override
  State<SocialMediaButtons> createState() => _SocialMediaButtonsState();
}

class _SocialMediaButtonsState extends State<SocialMediaButtons> {
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
        MaterialButton(
          onPressed: () => widget.gOnPressed!(),
          textColor: AppColors.cPrimaryColor,
          child: Image.asset(
            'assets/icons/google_icon.png',
            width: 45,
          ),
          padding: const EdgeInsets.all(2.0),
          shape: const CircleBorder(),
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
        )
      ],
    );
  }
}


// class SocialMediaButtons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           InkWell(
//             onTap: (){},
//             child: Container(
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                   colors: [
//                     AppColors.cFbLightColor,
//                     AppColors.cFbDarkColor,
//                   ]
//                 )
//               ),
//               alignment: Alignment.center,
//               child: SvgPicture.asset('assets/icons/fb.svg'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal:15.0),
//             child: InkWell(
//               onTap: (){},
//               child: Container(
//                 height: 50,
//                 width: 50,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                         colors: [
//                           AppColors.cGoogleLightColor,
//                           AppColors.cGoogleDarkColor,
//                         ]
//                     )
//                 ),
//                 child: SvgPicture.asset('assets/icons/google.svg'),
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: (){},
//             child: Container(
//               height: 50,
//               width: 50,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                   gradient: LinearGradient(
//                       colors: [
//                         AppColors.cTwitterLightColor,
//                         AppColors.cTwitterDarkColor,
//                       ]
//                   )
//               ),
//               child: SvgPicture.asset('assets/icons/twitter.svg'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
