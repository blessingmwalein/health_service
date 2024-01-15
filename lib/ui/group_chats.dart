import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/bloc/auth/authentication_bloc.dart';
import 'package:health_service/bloc/group_chats/group_chat_bloc.dart';
import 'package:health_service/bloc/service/service_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';
import 'package:health_service/ui/util/shared/chat_list_card.dart';
import 'package:health_service/ui/util/shared/group_chat_card.dart';
import 'package:health_service/ui/util/shared/heading_text.dart';
import 'package:health_service/ui/util/shared/service_card.dart';
import 'package:health_service/ui/util/shared/symptom_card.dart';
import 'package:health_service/ui/util/shared/toll_free_card.dart';

@RoutePage()
class GroupChatPage extends StatefulWidget {
  const GroupChatPage({super.key});

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  @override
  void initState() {
    BlocProvider.of<GroupChatBloc>(context).add(const GetGroupChats());

    BlocProvider.of<AuthenticationBloc>(context).add(AuthUserCache());

    // BlocProvider.of<InvoiceBloc>(context)
    //     .add(GetInvoicesByLoadSheetId(loadSheetId: state.loadSheet.id ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      title: 'Chat',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<AuthenticationBloc, AuthenticationBlocState>(
              builder: (context, authState) {
            if (authState is AuthUserCacheFound) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingText("New Groups", (){}),
                  const SizedBox(height: 10),
                  BlocBuilder<GroupChatBloc, GroupChatBlocState>(
                      builder: (context, state) {
                    if (state is GroupChatSuccess) {
                      return state.notGroupChats.isNotEmpty
                          ? SizedBox(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.notGroupChats.length,
                                itemBuilder: (context, index) {
                                  final group = state.notGroupChats[index];
                                  return InkWell(
                                    onTap: () {
                                      context.router
                                          .push(NotGroupRoute(group: group));
                                    },
                                    child: GroupChatCard(group: group),
                                  );
                                },
                              ),
                            )
                          : Container(
                              height: 100,
                              child: Center(
                                child: Text(
                                  "No new groups",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: primaryBlack.withOpacity(0.7)),
                                ),
                              ),
                            );
                    } else if (state is GroupChatLoading) {
                      return const CircularProgressIndicator();
                    } else {
                      return const SizedBox();
                    }
                  }),
                  const SizedBox(height: 20),
                  Text(
                    "Group Chats",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: primaryBlack.withOpacity(0.7)),
                  ),
                  BlocBuilder<GroupChatBloc, GroupChatBlocState>(
                      builder: (context, state) {
                    if (state is GroupChatSuccess) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.groupChats.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // Assuming each symptom has a `name` and an `imagePath`
                          final group = state.groupChats[index];
                          return InkWell(
                            onTap: () {
                              context.router.push(SingleChatRoute(
                                  group: group,
                                  userGroupChats: state.groupChats,
                                  userNotGroupChats: state.notGroupChats));
                            },
                            child: ChatListCard(
                              group: group,
                            ),
                          );
                        },
                      );
                    } else if (state is GroupChatLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  }),
                ],
              );
            } else if (authState is AuthUserCacheNotFound) {
              return Center(
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
                          path: "assets/icons/user-group.svg",
                          width: 40,
                          height: 40),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You are logged in As Guest',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: primaryBlack.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: outlinedButton(
                        context,
                        text: "Sign In",
                        height: 60,
                        isOulined: false,
                        isLoading: false,
                        color: primaryOrange,
                        onPressed: () {
                          // Show confirmation dialog
                          context.router.push(const SignInRoute());
                        },
                      ),
                    )
                  ],
                ),
              );
            } else if (authState is AuthenticationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('Something went wrong'));
            }
          }),
        ),
      ),
    );
  }
}
