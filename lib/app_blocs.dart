import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_service/bloc/auth/authentication_bloc.dart';
import 'package:health_service/bloc/exception_bloc/exception_bloc.dart';
import 'package:health_service/bloc/group_chats/group_chat_bloc.dart';
import 'package:health_service/bloc/health/health_bloc.dart';
import 'package:health_service/bloc/info/info_bloc.dart';
import 'package:health_service/bloc/service/service_bloc.dart';
import 'package:health_service/bloc/tollfree/tollfree_bloc.dart';
import 'package:health_service/bloc/topic/topic_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/repository/auth/authentication_repository.dart';
import 'package:health_service/repository/group_chats/group_chat_repository.dart';
import 'package:health_service/repository/health/health_repository.dart';
import 'package:health_service/repository/info/info_repository.dart';
import 'package:health_service/repository/service/service_repository.dart';
import 'package:health_service/repository/tollfree/toolfree_repository.dart';
import 'package:health_service/repository/topic/topic_repository.dart';
import 'package:health_service/ui/util/shared/snack_bar_widget.dart';

class AppBlocs extends StatelessWidget {
  final Widget app;
  final FlutterSecureStorage storage;

  const AppBlocs({Key? key, required this.app, required this.storage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ExceptionBloc()),
        BlocProvider(
            create: (context) => HealthBloc(
                healthRepository:
                    RepositoryProvider.of<HealthRepository>(context))),
        BlocProvider(
            create: (context) => AuthenticationBloc(
                exceptionBloc: BlocProvider.of<ExceptionBloc>(context),
                storage: storage,
                authenticationRepository:
                    RepositoryProvider.of<AuthenticationRepository>(context))
              ..add(AuthUserCache())),
        BlocProvider(
            create: (context) => TopicBloc(
                exceptionBloc: BlocProvider.of<ExceptionBloc>(context),
                storage: storage,
                topicRepository:
                    RepositoryProvider.of<TopicRepository>(context))
              ..add(const GetTopics())),
        BlocProvider(
            create: (context) => InfoBloc(
                exceptionBloc: BlocProvider.of<ExceptionBloc>(context),
                storage: storage,
                infoRepository: RepositoryProvider.of<InfoRepository>(context))
              ..add(const GetInfos())),
        BlocProvider(
            create: (context) => ServiceBloc(
                exceptionBloc: BlocProvider.of<ExceptionBloc>(context),
                storage: storage,
                serviceRepository:
                    RepositoryProvider.of<ServiceRepository>(context))
              ..add(const GetServices())),
        BlocProvider(
            create: (context) => TollFreeBloc(
                exceptionBloc: BlocProvider.of<ExceptionBloc>(context),
                storage: storage,
                tollFreeRepository:
                    RepositoryProvider.of<TollFreeRepository>(context))
              ..add(const GetTollFrees())),
        BlocProvider(
            create: (context) => GroupChatBloc(
                exceptionBloc: BlocProvider.of<ExceptionBloc>(context),
                storage: storage,
                groupChatRepository:
                    RepositoryProvider.of<GroupChatRepository>(context))
              ..add(const GetGroupChats())),
      ],
      child: Scaffold(
        body: MultiBlocListener(
          listeners: [
            BlocListener<ExceptionBloc, ExceptionState>(
              listener: (context, state) {
                if (state is ErrorExceptionState) {
                  print('ErrorExceptionState ${state.message}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    snackBar(context,
                        message: state.message
                            .replaceAll('Exception', '')
                            .replaceAll(':', ''),
                        backgroundColor: Colors.red[600],
                        textColor: primaryWhite,
                        icon: "assets/icons/exclamation-circle.svg"),
                  );
                }
                if (state is SuccessExceptionState) {
                  print('SuccessExceptionState ${state.message}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    snackBar(context,
                        message: state.message,
                        backgroundColor: const Color(0xFF8B735B),
                        textColor: primaryYellow,
                        icon: "assets/icons/check-circle.svg"),
                  );
                }
              },
            ),
            
          ],
          child: app,
        ),
      ),
    );
  }
}
