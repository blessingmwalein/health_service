import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/constants/urls.dart';
import 'package:health_service/models/topic_model.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/service_card.dart';
import 'package:health_service/ui/util/shared/service_card_single.dart';
import 'package:health_service/ui/util/shared/symptom_card.dart';
import 'package:health_service/models/service_model.dart';

@RoutePage()
class StiSinglePage extends StatefulWidget {
  final Sti sti;
  const StiSinglePage({super.key, required this.sti});

  @override
  State<StiSinglePage> createState() => _StiSinglePageState();
}

class _StiSinglePageState extends State<StiSinglePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
        title: 'Topics',
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: FadeInImage(
                  image: NetworkImage(
                    '${UrlStrings.imagesBase}${widget.sti.image}',
                  ),
                  placeholder: const AssetImage('assets/images/default.jpg'),
                  // width: double.infinity,
                  // width: 100,
                  height: 200,
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
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.sti.name ?? '',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: primaryBlack.withOpacity(0.7),
                ),
              ),
              Text(widget.sti.description ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: primaryBlack.withOpacity(0.5),
                  )),
              const SizedBox(
                height: 10,
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
                      isScrollable: true,
                      tabs: const [
                        Tab(text: 'Symptoms'),
                        Tab(text: 'Diagnostics'),
                        Tab(text: 'Treatment'),
                        Tab(text: 'Nearby Centers'),
                      ],
                    ),
                    SizedBox(
                      height: 600, // Adjust the height as needed
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.sti.sympToms?.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final sympTom = widget.sti.sympToms?[index];
                              return Column(
                                children: [
                                  SympTomCard(sympTom: sympTom ?? SympTom()),
                                  const SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                          Container(
                            // padding: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(8.0),

                            decoration: BoxDecoration(
                              color:
                                  primaryLightBackground, // Updated to use white instead of grey
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(widget.sti.diagnostics ?? '',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: primaryBlack.withOpacity(0.5),
                                )),
                          ),
                          Container(
                            // padding: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(8.0),

                            decoration: BoxDecoration(
                              color:
                                  primaryLightBackground, // Updated to use white instead of grey
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(widget.sti.treatment ?? '',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: primaryBlack.withOpacity(0.5),
                                )),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.sti.centers?.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              // Assuming each symptom has a `name` and an `imagePath`
                              final service =
                                  widget.sti.centers?[index].healthService;
                              return Column(
                                children: [
                                  ServiceCard(service: service ?? Service()),
                                  const SizedBox(width: 10),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
