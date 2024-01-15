import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/bloc/auth/authentication_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/auth_container.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';
import 'package:health_service/ui/util/text_fields/custom_textfield.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      title: "Sign Up",
      welcomeText: "Create an account",
      welcomeSubText: "We're very happy to see you register",
      hasSocial: false,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        label: "First Name",
                        hint: "Enter your first name",
                        isPassword: false,
                        controller: firstNameController,
                        validator: _validateFirstNameInput,
                        onChanged: (value) {
                          setState(() {
                            // Update the form state as the user types
                            _validateFirstNameInput(value);
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _validateFirstNameInput(firstNameController.text) ??
                              '',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        label: "Last Name",
                        hint: "Enter your last name",
                        isPassword: false,
                        controller: lastNameController,
                        validator: _validateLastNameInput,
                        onChanged: (value) {
                          setState(() {
                            // Update the form state as the user types
                            _validateLastNameInput(value);
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _validateLastNameInput(lastNameController.text) ?? '',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                CustomTextFieldWidget(
                  label: "Email",
                  hint: "Enter your email",
                  isPassword: false,
                  controller: emailController,
                  validator: _validateEmailInput,
                  onChanged: (value) {
                    setState(() {
                      // Update the form state as the user types
                      _validateEmailInput(value);
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _validateEmailInput(emailController.text) ?? '',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                CustomTextFieldWidget(
                  label: "Password",
                  hint: "*********",
                  isPassword: true,
                  controller: passwordController,
                  validator: _validatePasswordInput,
                  onChanged: (value) {
                    setState(() {
                      // Update the form state as the user types
                      _validatePasswordInput(value);
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _validatePasswordInput(
                            passwordConfirmationController.text) ??
                        '',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                CustomTextFieldWidget(
                  label: "Confirm Password",
                  hint: "*********",
                  isPassword: true,
                  controller: passwordConfirmationController,
                  validator: _validatePasswordInput,
                  onChanged: (value) {
                    setState(() {
                      // Update the form state as the user types
                      _validatePasswordInput(value);
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _validatePasswordInput(
                            passwordConfirmationController.text) ??
                        '',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: primaryPurple.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
            Container(
              child: BlocBuilder<AuthenticationBloc, AuthenticationBlocState>(
                  builder: (context, state) {
                return outlinedButton(context,
                    text: "Sign Up",
                    height: 60,
                    // width: 300,
                    isOulined: false,
                    isLoading: state is AuthenticationLoading,
                    color: primaryOrange, onPressed: () {
                  print('printed');

                  if (_formKey.currentState!.validate()) {
                    print('validated');

                    context.read<AuthenticationBloc>().add(
                          RegisterUser(
                            username: emailController.text,
                            password: passwordController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            passwordConfirmation:
                                passwordConfirmationController.text,
                          ),
                        );
                    context
                        .read<AuthenticationBloc>()
                        .stream
                        .listen((authState) {
                      if (authState is AuthenticationProfileSuccess) {
                        context.router.push(
                            const SignInRoute()); // Use your home route name
                      }
                    });
                  }
                });
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            //need an aacount sign up text button aligned center
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    context.router.push(const SignInRoute());
                  },
                  child: Text(
                    "Aready have an account ? Sign In",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: primaryPurple.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _validateEmailInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validateFirstNameInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }

    return null;
  }

  String? _validateLastNameInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your last name';
    }

    return null;
  }

  String? _validatePasswordInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }
}
