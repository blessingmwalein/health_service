import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_service/bloc/exception_bloc/exception_bloc.dart';
import 'package:health_service/models/info_model.dart';
import 'package:health_service/models/topic_model.dart';
import 'package:health_service/repository/info/info_repository.dart';
import 'package:health_service/repository/topic/topic_repository.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoBlocEvent, InfoBlocState> {
  final InfoRepository infoRepository;
  final ExceptionBloc exceptionBloc;
  final FlutterSecureStorage storage;

  InfoBloc(
      {required this.infoRepository,
      required this.exceptionBloc,
      required this.storage})
      : super(InfoInitial()) {
    on<GetInfos>((event, emit) async {
      emit(InfoLoading());
      try {
        InfoResponseModel infoResponseModel = await infoRepository.getInfos();
        emit(InfoSuccess(infos: infoResponseModel.data));
      } catch (e) {
        print(e.toString());
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(InfoFailure(message: e.toString()));
      }
    });
  }
}
