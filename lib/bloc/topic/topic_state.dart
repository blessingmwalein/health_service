part of 'topic_bloc.dart';


abstract class TopicBlocState extends Equatable {
  const TopicBlocState();

  @override
  List<Object> get props => [];
}

class TopicInitial extends TopicBlocState {}

class TopicLoading extends TopicBlocState {}

class TopicSuccess extends TopicBlocState {
  final List<Topic> topics;

  const TopicSuccess({required this.topics});

  @override
  List<Object> get props => [topics];
}

class TopicFailure extends TopicBlocState {
  final String message;

  const TopicFailure({required this.message});

  @override
  List<Object> get props => [message];
}

