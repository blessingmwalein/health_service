
//circle user avatar widget with online dot bottom center
import 'package:flutter/material.dart';

Widget circleUserAvatar(BuildContext context,
    {required String image, required bool isOnline}) {
  return Stack(
    children: [
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      if (isOnline)
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        ),
    ],
  );
}


