part of 'group_chat_bloc.dart';

abstract class GroupChatBlocEvent extends Equatable {
  const GroupChatBlocEvent();
  @override
  List<Object> get props => [];
}

//get by status
class GetGroupChats extends GroupChatBlocEvent {
  const GetGroupChats();

  @override
  List<Object> get props => [];
}

class SendGroupMessage extends GroupChatBlocEvent {
  final String message;
  final int groupChatId;
  final File file;

  const SendGroupMessage(
      {required this.message, required this.groupChatId, required this.file});

  @override
  List<Object> get props => [message, groupChatId, file];
}

class JoinGroupChat extends GroupChatBlocEvent {
  final int groupChatId;

  const JoinGroupChat({required this.groupChatId});

  @override
  List<Object> get props => [groupChatId];
}

class GetGroupChatMessages extends GroupChatBlocEvent {
  final int groupChatId;
  List<GroupChat> userGroupChats;
  List<GroupChat> userNotGroupChats;

  GetGroupChatMessages(
      {required this.groupChatId,
      required this.userGroupChats,
      required this.userNotGroupChats});

  @override
  List<Object> get props => [groupChatId, userGroupChats, userNotGroupChats];
}

class SendGroupChatMessage extends GroupChatBlocEvent {
  final String message;
  final int groupChatId;
  final File? file;

  List<GroupChat> userGroupChats;
  List<GroupChat> userNotGroupChats;

  SendGroupChatMessage(
      {required this.message,
      required this.groupChatId,
      this.file,
      required this.userGroupChats,
      required this.userNotGroupChats});

  @override
  List<Object> get props =>
      [message, groupChatId, userGroupChats, userNotGroupChats];
}
