part of 'topic_bloc.dart';

abstract class TopicBlocEvent extends Equatable {
  const TopicBlocEvent();
  @override
  List<Object> get props => [];
}

class LoadSheetsFetch extends TopicBlocEvent {}

//get by status
class GetTopics extends TopicBlocEvent {


  const GetTopics();

  @override
  List<Object> get props => [];
}
