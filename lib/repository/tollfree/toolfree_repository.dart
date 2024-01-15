import 'dart:convert';

import 'package:health_service/models/tollfree_model.dart';
import 'package:health_service/repository/tollfree/tollfree_provider.dart';

class TollFreeRepository {
  final TollFreeProvider tollFreeProvider;

  TollFreeRepository({required this.tollFreeProvider});

  Future getTollFrees() async {
    var response = await tollFreeProvider.getTollFrees();
    print('response $response');
    return TollFreeResponseModel.fromJson(jsonDecode(response));
  }
}
