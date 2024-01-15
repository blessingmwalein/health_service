import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/helper/helper_methods.dart';
import 'package:health_service/models/group_chat_message_model.dart';

Widget messageCardRight(BuildContext context,
    {required GroupChatMessage message}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        Helper.formatPostDate(message.createdAt ?? DateTime.now()),
        style: TextStyle(
          color: primaryBlack.withOpacity(0.6),
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        margin: const EdgeInsets.only(top: 10, right: 10),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(0),
            topRight: Radius.circular(10),
          ),
        ),
        child: Text(
          message.message ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}
