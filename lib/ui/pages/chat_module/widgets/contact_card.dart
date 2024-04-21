import 'package:flutter/material.dart';
import 'package:ride_talk/utils/utils.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.cPrimaryColor,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: _showImage(),
            ),
            Expanded(
              flex: 3,
              child: _showContactInfo(),
            ),
            Expanded(
              flex: 0,
              child: _showTime(),
            ),
          ],
        )
    );
  }


  Widget _showImage(){
    return const Padding(
      padding: EdgeInsets.all(5.0),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
            ),
          ),
          Positioned(
            top: 2,
            right: 0,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: AppColors.cPrimaryColor,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: AppColors.cGreenColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _showContactInfo(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Polly Pipe',
            style: Styles().h3TextStyle(AppColors.cTextDarkColor),
          ),
          Text('There are many variations of passages',
            style: Styles().pTextStyle(AppColors.cTextLightColor),
          ),
        ],
      ),
    );
  }

  Widget _showTime(){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text('3:03 PM',
        style: Styles().h5TextStyle(AppColors.cBorderColor),
      ),
    );
  }
}
