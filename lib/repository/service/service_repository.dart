
import 'dart:convert';

import 'package:health_service/models/service_model.dart';
import 'package:health_service/repository/service/service_provider.dart';




class ServiceRepository {
  final ServiceProvider serviceProvider;

  ServiceRepository({required this.serviceProvider});

  Future getServices() async {
    var response =
        await serviceProvider.getServices();
    print('response $response');
    return ServiceResponseModel.fromJson(jsonDecode(response));
  }

 
}
