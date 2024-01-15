import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/models/service_model.dart';
import 'package:health_service/ui/tabs/about_tab.dart';
import 'package:health_service/ui/tabs/services_tab.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';
import 'package:health_service/ui/util/shared/service_slider.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ServiceSinglePage extends StatefulWidget {
  final Service service;
  const ServiceSinglePage({super.key, required this.service});

  @override
  State<ServiceSinglePage> createState() => _ServiceSinglePageState();
}

class _ServiceSinglePageState extends State<ServiceSinglePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _hasCallSupport = false;
  Future<void>? _launched;

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  //send text message
  Future<void> _sendSms(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      title: "Services",
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceSlider(
                imageHeight: 160.0,
                image: widget.service.icon,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.service.title ?? '',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: primaryBlack.withOpacity(0.7),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Open Hours',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: primaryBlue,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      myIcon(
                          path: "assets/icons/clock-outlined.svg",
                          width: 18,
                          height: 18,
                          iconColor: primaryBlue),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.service.workingHours ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryBlack.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         myIcon(
                  //             path: "assets/icons/star.svg",
                  //             width: 18,
                  //             height: 18,
                  //             iconColor: primaryBlue),
                  //         const SizedBox(
                  //           width: 5,
                  //         ),
                  //         const Text(
                  //           '4.8',
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w600,
                  //             color: primaryBlue,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     Row(
                  //       children: [
                  //         myIcon(
                  //             path: "assets/icons/location-marker.svg",
                  //             width: 18,
                  //             height: 18,
                  //             iconColor: primaryBlue),
                  //         const SizedBox(
                  //           width: 5,
                  //         ),
                  //         Text(
                  //           '5.8km',
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w600,
                  //             color: primaryBlack.withOpacity(0.4),
                  //           ),
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      iconButton(context,
                          icon: "assets/icons/location-marker.svg"),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: primaryBlack.withOpacity(0.5),
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "${widget.service.address}, ${widget.service.city}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: primaryBlack.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "${widget.service.email}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: primaryBlack.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //grey line
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.grey.withOpacity(0.4),
              ),
              DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      indicatorColor: primaryBlue,
                      labelColor: primaryBlack.withOpacity(0.7),
                      unselectedLabelColor: primaryBlack.withOpacity(0.4),
                      // isScrollable: true,
                      tabs: const [
                        Tab(text: 'About Us'),
                        Tab(text: 'Services'),
                        // Tab(text: 'Reviews'),
                      ],
                    ),
                    SizedBox(
                      height: 500, // Adjust the height as needed
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // About Us Tab
                          AboutTab(
                            service: widget.service,
                          ),

                          // Services Tab
                          ServicesTab(services: widget.service.services ?? []),

                          // Reviews Tab
                          // Center(child: Text('Reviews Content')),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
