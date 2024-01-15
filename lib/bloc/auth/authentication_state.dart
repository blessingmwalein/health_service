part of 'authentication_bloc.dart';

abstract class AuthenticationBlocState extends Equatable {
  const AuthenticationBlocState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationBlocState {}

class AuthenticationLoading extends AuthenticationBlocState {}

class AuthenticationSuccess extends AuthenticationBlocState {
  final AuthModel authenticationModel;

  const AuthenticationSuccess({required this.authenticationModel});

  @override
  List<Object> get props => [authenticationModel];
}

class AuthenticationProfileSuccess extends AuthenticationBlocState {
  final User profileModel;

  const AuthenticationProfileSuccess({required this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

class AuthenticationFailure extends AuthenticationBlocState {
  final String message;

  const AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthenticationAuthenticated extends AuthenticationBlocState {
  final User userModel;

  const AuthenticationAuthenticated({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class AuthUserCacheFound extends AuthenticationBlocState {
  final User userModel;

  const AuthUserCacheFound({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class AuthUserCacheNotFound extends AuthenticationBlocState {
  @override
  List<Object> get props => [];
}
