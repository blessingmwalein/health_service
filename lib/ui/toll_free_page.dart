import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/bloc/service/service_bloc.dart';
import 'package:health_service/bloc/tollfree/tollfree_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/heading_text.dart';
import 'package:health_service/ui/util/shared/service_card.dart';
import 'package:health_service/ui/util/shared/symptom_card.dart';
import 'package:health_service/ui/util/shared/toll_free_card.dart';

@RoutePage()
class TollFreePage extends StatefulWidget {
  const TollFreePage({super.key});

  @override
  State<TollFreePage> createState() => _TollFreePageState();
}

class _TollFreePageState extends State<TollFreePage> {
  @override
  void initState() {
    BlocProvider.of<TollFreeBloc>(context).add(const GetTollFrees());

    // BlocProvider.of<InvoiceBloc>(context)
    //     .add(GetInvoicesByLoadSheetId(loadSheetId: state.loadSheet.id ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
        title: 'Tollfree',
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),

          child: BlocBuilder<TollFreeBloc, TollFreeBlocState>(
              builder: (context, state) {
            if (state is TollFreeSuccess) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.tollFrees.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // Assuming each symptom has a `name` and an `imagePath`
                  final tollFree = state.tollFrees[index];
                  return Column(
                    children: [
                      TollFreeCard(tollFree: tollFree),
                      const SizedBox(width: 10),
                    ],
                  );
                },
              );
            } else if (state is TollFreeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('Something went wrong'));
            }
          }),
          // child: ListView(
          //   // scrollDirection: Axis.vertical,
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),

          //   children: const [
          //     TollFreeCard(
          //       icon: "assets/images/mars.png",
          //     ),
          //     SizedBox(height: 10),
          //     TollFreeCard(
          //       icon: "assets/images/mars.png",
          //     ),
          //     SizedBox(height: 10),
          //     TollFreeCard(
          //       icon: "assets/images/mars.png",
          //     ),
          //     SizedBox(height: 10),
          //     TollFreeCard(
          //       icon: "assets/images/mars.png",
          //     ),
          //   ],
          // ),
        )));
  }
}
