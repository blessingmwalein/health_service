import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/heading_text.dart';
import 'package:health_service/ui/util/shared/service_card.dart';
import 'package:health_service/ui/util/shared/symptom_card.dart';
import 'package:health_service/ui/util/shared/toll_free_card.dart';

@RoutePage()
class SympTomSearchPage extends StatefulWidget {
  const SympTomSearchPage({super.key});

  @override
  State<SympTomSearchPage> createState() => _SympTomSearchPageState();
}

class _SympTomSearchPageState extends State<SympTomSearchPage> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
        title: 'Help',
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      // width: 200, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the radius for rounded corners
                        border: Border.all(
                          color: Colors.grey
                              .withOpacity(0.4), // Set the border color
                          width: 1.0, // Set the border width
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: myIcon(
                                path: "assets/icons/search.svg",
                                width: 30,
                                height: 30),
                          ),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Filter Health Services',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: primaryBlue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: primaryBlue,
                        width: 2,
                      ),
                    ),
                    child: myIcon(
                        path: "assets/icons/search.svg",
                        width: 30,
                        height: 30,
                        iconColor: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 10),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  
                ],
              )
            ],
          ),
        )));
  }
}
