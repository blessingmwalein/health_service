import 'package:flutter/material.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:health_service/constants/urls.dart';
import 'package:health_service/models/user_group_chat_model.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';

class GroupChatCard extends StatelessWidget {
  final GroupChat group;
  // List of avatar image URLs or paths

  GroupChatCard({required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        //add border color
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Group Avatar Icon (You can use CircleAvatar or Image widget)
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('${UrlStrings.imagesBase}${group.icon}'),
                  // Replace with your group avatar image
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Group Name
                    Text(
                      group.name ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Member Count
                    Text(
                      '${group.users?.length} Members',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Container of Stacked User Avatars
            group.users!.isNotEmpty
                ? AvatarStack(
                    height: 40,
                    width: 140,
                    avatars: [
                      for (var n in group.users ?? [])
                        AssetImage('assets/images/user.png'),
                    ],
                  )
                : outlinedButton(context,
                    text: "Join",
                    isOulined: true,
                    width: 150,
                    height: 40,
                    isLoading: false)
          ],
        ),
      ),
    );
  }
}
