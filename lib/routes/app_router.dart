import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_service/models/service_model.dart';
import 'package:health_service/models/tollfree_model.dart';
import 'package:health_service/models/topic_model.dart';
import 'package:health_service/models/user_group_chat_model.dart';
import 'package:health_service/ui/group_chats.dart';
import 'package:health_service/ui/home_page.dart';
import 'package:health_service/ui/infor_page.dart';
import 'package:health_service/ui/not_group_page.dart';
import 'package:health_service/ui/profile_page.dart';
import 'package:health_service/ui/service_single_page.dart';
import 'package:health_service/ui/services_page.dart';
import 'package:health_service/ui/signin_page.dart';
import 'package:health_service/ui/signup_page.dart';
import 'package:health_service/ui/single_group_chat.dart';
import 'package:health_service/ui/sti_single_page.dart';
import 'package:health_service/ui/symptom_search.dart';
import 'package:health_service/ui/toll_free_page.dart';
import 'package:health_service/ui/toll_free_single.dart';
import 'package:health_service/ui/topic_single_page.dart';
import 'package:health_service/ui/topics_page.dart';
import 'package:health_service/ui/welcome_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ServiceRoute.page),
        AutoRoute(page: TollFreeRoute.page),
        AutoRoute(page: ServiceSingleRoute.page),
        AutoRoute(page: TollFreeSingleRoute.page),
        AutoRoute(page: SympTomSearchRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: GroupChatRoute.page),
        AutoRoute(page: NotGroupRoute.page),
        AutoRoute(page: SingleChatRoute.page),
        AutoRoute(page: TopicSingleRoute.page),
        AutoRoute(page: StiSingleRoute.page),
        AutoRoute(page: TopicsRoute.page),
        AutoRoute(page: InforRoute.page),
      ];
}
