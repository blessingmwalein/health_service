import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/ui/util/icon.dart';

Widget actionButton(String text, String icon) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        color: primaryLightBlue, borderRadius: BorderRadius.circular(10)),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          myIcon(
              path: icon,
              width: 35,
              height: 35,
              iconColor: primaryBlue),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: primaryBlue),
          ),
        ],
      ),
    ),
  );
}