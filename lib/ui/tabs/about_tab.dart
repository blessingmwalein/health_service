import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/models/service_model.dart';
import 'package:health_service/ui/doctor_card.dart';

class AboutTab extends StatefulWidget {
  final Service service;
  const AboutTab({super.key, required this.service});

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(widget.service.description ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: primaryBlack.withOpacity(0.5),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Working Hours',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: primaryBlack.withOpacity(0.7),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          widget.service.workingHours ?? '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: primaryBlack.withOpacity(0.5),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        // const SizedBox(
        //   height: 15,
        // ),
        // Text(
        //   'Doctors',
        //   style: TextStyle(
        //     fontSize: 18,
        //     fontWeight: FontWeight.w600,
        //     color: primaryBlack.withOpacity(0.7),
        //   ),
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        // Row(
        //   children: [
        //     DoctorCard(
        //         imagePath: "assets/images/b.jpg",
        //         name: "Blessing Mwale",
        //         title: "Doctor"),
        //   ],
        // )
      ],
    );
  }
}
