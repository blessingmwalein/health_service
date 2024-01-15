import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';

class CommentCard extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String comment;
  final String time;

  CommentCard({
    required this.avatarUrl,
    required this.userName,
    required this.comment,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Avatar
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          SizedBox(width: 8),
          // Comment Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name
                Text(
                  userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Comment Text
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryPurple.withOpacity(0.08),
                      // border: Border.all(
                      //   color: primaryPurple.withOpacity(0.08),
                      //   width: 1.0,
                      // ),
                    ),
                    child: Text(comment)),
                // Time Posted
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
