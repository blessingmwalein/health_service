import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/helper/helper_methods.dart';
import 'package:health_service/models/group_chat_message_model.dart';

Widget messageCardLeft(BuildContext context,
    {required GroupChatMessage message}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      // User Avatar
      const CircleAvatar(
        radius: 16,
        backgroundImage: AssetImage('assets/images/user.png'),
      ),
      const SizedBox(width: 8),
      // User Name
      Container(
        width: MediaQuery.of(context).size.width * 0.6,
        margin: const EdgeInsets.only(top: 10, right: 10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: primaryLightBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${message.sender?.firstName} ${message.sender?.lastName}',
              style: TextStyle(
                color: primaryBlack.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              message.message ?? '',
              style: const TextStyle(
                color: primaryBlack,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        Helper.formatPostDate(message.createdAt ?? DateTime.now()),
        style: TextStyle(
          color: primaryBlack.withOpacity(0.6),
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    ],
  );
}
