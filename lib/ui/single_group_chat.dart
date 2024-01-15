import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/bloc/group_chats/group_chat_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/models/group_chat_message_model.dart';
import 'package:health_service/models/user_group_chat_model.dart';
import 'package:health_service/ui/util/chat_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/message_card_left.dart';
import 'package:health_service/ui/util/shared/message_card_right.dart';
import 'package:health_service/ui/util/shared/strike_through_text.dart';

@RoutePage()
class SingleChatPage extends StatefulWidget {
  GroupChat group;
  List<GroupChat> userGroupChats;
  List<GroupChat> userNotGroupChats;
  SingleChatPage(
      {super.key,
      required this.group,
      required this.userGroupChats,
      required this.userNotGroupChats});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final messageController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<GroupChatBloc>(context).add(GetGroupChatMessages(
        groupChatId: widget.group.id ?? 0,
        userGroupChats: widget.userGroupChats,
        userNotGroupChats: widget.userNotGroupChats));

    // BlocProvider.of<InvoiceBloc>(context)
    //     .add(GetInvoicesByLoadSheetId(loadSheetId: state.loadSheet.id ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return ChatPageLayout(
      title: widget.group.name ?? "Group Name",
      bottom: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.zero, color: primaryLightBackground),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
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
                            hintText: "Type a message",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: primaryBlack.withOpacity(0.6),
                              fontSize: 16,
                            ),
                            border: InputBorder.none,
                          ),
                          controller: messageController,
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
            InkWell(
              onTap: () {
                BlocProvider.of<GroupChatBloc>(context)
                    .add(SendGroupChatMessage(
                  groupChatId: widget.group.id ?? 0,
                  message: messageController.text,
                  userGroupChats: widget.userGroupChats,
                  userNotGroupChats: widget.userNotGroupChats
                ));
                messageController.clear();
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Transform.rotate(
                  angle: pi / 2, // Rotate the icon 90 degrees clockwise
                  child: myIcon(
                    path: "assets/icons/paper-airplane.svg",
                    width: 25,
                    height: 25,
                    iconColor: primaryBlack.withOpacity(0.6),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: BlocBuilder<GroupChatBloc, GroupChatBlocState>(
            builder: (context, state) {
          if (state is GroupChatSuccess) {
            return state.groupChatMessages?.isNotEmpty == true
                ? Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.groupChatMessages?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final message = state.groupChatMessages?[index];

                        print(message?.isMe);
                        return message?.isMe == true
                            ? messageCardRight(
                                context,
                                message: message ?? GroupChatMessage(),
                              )
                            : messageCardLeft(
                                context,
                                message: message ?? GroupChatMessage(),
                              );
                      },
                    ),
                  )
                : Center(
                    child: Text(
                      "No messages yet",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: primaryBlack.withOpacity(0.4),
                      ),
                    ),
                  );
          } else if (state is GroupChatLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        }),
      ),
    );
  }
}
