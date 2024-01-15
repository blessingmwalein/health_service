import 'dart:convert';

import 'package:health_service/models/auth_model.dart';
import 'package:health_service/models/register_model.dart';
import 'package:health_service/repository/auth/authentication_provider.dart';

class AuthenticationRepository {
  final AuthenticationProvider authenticationProvider;

  AuthenticationRepository({required this.authenticationProvider});

  Future login({
    required String email,
    required String password,
  }) async {
    var response = await authenticationProvider.login(
      email: email,
      password: password,
    );
    return AuthModel.fromJson(jsonDecode(response));
  }

  Future register({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String firstName,
    required String lastName,
  }) async {
    var response = await authenticationProvider.register(
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      firstName: firstName,
      lastName: lastName,
    );
    return RegisterModel.fromJson(jsonDecode(response));
  }

  Future updateProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String gender,
    required String address,
    required String city,
  }) async {
    return UpdateProfileResponseModel.fromJson(
        jsonDecode(await authenticationProvider.updateProfile(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      gender: gender,
      address: address,
      city: city,
    )));
  }

  Future changePassword({
    required String oldPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    return UpdateProfileResponseModel.fromJson(jsonDecode(await authenticationProvider.changePassword(
      oldPassword: oldPassword,
      password: password,
      passwordConfirmation: passwordConfirmation,
    )));
  }

  Future getAuthToken() async {
    var token = await authenticationProvider.getAuthToken();
    return token;
  }

  //gte cached user
  Future getCachedUser() async {
    var profile =
        User.fromJson(jsonDecode(await authenticationProvider.getCacheUser()));

    return profile;
  }

  //logout
  Future logout() async {
    return await authenticationProvider.logOut();
  }
}
