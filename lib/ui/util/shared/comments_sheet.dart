import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/comment_card.dart';

class CommentBottomSheet extends StatefulWidget {
  @override
  _CommentBottomSheetState createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();

  // Dummy list of comments
  final List<String> _comments = [
    'Comment 1',
    'Comment 2',
    'Comment 3',
    // Add more comments as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // List view of comments
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return CommentCard(
                  avatarUrl: 'https://via.placeholder.com/50',
                  userName: 'John Doe',
                  comment:
                      'This is a sample comment. Lorem ipsum dolor sit amet.',
                  time: '2 hours ago',
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.zero, color: primaryLightBackground),
            padding: const EdgeInsets.only(top: 6, bottom: 6),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.only(left: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: primaryWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Comment as Blessing Mwale",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: primaryBlack.withOpacity(0.6),
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: myIcon(
                                path: "assets/icons/paper-clip.svg",
                                width: 25,
                                height: 25,
                                iconColor: primaryBlack.withOpacity(0.6)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: primaryPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Transform.rotate(
                    angle: pi / 2, // Rotate the icon 90 degrees clockwise
                    child: myIcon(
                      path: "assets/icons/paper-airplane.svg",
                      width: 25,
                      height: 25,
                      iconColor: primaryWhite,
                    ),
                  ),
                )
              ],
            ),
          )
          // Comment input section
          // Row(
          //   children: [
          //     Expanded(
          //       child: TextField(
          //         controller: _commentController,
          //         decoration: InputDecoration(
          //           hintText: 'Type your comment...',
          //         ),
          //       ),
          //     ),
          //     SizedBox(width: 8),
          //     InkWell(
          //       child: myIcon(path: path, width: 20, height: 20),
          //     )
          //     ElevatedButton(
          //       onPressed: () {
          //         // Handle send button press
          //         String comment = _commentController.text.trim();
          //         if (comment.isNotEmpty) {
          //           setState(() {
          //             _comments.add(comment);
          //             _commentController.clear();
          //           });
          //         }
          //       },
          //       child: Text('Send'),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
