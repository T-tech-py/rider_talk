import 'package:flutter/material.dart';
import 'package:ride_talk/utils/utils.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);


  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  var sliderValue = 0.0;
  IconData myFeedback = Icons.emoji_emotions;
  Color myFeedbackColor = Colors.red;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Row(
        children: [
          Icon(
            myFeedback,
            color: myFeedbackColor,
            size: 60.0,
          ),
          Expanded(
            child: Slider(
              min: 0.0,
              max: 10.0,
              value: sliderValue,
              activeColor: AppColors.cGoogleLightColor,
              inactiveColor: Colors.blueGrey,
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;
                  if (sliderValue >= 0.0 &&
                      sliderValue <= 2.0) {
                    myFeedback = Icons.emoji_emotions;
                    myFeedbackColor = AppColors.cGoogleLightColor;
                  }
                  if (sliderValue >= 2.1 &&
                      sliderValue <= 4.0) {
                    myFeedback = Icons.emoji_emotions;
                    myFeedbackColor = AppColors.cRatingColor;
                  }
                  if (sliderValue >= 4.1 &&
                      sliderValue <= 6.0) {
                    myFeedback = Icons.emoji_emotions;
                    myFeedbackColor = AppColors.cAccentColor;
                  }
                  if (sliderValue >= 6.1 &&
                      sliderValue <= 8.0) {
                    myFeedback = Icons.emoji_emotions;
                    myFeedbackColor = AppColors.cInfoColor;
                  }
                  if (sliderValue >= 8.1 &&
                      sliderValue <= 10.0) {
                    myFeedback = Icons.emoji_emotions;
                    myFeedbackColor = AppColors.cGreenColor;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
