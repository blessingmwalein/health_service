import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_service/bloc/exception_bloc/exception_bloc.dart';
import 'package:health_service/models/group_chat_message_model.dart';
import 'package:health_service/models/user_group_chat_model.dart';
import 'package:health_service/repository/group_chats/group_chat_repository.dart';

part 'group_chat_event.dart';
part 'group_chat_state.dart';

class GroupChatBloc extends Bloc<GroupChatBlocEvent, GroupChatBlocState> {
  final GroupChatRepository groupChatRepository;
  final ExceptionBloc exceptionBloc;
  final FlutterSecureStorage storage;

  GroupChatBloc(
      {required this.groupChatRepository,
      required this.exceptionBloc,
      required this.storage})
      : super(GroupChatInitial()) {
    on<GetGroupChats>((event, emit) async {
      emit(GroupChatLoading());
      try {
        UserGroupChatResponseModel userGroupChats =
            await groupChatRepository.getUserGroupChats();

        UserGroupChatResponseModel userNotGroupChats =
            await groupChatRepository.getUserNotGroupChats();
        emit(GroupChatSuccess(
            groupChats: userGroupChats.data,
            notGroupChats: userNotGroupChats.data));
      } catch (e) {
        print(e.toString());
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(GroupChatFailure(message: e.toString()));
      }
    });

    on<JoinGroupChat>((event, emit) async {
      emit(GroupChatLoading());
      try {
        await groupChatRepository.joinGroupChat(event.groupChatId);
        // UserGroupChatResponseModel userGroupChats =
        //     await groupChatRepository.getUserGroupChats();

        // UserGroupChatResponseModel userNotGroupChats =
        //     await groupChatRepository.getUserNotGroupChats();
        emit(JoinGroupSuccess());
        exceptionBloc.add(ShowSuccessEvent(message: 'Joined Successfully'));
      } catch (e) {
        print(e.toString());
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(GroupChatFailure(message: e.toString()));
      }
    });

    on<GetGroupChatMessages>((event, emit) async {
      emit(GroupChatLoading());
      try {
        GroupChatMessageResponseModel groupChatMessageResponseModel =
            await groupChatRepository.getGroupChatMessages(event.groupChatId);

        emit(GroupChatSuccess(
            groupChatMessages: groupChatMessageResponseModel.data,
            groupChats: event.userGroupChats,
            notGroupChats: event.userNotGroupChats));
      } catch (e) {
        print(e.toString());
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(GroupChatFailure(message: e.toString()));
      }
    });

    on<SendGroupChatMessage>((event, emit) async {
      emit(GroupChatLoading());
      try {
        SendGroupChatMessageResponseModel sendMessageResponse =
            await groupChatRepository.sendGroupChatMessage(
                message: event.message,
                groupChatId: event.groupChatId,
                file: event.file);
        GroupChatMessageResponseModel groupChatMessageResponseModel =
            await groupChatRepository.getGroupChatMessages(event.groupChatId);

        emit(GroupChatSuccess(
            groupChatMessages: groupChatMessageResponseModel.data,
            groupChats: event.userGroupChats,
            notGroupChats: event.userNotGroupChats));
        // emit(SingleGroupChat(
        //     groupChatMessages: groupChatMessageResponseModel.data));
        exceptionBloc
            .add(ShowSuccessEvent(message: 'Message Sent Successfully'));
      } catch (e) {
        print(e.toString());
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(GroupChatFailure(message: e.toString()));
      }
    });
  }
}
