import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';

Widget headingText(String text, Function() onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: primaryBlack.withOpacity(0.7)),
      ),
      InkWell(
        onTap: onTap,
        child: const Text(
          'See all',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: primaryBlue),
        ),
      )
    ],
  );
}
