import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/ui/util/icon.dart';

Widget appBarButton(BuildContext context, {required String icon}) {
  //create circle avatar with online dot indicator top right corner
  return Stack(
    children: [
      //the avatar should be inside a container wit background color
      Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: primaryLightBackground,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: primaryLightBackground,
            width: 2,
          ),
        ),
        child:
            myIcon(path: icon, width: 40, height: 40, iconColor: primaryBlue),
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
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget iconButton(BuildContext context,
    {required String icon, Color color = primaryBlue}) {
  //create circle avatar with online dot indicator top right corner
  return Container(
    width: 50,
    height: 50,
    padding: const EdgeInsets.all(9),
    decoration: BoxDecoration(
      color: primaryLightBackground,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: primaryLightBackground,
        width: 2,
      ),
    ),
    child: myIcon(path: icon, width: 20, height: 20, iconColor: color),
  );
}

Widget outlinedButton(BuildContext context,
    {required String text,
    double? width,
    double? height,
    String? iconPath,
    required bool isOulined,
    Color? color,
    Function()? onPressed,
    bool isLoading = false}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: isOulined
            ? Border.all(color: color ?? primaryOrange, width: 2)
            : null,
        color: isOulined ? null : color ?? primaryOrange,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconPath != null
              ? myIcon(
                  path: iconPath,
                  width: 20,
                  height: 20,
                  iconColor: isOulined ? color ?? primaryOrange : primaryWhite)
              : Container(),
          isLoading
              ? const CircularProgressIndicator(
                  color: primaryWhite,
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isOulined ? color ?? primaryOrange : primaryWhite,
                  ),
                ),
        ],
      ),
    ),
  );
}

Widget socialMediaButton(BuildContext context,
    {required String text,
    double? width,
    double? height,
    required String iconPath,
    Function()? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primaryGray.withOpacity(0.5), width: 1),
      ),
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: myIcon(
                path: iconPath,
                width: 20,
                height: 20,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: primaryPurple,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
