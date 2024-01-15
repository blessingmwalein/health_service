import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/constants/urls.dart';
import 'package:health_service/models/service_model.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';
import 'package:health_service/ui/util/shared/service_slider.dart';

class ServiceCard extends StatefulWidget {
  final Service service;
  const ServiceCard({super.key, required this.service});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ServiceSingleRoute(service: widget.service));
      },
      child: Container(
          // height: 100,
          //add border

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.withOpacity(0.4),
              width: 1.0,
            ),
          ),
          // width: 240,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInImage(
                image: NetworkImage(
                  '${UrlStrings.imagesBase}${widget.service.icon}',
                ),
                placeholder: const AssetImage('assets/images/default.jpg'),
                width: double.infinity,
                // width: 100,
                height: 150,
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/default.jpg',
                    height: 40.0,
                    // width: 40.0,
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                child: Text(
                  widget.service.title ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: primaryBlack.withOpacity(0.8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                child: Row(
                  children: [
                    myIcon(
                        path: "assets/icons/location-marker.svg",
                        width: 15,
                        height: 15,
                        iconColor: primaryBlue),
                    const SizedBox(
                      width: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.service.address ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: primaryBlack.withOpacity(0.4),
                          ),
                        ),
                        //circle dot
                        Container(
                          width: 5,
                          height: 5,
                          margin: const EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                            color: primaryBlack.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Text(
                          widget.service.city ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: primaryBlack.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        myIcon(
                            path: "assets/icons/clock-outlined.svg",
                            width: 15,
                            height: 15,
                            iconColor: primaryBlue),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          widget.service.workingHours ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: primaryBlack.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     myIcon(
                    //         path: "assets/icons/location-marker.svg",
                    //         width: 15,
                    //         height: 15,
                    //         iconColor: primaryBlue),
                    //     const SizedBox(
                    //       width: 3,
                    //     ),
                    //     Row(
                    //       children: [
                    //         Text(
                    //           '15min',
                    //           style: TextStyle(
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.w600,
                    //             color: primaryBlack.withOpacity(0.4),
                    //           ),
                    //         ),
                    //         //circle dot
                    //         Container(
                    //           width: 5,
                    //           height: 5,
                    //           margin: const EdgeInsets.only(left: 5, right: 5),
                    //           decoration: BoxDecoration(
                    //             color: primaryBlack.withOpacity(0.4),
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //         ),
                    //         Text(
                    //           '5.8km',
                    //           style: TextStyle(
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.w600,
                    //             color: primaryBlack.withOpacity(0.4),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          )),
    );
  }
}
