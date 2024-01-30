import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/constants/urls.dart';
import 'package:health_service/models/topic_model.dart';
import 'package:health_service/ui/util/icon.dart';

Widget symptomCard(Topic topic) {
  return Column(
    children: [
      Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: primaryLightBlue,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: primaryLightBlue,
            width: 2,
          ),
        ),
        child: FadeInImage(
          image: NetworkImage(
            '${UrlStrings.imagesBase}${topic.icon}',
          ),
          placeholder: const AssetImage('assets/images/default.jpg'),
          width: 40,
          height: 40,
          fit: BoxFit.cover,
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/default.jpg',
              height: 40.0,
              width: 40.0,
            );
          },
        ),
      ),
      Expanded(
        child: Container(
          width: 100,
          child: Text(
            topic.title ?? '',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: primaryBlack.withOpacity(0.7),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget stiCard(Sti sti) {
  return Column(
    children: [
      Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: primaryLightBlue,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: primaryLightBlue,
            width: 2,
          ),
        ),
        child: FadeInImage(
          image: NetworkImage(
            '${UrlStrings.imagesBase}${sti.image}',
          ),
          placeholder: const AssetImage('assets/images/default.jpg'),
          width: 40,
          height: 40,
          fit: BoxFit.cover,
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/default.jpg',
              height: 40.0,
              width: 40.0,
            );
          },
        ),
      ),
      Text(
        sti.name ?? '',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: primaryBlack.withOpacity(0.7),
        ),
      ),
    ],
  );
}
