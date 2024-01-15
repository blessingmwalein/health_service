import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_service/app_blocs.dart';
import 'package:health_service/app_repository.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/routes/app_router.dart';

void main() async {
  final appRouter = AppRouter();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      color: primaryAppBackGround,
      home: AppRepositories(
          storage: storage,
          appBlocs: AppBlocs(
            storage: storage,
            app: MyApp(appRouter: appRouter),
          )),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Health',
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Jost',
          canvasColor: primaryAppBackGround),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
