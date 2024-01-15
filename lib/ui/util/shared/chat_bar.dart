import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/bloc/group_chats/group_chat_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryWhite,
      elevation: 0,
      actions: [
        // InkWell(
        //     onTap: () {
        //       //pop page

        //       context.router.back();
        //     },
        //     child: iconButton(context,
        //         icon: "assets/icons/phone-outgoing.svg",
        //         color: primaryBlack.withOpacity(0.7))),
        const SizedBox(width: 10),
      ],
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: primaryBlack.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Online",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: primaryBlack.withOpacity(0.6),
              fontSize: 16,
            ),
          ),
        ],
      ),
      leading: InkWell(
          onTap: () {
            print('clicked this');
            // BlocProvider.of<GroupChatBloc>(context).add(const GetGroupChats());
            context.router.back();
          },
          child: Container(
            padding: const EdgeInsets.all(3),
            child: iconButton(context,
                icon: "assets/icons/chevron-left.svg",
                color: primaryBlack.withOpacity(0.7)),
          )),
      // leading: Container(
    );
  }
}
