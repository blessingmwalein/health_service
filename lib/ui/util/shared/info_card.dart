import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/constants/urls.dart';
import 'package:health_service/helper/helper_methods.dart';
import 'package:health_service/models/info_model.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/action_button.dart';
import 'package:health_service/ui/util/shared/comments_sheet.dart';

class InforCard extends StatefulWidget {
  final Info info;

  const InforCard({Key? key, required this.info}) : super(key: key);

  @override
  State<InforCard> createState() => _InforCardState();
}

class _InforCardState extends State<InforCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top section with user avatar, name, and time
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.info.title ?? '', // Replace with user's name
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Helper.formatPostDate(widget.info.createdAt ??
                        DateTime.now()), // Replace with post time
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {
                  // Handle info button press
                },
              ),
            ],
          ),
          SizedBox(height: 8),
          // Post description
          Text(
            widget.info.description ??
                '', // Replace with actual post description
          ),
          SizedBox(height: 8),
          // Image (if available)
          // FadeInImage(
          //   image: NetworkImage(
          //     '${UrlStrings.imagesBase}${widget.info.icon}',
          //   ),
          //   placeholder: const AssetImage('assets/images/default.jpg'),
          //   // width: 40,
          //   height: 100,
          //   fit: BoxFit.cover,
          //   imageErrorBuilder: (context, error, stackTrace) {
          //     return Image.asset(
          //       'assets/images/default.jpg',
          //       height: 40.0,
          //       width: 40.0,
          //     );
          //   },
          // ),

          SizedBox(height: 8),
          // Bottom section with likes, comments, and action buttons
          Row(
            children: [
              const Text(
                '10 Likes', // Replace with actual number of likes
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 16),
              const Text(
                '5 Comments', // Replace with actual number of comments
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  ActionButton(
                    icon: 'assets/icons/thumb-up.svg',
                    label: 'Like',
                    onPressed: () {
                      // Handle like button press
                    },
                  ),
                  const SizedBox(width: 16),
                  ActionButton(
                    icon: 'assets/icons/chat.svg',
                    label: 'Comment',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => CommentBottomSheet(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onPressed;

  const ActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          myIcon(path: icon, width: 20, height: 20),
          SizedBox(width: 4),
          Text(label),
        ],
      ),
    );
  }
}
