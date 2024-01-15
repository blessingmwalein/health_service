import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/bloc/info/info_bloc.dart';
import 'package:health_service/bloc/service/service_bloc.dart';
import 'package:health_service/bloc/topic/topic_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/heading_text.dart';
import 'package:health_service/ui/util/shared/info_card.dart';
import 'package:health_service/ui/util/shared/service_card.dart';
import 'package:health_service/ui/util/shared/symptom_card.dart';
import 'package:health_service/ui/util/shared/toll_free_card.dart';

@RoutePage()
class InforPage extends StatefulWidget {
  const InforPage({Key? key}) : super(key: key);

  @override
  State<InforPage> createState() => _InforPageState();
}

class _InforPageState extends State<InforPage> {
  @override
  void initState() {
        BlocProvider.of<InfoBloc>(context).add(const GetInfos());

  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      title: 'Topics',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
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
                          const SizedBox(width: 10),
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
        ),
      ),
    );
  }
}
