import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/models/tollfree_model.dart';
import 'package:health_service/ui/tabs/about_tab.dart';
import 'package:health_service/ui/tabs/services_tab.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';
import 'package:health_service/ui/util/shared/service_slider.dart';
import 'package:health_service/ui/util/shared/toll_free_card.dart';

@RoutePage()
class TollFreeSinglePage extends StatefulWidget {
  final TollFree tollFree;
  const TollFreeSinglePage({super.key, required this.tollFree});

  @override
  State<TollFreeSinglePage> createState() => _TollFreeSinglePageState();
}

class _TollFreeSinglePageState extends State<TollFreeSinglePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      title: "Tollfree",
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TollFreeCard(
                tollFree: widget.tollFree,
              ),
              SizedBox(height: 20),
              const SizedBox(
                height: 10,
              ),
              Text(widget.tollFree.description ?? 'No description available',
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
                widget.tollFree.workingHours ?? 'No working hours available',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: primaryBlack.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
