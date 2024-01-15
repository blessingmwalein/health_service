import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_service/bloc/exception_bloc/exception_bloc.dart';
import 'package:health_service/models/tollfree_model.dart';
import 'package:health_service/repository/tollfree/toolfree_repository.dart';

part 'tollfree_event.dart';
part 'tollfree_state.dart';

class TollFreeBloc extends Bloc<TollFreeBlocEvent, TollFreeBlocState> {
  final TollFreeRepository tollFreeRepository;
  final ExceptionBloc exceptionBloc;
  final FlutterSecureStorage storage;

  TollFreeBloc(
      {required this.tollFreeRepository,
      required this.exceptionBloc,
      required this.storage})
      : super(TollFreeInitial()) {
    on<GetTollFrees>((event, emit) async {
      emit(TollFreeLoading());
      try {
        TollFreeResponseModel tollFreeResponseModel =
            await tollFreeRepository.getTollFrees();
        emit(TollFreeSuccess(tollFrees: tollFreeResponseModel.data));
      } catch (e) {
        print(e.toString());
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(TollFreeFailure(message: e.toString()));
      }
    });
  }
}
