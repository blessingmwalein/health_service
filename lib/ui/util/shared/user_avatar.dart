
import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';

Widget userAvatar(BuildContext context,
    {double width = 100, double height = 100}) {
  //create circle avatar with online dot indicator top right corner
  return Stack(
    children: [
      //the avatar should be inside a container wit background color
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: primaryLightBlue,
          shape: BoxShape.circle,
          border: Border.all(
            color: primaryLightBlue,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: primaryLightBlue,
          radius: 20,
          child: Image.asset(
            'assets/images/user.png',
            height: 35,
            width: 35,
          ),
        ),
      ),
      Positioned(
        top: 0,
        right: 0,
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.green,
              width: 2,
            ),
          ),
        ),
      ),
    ],
  );
}
