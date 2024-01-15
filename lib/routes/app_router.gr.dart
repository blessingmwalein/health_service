// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    GroupChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GroupChatPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    InforRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InforPage(),
      );
    },
    NotGroupRoute.name: (routeData) {
      final args = routeData.argsAs<NotGroupRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotGroupPage(
          key: args.key,
          group: args.group,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    ServiceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServicePage(),
      );
    },
    ServiceSingleRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceSingleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ServiceSinglePage(
          key: args.key,
          service: args.service,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    SingleChatRoute.name: (routeData) {
      final args = routeData.argsAs<SingleChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SingleChatPage(
          key: args.key,
          group: args.group,
          userGroupChats: args.userGroupChats,
          userNotGroupChats: args.userNotGroupChats,
        ),
      );
    },
    StiSingleRoute.name: (routeData) {
      final args = routeData.argsAs<StiSingleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StiSinglePage(
          key: args.key,
          sti: args.sti,
        ),
      );
    },
    SympTomSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SympTomSearchPage(),
      );
    },
    TollFreeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TollFreePage(),
      );
    },
    TollFreeSingleRoute.name: (routeData) {
      final args = routeData.argsAs<TollFreeSingleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TollFreeSinglePage(
          key: args.key,
          tollFree: args.tollFree,
        ),
      );
    },
    TopicSingleRoute.name: (routeData) {
      final args = routeData.argsAs<TopicSingleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TopicSinglePage(
          key: args.key,
          topic: args.topic,
        ),
      );
    },
    TopicsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TopicsPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [GroupChatPage]
class GroupChatRoute extends PageRouteInfo<void> {
  const GroupChatRoute({List<PageRouteInfo>? children})
      : super(
          GroupChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'GroupChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InforPage]
class InforRoute extends PageRouteInfo<void> {
  const InforRoute({List<PageRouteInfo>? children})
      : super(
          InforRoute.name,
          initialChildren: children,
        );

  static const String name = 'InforRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotGroupPage]
class NotGroupRoute extends PageRouteInfo<NotGroupRouteArgs> {
  NotGroupRoute({
    Key? key,
    required GroupChat group,
    List<PageRouteInfo>? children,
  }) : super(
          NotGroupRoute.name,
          args: NotGroupRouteArgs(
            key: key,
            group: group,
          ),
          initialChildren: children,
        );

  static const String name = 'NotGroupRoute';

  static const PageInfo<NotGroupRouteArgs> page =
      PageInfo<NotGroupRouteArgs>(name);
}

class NotGroupRouteArgs {
  const NotGroupRouteArgs({
    this.key,
    required this.group,
  });

  final Key? key;

  final GroupChat group;

  @override
  String toString() {
    return 'NotGroupRouteArgs{key: $key, group: $group}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServicePage]
class ServiceRoute extends PageRouteInfo<void> {
  const ServiceRoute({List<PageRouteInfo>? children})
      : super(
          ServiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServiceSinglePage]
class ServiceSingleRoute extends PageRouteInfo<ServiceSingleRouteArgs> {
  ServiceSingleRoute({
    Key? key,
    required Service service,
    List<PageRouteInfo>? children,
  }) : super(
          ServiceSingleRoute.name,
          args: ServiceSingleRouteArgs(
            key: key,
            service: service,
          ),
          initialChildren: children,
        );

  static const String name = 'ServiceSingleRoute';

  static const PageInfo<ServiceSingleRouteArgs> page =
      PageInfo<ServiceSingleRouteArgs>(name);
}

class ServiceSingleRouteArgs {
  const ServiceSingleRouteArgs({
    this.key,
    required this.service,
  });

  final Key? key;

  final Service service;

  @override
  String toString() {
    return 'ServiceSingleRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SingleChatPage]
class SingleChatRoute extends PageRouteInfo<SingleChatRouteArgs> {
  SingleChatRoute({
    Key? key,
    required GroupChat group,
    required List<GroupChat> userGroupChats,
    required List<GroupChat> userNotGroupChats,
    List<PageRouteInfo>? children,
  }) : super(
          SingleChatRoute.name,
          args: SingleChatRouteArgs(
            key: key,
            group: group,
            userGroupChats: userGroupChats,
            userNotGroupChats: userNotGroupChats,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleChatRoute';

  static const PageInfo<SingleChatRouteArgs> page =
      PageInfo<SingleChatRouteArgs>(name);
}

class SingleChatRouteArgs {
  const SingleChatRouteArgs({
    this.key,
    required this.group,
    required this.userGroupChats,
    required this.userNotGroupChats,
  });

  final Key? key;

  final GroupChat group;

  final List<GroupChat> userGroupChats;

  final List<GroupChat> userNotGroupChats;

  @override
  String toString() {
    return 'SingleChatRouteArgs{key: $key, group: $group, userGroupChats: $userGroupChats, userNotGroupChats: $userNotGroupChats}';
  }
}

/// generated route for
/// [StiSinglePage]
class StiSingleRoute extends PageRouteInfo<StiSingleRouteArgs> {
  StiSingleRoute({
    Key? key,
    required Sti sti,
    List<PageRouteInfo>? children,
  }) : super(
          StiSingleRoute.name,
          args: StiSingleRouteArgs(
            key: key,
            sti: sti,
          ),
          initialChildren: children,
        );

  static const String name = 'StiSingleRoute';

  static const PageInfo<StiSingleRouteArgs> page =
      PageInfo<StiSingleRouteArgs>(name);
}

class StiSingleRouteArgs {
  const StiSingleRouteArgs({
    this.key,
    required this.sti,
  });

  final Key? key;

  final Sti sti;

  @override
  String toString() {
    return 'StiSingleRouteArgs{key: $key, sti: $sti}';
  }
}

/// generated route for
/// [SympTomSearchPage]
class SympTomSearchRoute extends PageRouteInfo<void> {
  const SympTomSearchRoute({List<PageRouteInfo>? children})
      : super(
          SympTomSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SympTomSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TollFreePage]
class TollFreeRoute extends PageRouteInfo<void> {
  const TollFreeRoute({List<PageRouteInfo>? children})
      : super(
          TollFreeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TollFreeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TollFreeSinglePage]
class TollFreeSingleRoute extends PageRouteInfo<TollFreeSingleRouteArgs> {
  TollFreeSingleRoute({
    Key? key,
    required TollFree tollFree,
    List<PageRouteInfo>? children,
  }) : super(
          TollFreeSingleRoute.name,
          args: TollFreeSingleRouteArgs(
            key: key,
            tollFree: tollFree,
          ),
          initialChildren: children,
        );

  static const String name = 'TollFreeSingleRoute';

  static const PageInfo<TollFreeSingleRouteArgs> page =
      PageInfo<TollFreeSingleRouteArgs>(name);
}

class TollFreeSingleRouteArgs {
  const TollFreeSingleRouteArgs({
    this.key,
    required this.tollFree,
  });

  final Key? key;

  final TollFree tollFree;

  @override
  String toString() {
    return 'TollFreeSingleRouteArgs{key: $key, tollFree: $tollFree}';
  }
}

/// generated route for
/// [TopicSinglePage]
class TopicSingleRoute extends PageRouteInfo<TopicSingleRouteArgs> {
  TopicSingleRoute({
    Key? key,
    required Topic topic,
    List<PageRouteInfo>? children,
  }) : super(
          TopicSingleRoute.name,
          args: TopicSingleRouteArgs(
            key: key,
            topic: topic,
          ),
          initialChildren: children,
        );

  static const String name = 'TopicSingleRoute';

  static const PageInfo<TopicSingleRouteArgs> page =
      PageInfo<TopicSingleRouteArgs>(name);
}

class TopicSingleRouteArgs {
  const TopicSingleRouteArgs({
    this.key,
    required this.topic,
  });

  final Key? key;

  final Topic topic;

  @override
  String toString() {
    return 'TopicSingleRouteArgs{key: $key, topic: $topic}';
  }
}

/// generated route for
/// [TopicsPage]
class TopicsRoute extends PageRouteInfo<void> {
  const TopicsRoute({List<PageRouteInfo>? children})
      : super(
          TopicsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopicsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
