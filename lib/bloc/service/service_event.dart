part of 'service_bloc.dart';

abstract class ServiceBlocEvent extends Equatable {
  const ServiceBlocEvent();
  @override
  List<Object> get props => [];
}

class LoadSheetsFetch extends ServiceBlocEvent {}

//get by status
class GetServices extends ServiceBlocEvent {
  const GetServices();

  @override
  List<Object> get props => [];
}
