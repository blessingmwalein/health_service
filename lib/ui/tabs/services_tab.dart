import 'package:flutter/material.dart';
import 'package:health_service/models/service_model.dart';
import 'package:health_service/ui/util/shared/service_card_single.dart';

class ServicesTab extends StatefulWidget {
  List<HealthService> services;
  ServicesTab({super.key, required this.services});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.services.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // Assuming each symptom has a `name` and an `imagePath`
            final service = widget.services[index];
            return Column(
              children: [
                ServiceCardSingle(service: service),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ],
    );
  }
}
