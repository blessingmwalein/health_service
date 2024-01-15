import 'package:flutter/material.dart';
import 'package:health_service/ui/util/icon.dart';

SnackBar snackBar(BuildContext context,
    {required String message,
    required Color? backgroundColor,
    required Color textColor,
    required String icon,
    int duration = 5}) {
  return SnackBar(
    content: Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0), // Rounded corners
      ),
      child: Row(
        children: [
          myIcon(path: icon, height: 30, width: 30, iconColor: textColor),
          const SizedBox(
            width: 10,
          ),
          Text(
            message,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
