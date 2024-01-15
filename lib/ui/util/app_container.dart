import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/ui/util/shared/app_bar.dart';
import 'package:health_service/ui/util/shared/bottom_bar.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final String title;
  const AppContainer({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const PreferredSize(
        preferredSize: Size.fromHeight(
            kToolbarHeight), // You can adjust the height if needed
        child: CustomAppBar(),
      ),
      
      body: child,
      backgroundColor: primaryAppBackGround,
      
      bottomNavigationBar:  CustomBottomAppBar(
        pageName: title,
      ),
    );
  }
}
