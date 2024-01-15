import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_service/bloc/exception_bloc/exception_bloc.dart';
import 'package:health_service/models/topic_model.dart';
import 'package:health_service/repository/topic/topic_repository.dart';

part 'topic_event.dart';
part 'topic_state.dart';

class TopicBloc extends Bloc<TopicBlocEvent, TopicBlocState> {
  final TopicRepository topicRepository;
  final ExceptionBloc exceptionBloc;
  final FlutterSecureStorage storage;

  TopicBloc(
      {required this.topicRepository,
      required this.exceptionBloc,
      required this.storage})
      : super(TopicInitial()) {
    on<GetTopics>((event, emit) async {
      emit(TopicLoading());
      try {
        TopicResponseModel topicResponseModel =
            await topicRepository.getTopics();
        emit(TopicSuccess(topics: topicResponseModel.data));
      } catch (e) {
        print(e.toString());
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(TopicFailure(message: e.toString()));
      }
    });
  }
}
