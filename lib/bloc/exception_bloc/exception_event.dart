part of 'exception_bloc.dart';

abstract class ExceptionEvent {}

class ShowExceptionEvent extends ExceptionEvent {
  final String errorMessage;

  ShowExceptionEvent({required this.errorMessage});

  List<Object> get props => [errorMessage];
}

class ClearExceptionEvent extends ExceptionEvent {
  List<Object> get props => [];
}

class ShowSuccessEvent extends ExceptionEvent {
  final String message;

  ShowSuccessEvent({required this.message});

  List<Object> get props => [message];
}
