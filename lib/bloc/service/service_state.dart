part of 'service_bloc.dart';


abstract class ServiceBlocState extends Equatable {
  const ServiceBlocState();

  @override
  List<Object> get props => [];
}

class ServiceInitial extends ServiceBlocState {}

class ServiceLoading extends ServiceBlocState {}

class ServiceSuccess extends ServiceBlocState {
  final List<Service> services;

  const ServiceSuccess({required this.services});

  @override
  List<Object> get props => [services];
}

class ServiceFailure extends ServiceBlocState {
  final String message;

  const ServiceFailure({required this.message});

  @override
  List<Object> get props => [message];
}

