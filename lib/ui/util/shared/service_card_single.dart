import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/constants/urls.dart';
import 'package:health_service/models/service_model.dart';
import 'package:health_service/models/topic_model.dart';

class ServiceCardSingle extends StatelessWidget {
  final HealthService service; // Updated to use imagePath instead of imageUrl

  ServiceCardSingle({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(8.0),

      decoration: BoxDecoration(
        color: primaryLightBackground, // Updated to use white instead of grey
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  '${UrlStrings.imagesBase}${service.icon ?? ''}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service.title ?? '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: primaryBlack.withOpacity(0.7),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 180,
                child: Text(service.description ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: primaryBlack.withOpacity(0.5),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '\$${service.cost.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: primaryBlue,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SympTomCard extends StatelessWidget {
  final SympTom sympTom;

  SympTomCard({
    required this.sympTom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(8.0),

      decoration: BoxDecoration(
        color: primaryLightBackground, // Updated to use white instead of grey
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: FadeInImage(
              image: NetworkImage(
                '${UrlStrings.imagesBase}${sympTom.image ?? ''}',
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
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 180,
                child: Text(sympTom.description ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: primaryBlack.withOpacity(0.5),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
