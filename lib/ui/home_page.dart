import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/bloc/info/info_bloc.dart';
import 'package:health_service/bloc/topic/topic_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/heading_text.dart';
import 'package:health_service/ui/util/shared/home_slider.dart';
import 'package:health_service/ui/util/shared/info_card.dart';
import 'package:health_service/ui/util/shared/service_card.dart';
import 'package:health_service/ui/util/shared/symptom_card.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<TopicBloc>(context).add(const GetTopics());
    BlocProvider.of<InfoBloc>(context).add(const GetInfos());

    // BlocProvider.of<InvoiceBloc>(context)
    //     .add(GetInvoicesByLoadSheetId(loadSheetId: state.loadSheet.id ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
        title: 'Home',
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const HomeSlider(imageHeight: 200.0),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         // width: 200, // Adjust the width as needed
              //         height: 50, // Adjust the height as needed
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(
              //               10), // Adjust the radius for rounded corners
              //           border: Border.all(
              //             color: Colors.grey
              //                 .withOpacity(0.4), // Set the border color
              //             width: 1.0, // Set the border width
              //           ),
              //         ),
              //         child: Row(
              //           children: [
              //             Padding(
              //               padding: EdgeInsets.all(5.0),
              //               child: myIcon(
              //                   path: "assets/icons/search.svg",
              //                   width: 30,
              //                   height: 30),
              //             ),
              //             const Expanded(
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   hintText: 'Filter Health Services',
              //                   hintStyle: TextStyle(
              //                     color: Colors.grey,
              //                     fontSize: 22,
              //                   ),
              //                   border: InputBorder.none,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 10),
              //     Container(
              //       width: 50,
              //       height: 50,
              //       padding: const EdgeInsets.all(5),
              //       decoration: BoxDecoration(
              //         color: primaryBlue,
              //         borderRadius: BorderRadius.circular(10),
              //         border: Border.all(
              //           color: primaryBlue,
              //           width: 2,
              //         ),
              //       ),
              //       child: myIcon(
              //           path: "assets/icons/adjustments.svg",
              //           width: 30,
              //           height: 30,
              //           iconColor: Colors.white),
              //     )
              //   ],
              // ),
              const SizedBox(height: 10),
              headingText("Frequent Topics", () {
                context.router.push(const TopicsRoute());
              }),
              const SizedBox(height: 10),
              BlocBuilder<TopicBloc, TopicBlocState>(builder: (context, state) {
                if (state is TopicSuccess) {
                  // Assuming `state.symptoms` is a List of symptom data
                  return SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.topics.length,
                      itemBuilder: (context, index) {
                        // Assuming each symptom has a `name` and an `imagePath`
                        final topic = state.topics[index];
                        return Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  context.router
                                      .push(TopicSingleRoute(topic: topic));
                                },
                                child: symptomCard(topic)),
                            const SizedBox(width: 10),
                          ],
                        );
                      },
                    ),
                  );
                } else if (state is TopicLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              }),

              const SizedBox(height: 10),
              headingText("SHRH Information", () {
                context.router.push(const InforRoute());
              }),
              const SizedBox(height: 10),

              BlocBuilder<InfoBloc, InfoBlocState>(builder: (context, state) {
                if (state is InfoSuccess) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.infos.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // Assuming each symptom has a `name` and an `imagePath`
                      final infor = state.infos[index];
                      return Column(
                        children: [
                          InforCard(
                            info: infor,
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  );
                } else if (state is InfoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              }),
            ],
          ),
        )));
  }
}
