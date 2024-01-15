part of 'authentication_bloc.dart';

abstract class AuthenticationBlocEvent extends Equatable {
  const AuthenticationBlocEvent();
  @override
  List<Object> get props => [];
}

class AuthenticationLogin extends AuthenticationBlocEvent {
  final String username;
  final String password;

  const AuthenticationLogin({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class RegisterUser extends AuthenticationBlocEvent {
  final String username;
  final String password;
  final String passwordConfirmation;
  final String firstName;
  final String lastName;

  const RegisterUser(
      {required this.username,
      required this.password,
      required this.passwordConfirmation,
      required this.firstName,
      required this.lastName});

  @override
  List<Object> get props => [username, password];
}

class AuthenticationGetProfile extends AuthenticationBlocEvent {}

class AuthUserCache extends AuthenticationBlocEvent {}

class AuthenticationUpdateProfile extends AuthenticationBlocEvent {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String gender;
  final String address;
  final String city;

  const AuthenticationUpdateProfile({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.gender,
    required this.address,
    required this.city,
  });

  @override
  List<Object> get props => [firstName, lastName, phoneNumber, gender, address, city];
}

class AuthenticationChangePassword extends AuthenticationBlocEvent {
  final String oldPassword;
  final String password;
  final String passwordConfirmation;

  const AuthenticationChangePassword(
      {required this.oldPassword,
      required this.password,
      required this.passwordConfirmation});

  @override
  List<Object> get props => [oldPassword, password, passwordConfirmation];
}

class LoadCachedUser extends AuthenticationBlocEvent {}

class LogOut extends AuthenticationBlocEvent {}
