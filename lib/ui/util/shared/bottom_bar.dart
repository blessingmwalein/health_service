import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/icon.dart';

// ignore: use_key_in_widget_constructors
class CustomBottomAppBar extends StatelessWidget {
  //add selected page name
  final String? pageName;
  const CustomBottomAppBar({super.key, this.pageName});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 1,
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.all(0),

        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    color: Colors.grey.withOpacity(0.3), width: 0.4))),
        // color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 10,
                  width: 30,
                  //add border radius top left and right
                  decoration: BoxDecoration(
                    color: pageName == 'Home' ? primaryBlue : Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                          10.0), // Set your desired border radius
                      bottomRight: Radius.circular(
                          10.0), // Set your desired border radius
                    ),
                  ),
                  //add top border for selected icon
                  child: Container(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  //add top border for selected icon
                  child: InkWell(
                    child: Column(
                      children: [
                        myIcon(
                            path: 'assets/icons/view-grid.svg',
                            width: 30,
                            height: 30,
                            iconColor: primaryBlue),
                        Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: pageName == 'Home'
                                  ? primaryBlue
                                  : Colors.grey),
                        )
                      ],
                    ),
                    onTap: () {
                      context.router.push(const HomeRoute());
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 10,
                  width: 30,
                  //add border radius top left and right
                  decoration: BoxDecoration(
                    color: pageName == 'Services' ? primaryBlue : Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                          10.0), // Set your desired border radius
                      bottomRight: Radius.circular(
                          10.0), // Set your desired border radius
                    ),
                  ),
                  //add top border for selected icon
                  child: Container(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  //add top border for selected icon
                  child: InkWell(
                    child: Column(
                      children: [
                        myIcon(
                            path: 'assets/icons/office-building.svg',
                            width: 30,
                            height: 30,
                            iconColor: primaryBlue),
                        Text(
                          'Services',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: pageName == 'Services'
                                  ? primaryBlue
                                  : Colors.grey),
                        )
                      ],
                    ),
                    onTap: () {
                      context.router.push(const ServiceRoute());
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 10,
                  width: 30,
                  //add border radius top left and right
                  decoration: BoxDecoration(
                    color: pageName == 'Help' ? primaryBlue : Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                          10.0), // Set your desired border radius
                      bottomRight: Radius.circular(
                          10.0), // Set your desired border radius
                    ),
                  ),
                  //add top border for selected icon
                  child: Container(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  //add top border for selected icon
                  child: InkWell(
                    child: Column(
                      children: [
                        myIcon(
                            path: 'assets/icons/question-mark-circle.svg',
                            width: 30,
                            height: 30,
                            iconColor: primaryBlue),
                        Text(
                          'Ask AI',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: pageName == 'Help'
                                  ? primaryBlue
                                  : Colors.grey),
                        )
                      ],
                    ),
                    onTap: () {
                      context.router.push(const SympTomSearchRoute());
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 10,
                  width: 30,
                  //add border radius top left and right
                  decoration: BoxDecoration(
                    color: pageName == 'Chat' ? primaryBlue : Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                          10.0), // Set your desired border radius
                      bottomRight: Radius.circular(
                          10.0), // Set your desired border radius
                    ),
                  ),
                  //add top border for selected icon
                  child: Container(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  //add top border for selected icon
                  child: InkWell(
                    child: Column(
                      children: [
                        myIcon(
                            path: 'assets/icons/user-group.svg',
                            width: 30,
                            height: 30,
                            iconColor: primaryBlue),
                        Text(
                          'Group Chat',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: pageName == 'Help'
                                  ? primaryBlue
                                  : Colors.grey),
                        )
                      ],
                    ),
                    onTap: () {
                      context.router.push(const GroupChatRoute());
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 10,
                  width: 30,
                  //add border radius top left and right
                  decoration: BoxDecoration(
                    color: pageName == 'Tollfree' ? primaryBlue : Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                          10.0), // Set your desired border radius
                      bottomRight: Radius.circular(
                          10.0), // Set your desired border radius
                    ),
                  ),
                  //add top border for selected icon
                  child: Container(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  //add top border for selected icon
                  child: InkWell(
                    child: Column(
                      children: [
                        myIcon(
                            path: 'assets/icons/phone-outgoing.svg',
                            width: 30,
                            height: 30,
                            iconColor: primaryBlue),
                        Text(
                          'Tollfree',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: pageName == 'Tollfree'
                                  ? primaryBlue
                                  : Colors.grey),
                        )
                      ],
                    ),
                    onTap: () {
                      context.router.push(const TollFreeRoute());
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 10,
                  width: 30,
                  //add border radius top left and right
                  decoration: BoxDecoration(
                    color: pageName == 'Profile' ? primaryBlue : Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                          10.0), // Set your desired border radius
                      bottomRight: Radius.circular(
                          10.0), // Set your desired border radius
                    ),
                  ),
                  //add top border for selected icon
                  child: Container(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  //add top border for selected icon
                  child: InkWell(
                    child: Column(
                      children: [
                        myIcon(
                            path: 'assets/icons/user-circle.svg',
                            width: 30,
                            height: 30,
                            iconColor: primaryBlue),
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: pageName == 'Profile'
                                  ? primaryBlue
                                  : Colors.grey),
                        )
                      ],
                    ),
                    onTap: () {
                      context.router.push(const ProfileRoute());
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // Customize the bottom app bar as needed (e.g., add a notch, floating action button, etc.).
    );
  }
}
