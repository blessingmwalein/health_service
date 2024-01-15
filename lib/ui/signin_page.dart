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
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      title: "Sign In",
      welcomeText: "Hey Buddy",
      welcomeSubText: "Welcome Back!",
      hasSocial: true,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Form(
              child: Column(
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
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              child: Column(
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
                      _validatePasswordInput(passwordController.text) ?? '',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // context.router.push(const ForgotPasswordRoute());
                  },
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
                    text: "Sign In",
                    height: 60,
                    // width: 300,
                    isOulined: false,
                    isLoading: state is AuthenticationLoading,
                    color: primaryOrange, onPressed: () {
                  print('printed');

                  if (_formKey.currentState!.validate()) {
                    print('validated');

                    context.read<AuthenticationBloc>().add(
                          AuthenticationLogin(
                            username: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                    context
                        .read<AuthenticationBloc>()
                        .stream
                        .listen((authState) {
                      if (authState is AuthenticationSuccess) {
                        context.router.push(
                            const HomeRoute()); // Use your home route name
                      }
                    });
                  }
                });
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            outlinedButton(context,
                text: "Guest",
                height: 60,
                isOulined: true,
                color: primaryOrange, onPressed: () {
              context.router.push(const HomeRoute());
            }),
            const SizedBox(
              height: 5,
            ),
            //need an aacount sign up text button aligned center
            TextButton(
              onPressed: () {
                context.router.push(const SignUpRoute());
              },
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: primaryPurple.withOpacity(0.5)),
              ),
            )
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

  String? _validatePasswordInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }
}
