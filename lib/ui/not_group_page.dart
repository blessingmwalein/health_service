import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/bloc/group_chats/group_chat_bloc.dart';
import 'package:health_service/bloc/service/service_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/models/user_group_chat_model.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/chat_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';
import 'package:health_service/ui/util/shared/heading_text.dart';
import 'package:health_service/ui/util/shared/service_card.dart';
import 'package:health_service/ui/util/shared/symptom_card.dart';
import 'package:health_service/ui/util/shared/toll_free_card.dart';

@RoutePage()
class NotGroupPage extends StatefulWidget {
  final GroupChat group;
  const NotGroupPage({super.key, required this.group});

  @override
  State<NotGroupPage> createState() => _NotGroupPageState();
}

class _NotGroupPageState extends State<NotGroupPage> {
  sendGroupJoinRequest() {
    BlocProvider.of<GroupChatBloc>(context)
        .add(JoinGroupChat(groupChatId: widget.group.id ?? 0));

    context.read<GroupChatBloc>().stream.listen((authState) {
      if (authState is JoinGroupSuccess) {
        context.router.push(const GroupChatRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChatPageLayout(
      title: '${widget.group.name}',
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: primaryBlue,
                    width: 1,
                  ),
                ),
                child: myIcon(
                    path: "assets/icons/user-group.svg", width: 40, height: 40),
              ),
              SizedBox(height: 10),
              Text(
                widget.group.name ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: primaryBlack.withOpacity(0.7),
                ),
              ),
              Text(
                "${widget.group.users?.length} members",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: primaryBlack.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 10),
              widget.group.users!.isNotEmpty
                  ? AvatarStack(
                      height: 40,
                      width: 140,
                      avatars: [
                        for (var i in widget.group.users ?? [])
                          AssetImage('assets/images/user.png'),
                      ],
                    )
                  : Container(),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: outlinedButton(
                  context,
                  text: "Join Group",
                  height: 60,
                  isOulined: false,
                  isLoading: false,
                  color: primaryOrange,
                  onPressed: () {
                    // Show confirmation dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content:
                              Text('Are you sure you want to join this group?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Perform the action when the user confirms
                                // For example, you can call your API function here
                                sendGroupJoinRequest();
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text('Join'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
