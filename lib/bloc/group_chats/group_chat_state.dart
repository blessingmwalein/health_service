part of 'group_chat_bloc.dart';

abstract class GroupChatBlocState extends Equatable {
  const GroupChatBlocState();

  @override
  List<Object> get props => [];
}

class GroupChatInitial extends GroupChatBlocState {}

class GroupChatLoading extends GroupChatBlocState {}

class GroupChatSuccess extends GroupChatBlocState {
  final List<GroupChat> groupChats;
  final List<GroupChat> notGroupChats;
  final List<GroupChatMessage>? groupChatMessages;

  const GroupChatSuccess(
      {required this.groupChats,
      required this.notGroupChats,
      this.groupChatMessages});

  @override
  List<Object> get props => [groupChats, notGroupChats];
}

class GroupChatFailure extends GroupChatBlocState {
  final String message;

  const GroupChatFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class SingleGroupChat extends GroupChatBlocState {
  final List<GroupChatMessage> groupChatMessages;

  const SingleGroupChat({required this.groupChatMessages});

  @override
  List<Object> get props => [groupChatMessages];
}

class JoinGroupSuccess extends GroupChatBlocState {

   JoinGroupSuccess();

  @override
  List<Object> get props => [];
}

