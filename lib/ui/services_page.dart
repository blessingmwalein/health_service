import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/bloc/service/service_bloc.dart';
import 'package:health_service/bloc/topic/topic_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/heading_text.dart';
import 'package:health_service/ui/util/shared/service_card.dart';
import 'package:health_service/ui/util/shared/symptom_card.dart';
import 'package:health_service/ui/util/shared/toll_free_card.dart';

@RoutePage()
class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  void initState() {
    BlocProvider.of<ServiceBloc>(context).add(const GetServices());

    // BlocProvider.of<InvoiceBloc>(context)
    //     .add(GetInvoicesByLoadSheetId(loadSheetId: state.loadSheet.id ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
        title: 'Services',
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
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
              // const SizedBox(height: 10),
              BlocBuilder<ServiceBloc, ServiceBlocState>(
                  builder: (context, state) {
                if (state is ServiceSuccess) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.services.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // Assuming each symptom has a `name` and an `imagePath`
                      final service = state.services[index];
                      return Column(
                        children: [
                          ServiceCard(service: service),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  );
                } else if (state is ServiceLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              }),

              // ListView(
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   children: const [

              //     SizedBox(height: 10),
              //     ServiceCard(),
              //     SizedBox(height: 10),
              //     ServiceCard(),
              //   ],
              // )
            ],
          ),
        )));
  }
}
