import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/constants/urls.dart';
import 'package:health_service/models/tollfree_model.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/action_button.dart';
import 'package:url_launcher/url_launcher.dart';

class TollFreeCard extends StatefulWidget {
  final TollFree tollFree;
  const TollFreeCard({super.key, required this.tollFree});

  @override
  State<TollFreeCard> createState() => _TollFreeCardState();
}

class _TollFreeCardState extends State<TollFreeCard> {
  bool _hasCallSupport = false;

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
    return InkWell(
      onTap: () {
        context.router
            .push(TollFreeSingleRoute(tollFree: widget.tollFree));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: primaryGreyLight,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
            width: 1.0,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: primaryGreyLight,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: primaryGreyLight,
                      width: 1.0,
                    ),
                  ),
                  child: FadeInImage(
                    image: NetworkImage(
                      '${UrlStrings.imagesBase}${widget.tollFree.icon ?? ''}',
                    ),
                    placeholder: const AssetImage('assets/images/default.jpg'),
                    width: double.infinity,
                    // width: 100,
                    // height: 100,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/default.jpg',
                        height: 40.0,
                        // width: 40.0,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: primaryLightBlue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              widget.tollFree.isVerified == 1
                                  ? myIcon(
                                      path: "assets/icons/verified.svg",
                                      width: 15,
                                      height: 15,
                                      iconColor: primaryBlue)
                                  : myIcon(
                                      path: "assets/icons/unverified.svg",
                                      width: 15,
                                      height: 15,
                                      iconColor: primaryBlue),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                widget.tollFree.isVerified == 1
                                    ? 'Verified Toll Free'
                                    : 'Unverified Toll Free',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: primaryBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        myIcon(
                            path: "assets/icons/heart.svg",
                            width: 35,
                            height: 35,
                            iconColor: primaryBlue)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.tollFree.title ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: primaryBlack.withOpacity(0.7),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.tollFree.phoneNumber ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: primaryBlack.withOpacity(0.5),
                        ),
                      ),
                    ),

                    //ratings stars and reviews count
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              myIcon(
                                  path: "assets/icons/star.svg",
                                  width: 15,
                                  height: 15,
                                  iconColor: Colors.orange),
                              myIcon(
                                  path: "assets/icons/star.svg",
                                  width: 15,
                                  height: 15,
                                  iconColor: Colors.orange),
                              myIcon(
                                  path: "assets/icons/star.svg",
                                  width: 15,
                                  height: 15,
                                  iconColor: Colors.orange),
                              myIcon(
                                  path: "assets/icons/star.svg",
                                  width: 15,
                                  height: 15,
                                  iconColor: Colors.orange),
                            ],
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text(
                            '4.8',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: primaryBlack,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(1.2k)',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: primaryBlack.withOpacity(0.4),
                            ),
                          ),
                          //vertical divider
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 15,
                            width: 1,
                            color: primaryBlack.withOpacity(0.4),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '49 Reviews',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: primaryBlack.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    _makePhoneCall(widget.tollFree.phoneNumber ?? '');
                  },
                  child:
                      actionButton('Call', 'assets/icons/phone-outgoing.svg'),
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: InkWell(
                        onTap: () {
                          _sendSms(widget.tollFree.phoneNumber ?? '');
                        },
                        child:
                            actionButton('Message', 'assets/icons/chat.svg')))
              ],
            )
          ],
        ),
      ),
    );
  }
}
