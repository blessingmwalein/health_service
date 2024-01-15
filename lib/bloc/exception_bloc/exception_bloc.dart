import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exception_event.dart';
part 'exception_state.dart';

class ExceptionBloc extends Bloc<ExceptionEvent, ExceptionState> {
  ExceptionBloc() : super(ExceptionInitial()) {
    on<ShowExceptionEvent>((event, emit) async {
      emit(ExceptionInitial());

      emit(ErrorExceptionState(message: event.errorMessage));
    });

    on<ClearExceptionEvent>((event, emit) async {
      emit(ExceptionInitial());
    });

    on<ShowSuccessEvent>((event, emit) async {
      emit(ExceptionInitial());

      emit(SuccessExceptionState(message: event.message));
    });
  }
}
