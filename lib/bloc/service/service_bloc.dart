import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_service/bloc/exception_bloc/exception_bloc.dart';
import 'package:health_service/models/service_model.dart';
import 'package:health_service/repository/service/service_repository.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceBlocEvent, ServiceBlocState> {
  final ServiceRepository serviceRepository;
  final ExceptionBloc exceptionBloc;
  final FlutterSecureStorage storage;

  ServiceBloc(
      {required this.serviceRepository,
      required this.exceptionBloc,
      required this.storage})
      : super(ServiceInitial()) {
    on<GetServices>((event, emit) async {
      emit(ServiceLoading());
      try {
        ServiceResponseModel serviceResponseModel =
            await serviceRepository.getServices();
        emit(ServiceSuccess(services: serviceResponseModel.data));
      } catch (e) {
        print(e.toString());
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(ServiceFailure(message: e.toString()));
      }
    });
  }
}
