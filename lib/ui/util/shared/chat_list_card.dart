import 'package:flutter/material.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/helper/helper_methods.dart';
import 'package:health_service/models/user_group_chat_model.dart';

class ChatListCard extends StatelessWidget {
  final GroupChat group;

  ChatListCard({
    required this.group
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //botom border line
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
      margin: const EdgeInsets.only(right: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvatarStack(
                  height: 40,
                  width: 140,
                  borderColor: primaryPurple,
                  avatars: [
                    for (var n in group.users ?? []) AssetImage('assets/images/user.png'),
                  ],
                ),
                 Text(
                  Helper.formatPostDate(group.createdAt ?? DateTime.now() ),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            // Container of Stacked User Avatars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  group.name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: primaryPurple,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
