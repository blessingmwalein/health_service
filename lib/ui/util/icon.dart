import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_service/constants/theme.dart';

Widget myIcon(
    {required String path,
    required double width,
    required double height,
    Color iconColor = primaryPurple}) {
  return SvgPicture.asset(
    path, // Replace with your icon's path
    width: width, // Set the width and height as needed
    height: height,
    color: iconColor,
  );
}
