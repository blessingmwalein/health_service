part of 'exception_bloc.dart';

class ExceptionState extends Equatable {
  @override
  List<Object> get props => [];
}

class ExceptionInitial extends ExceptionState {}

class ExceptionLoading extends ExceptionState {}

class SuccessExceptionState extends ExceptionState {
  final String message;

  SuccessExceptionState({required this.message});
  @override
  List<Object> get props => [message];
}

class ErrorExceptionState extends ExceptionState {
  final String message;

  ErrorExceptionState({required this.message});
  @override
  List<Object> get props => [message];
}
