import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/repository/health/health_repository.dart';

part 'health_event.dart';
part 'health_state.dart';

class HealthBloc
    extends Bloc<HealthEvent, HealthState> {
  final HealthRepository healthRepository;


  HealthBloc(
      {required this.healthRepository})
      : super(HealthInitial()) {
    
  }
}
