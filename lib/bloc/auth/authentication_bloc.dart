import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_service/bloc/exception_bloc/exception_bloc.dart';
import 'package:health_service/models/auth_model.dart';
import 'package:health_service/models/register_model.dart';
import 'package:health_service/repository/auth/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  final AuthenticationRepository authenticationRepository;
  final FlutterSecureStorage storage;
  final ExceptionBloc exceptionBloc;

  AuthenticationBloc(
      {required this.authenticationRepository,
      required this.storage,
      required this.exceptionBloc})
      : super(AuthenticationInitial()) {
    on<AuthUserCache>((event, emit) async {
      try {
        var token = await authenticationRepository.getAuthToken();

        print('token $token');

        User authModel = await authenticationRepository.getCachedUser();

        print('authModel ${authModel}');

        emit(AuthUserCacheFound(userModel: authModel));
      } catch (e) {
        print('error ${e.toString()}');
        emit(AuthUserCacheNotFound());
      }
    });

    on<AuthenticationLogin>((event, emit) async {
      // exceptionBloc.add(ClearExceptionEvent());
      emit(AuthenticationLoading());
      //clear exception bloc
      try {
        AuthModel authenticationModel = await authenticationRepository.login(
          email: event.username,
          password: event.password,
        );
        storage.write(key: 'token', value: authenticationModel.data.token);

        storage.write(
            key: 'user', value: jsonEncode(authenticationModel.data.user));
        exceptionBloc.add(ShowSuccessEvent(message: "Login Success"));
        emit(AuthenticationSuccess(authenticationModel: authenticationModel));

        //navigate to home
      } catch (e) {
        print('token ${e.toString()}');

        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(AuthenticationFailure(message: e.toString()));
      }
    });

    on<RegisterUser>((event, emit) async {
      // exceptionBloc.add(ClearExceptionEvent());
      emit(AuthenticationLoading());
      //clear exception bloc
      try {
        RegisterModel registerModel = await authenticationRepository.register(
          email: event.username,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName,
          passwordConfirmation: event.passwordConfirmation,
        );

        exceptionBloc.add(ShowSuccessEvent(message: "Account Created! Login"));
        emit(AuthenticationProfileSuccess(profileModel: registerModel.data));

        //navigate to home
      } catch (e) {
        print('token ${e.toString()}');

        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(AuthenticationFailure(message: e.toString()));
      }
    });

    on<AuthenticationUpdateProfile>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final UpdateProfileResponseModel profileModel =
            await authenticationRepository.updateProfile(
          gender: event.gender,
          firstName: event.firstName,
          lastName: event.lastName,
          phoneNumber: event.phoneNumber,
          address: event.address,
          city: event.city,
        );
        storage.write(key: 'user', value: jsonEncode(profileModel.data));
        emit(AuthUserCacheFound(userModel: profileModel.data));
        exceptionBloc.add(ShowSuccessEvent(message: "Profile Updated"));
      } catch (e) {
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));

        emit(AuthenticationFailure(message: e.toString()));
      }
    });

    on<AuthenticationChangePassword>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final UpdateProfileResponseModel profileModel =
            await authenticationRepository.changePassword(
          oldPassword: event.oldPassword,
          password: event.password,
          passwordConfirmation: event.passwordConfirmation,
        );
        emit(AuthUserCacheFound(userModel: profileModel.data));
        exceptionBloc.add(ShowSuccessEvent(
            message: profileModel.message ?? 'Password Updated'));
      } catch (e) {
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(AuthenticationFailure(message: e.toString()));
      }
    });

    on<LoadCachedUser>((event, emit) async {
      try {
        User userModel = await authenticationRepository.getCachedUser();
        emit(AuthenticationAuthenticated(userModel: userModel));
      } catch (e) {
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(AuthenticationFailure(message: e.toString()));
      }
    });

    on<LogOut>((event, emit) async {
      try {
        await authenticationRepository.logout();
        emit(const AuthenticationFailure(message: "Logout Success"));
        exceptionBloc.add(ShowSuccessEvent(message: "Logout Success"));
      } catch (e) {
        exceptionBloc.add(ShowExceptionEvent(errorMessage: e.toString()));
        emit(AuthenticationFailure(message: e.toString()));
      }
    });
  }
}
