import 'dart:convert';

import 'package:health_service/models/info_model.dart';
import 'package:health_service/models/topic_model.dart';
import 'package:health_service/repository/info/info_provider.dart';
import 'package:health_service/repository/topic/topic_provider.dart';

class InfoRepository {
  final InfoProvider infoProvider;

  InfoRepository({required this.infoProvider});

  Future getInfos() async {
    var response = await infoProvider.getInfos();
    print('response $response');
    return InfoResponseModel.fromJson(jsonDecode(response));
  }
}
