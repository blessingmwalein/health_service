
import 'dart:convert';

import 'package:health_service/models/topic_model.dart';
import 'package:health_service/repository/topic/topic_provider.dart';


class TopicRepository {
  final TopicProvider topicProvider;

  TopicRepository({required this.topicProvider});

  Future getTopics() async {
    var response =
        await topicProvider.getTopics();
    print('response $response');
    return TopicResponseModel.fromJson(jsonDecode(response));
  }

 
}
