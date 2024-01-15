import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/bloc/auth/authentication_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/models/auth_model.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';
import 'package:health_service/ui/util/shared/info_card.dart';
import 'package:health_service/ui/util/text_fields/custom_textfield.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final cityController = TextEditingController();

  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final newPasswordConfirmation = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _changePasswordFormKey = GlobalKey<FormState>();
  bool editMode = false;
  bool changePassword = false;

  String? selectedGender;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthUserCache()); // Replace with your authentication event
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      title: 'Profile',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<AuthenticationBloc, AuthenticationBlocState>(
            builder: (context, state) {
              print(state);
              if (state is AuthUserCacheFound) {
                return buildAuthenticatedProfile(state.userModel);
              } else if (state is AuthUserCacheNotFound) {
                return buildGuestProfile();
              } else if (state is AuthenticationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text('Something went wrong'));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildGuestProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // User Default Avatar
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(
              'assets/images/user.png'), // Replace with the path to your default user image
        ),
        SizedBox(height: 20),
        // Login As Guest Text
        const Text(
          'Logged in as Guest',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        // Action Buttons
        Row(
          children: [
            InkWell(
              onTap: () {
                context.router.push(const SignInRoute());
              },
              child: iconButton(context, icon: "assets/icons/lock-closed.svg"),
            ),
            const SizedBox(width: 10),
            const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            InkWell(
              onTap: () {
                context.router.push(const SignUpRoute());
              },
              child: iconButton(context, icon: "assets/icons/lock-closed.svg"),
            ),
            const SizedBox(width: 10),
            const Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildAuthenticatedProfile(User user) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              // Display or Edit Icon Button
              Positioned(
                bottom: 0,
                child: InkWell(
                  onTap: () {
                    if (editMode) {
                      // Save changes or update profile logic
                      // You can call your authentication bloc to update the profile
                    }
                    setState(() {
                      editMode = !editMode;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: myIcon(
                      path: editMode
                          ? "assets/icons/check-circle.svg" // Change to your check icon
                          : "assets/icons/pencil-alt.svg", // Change to your edit icon
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        // User Information or Editable Fields
        editMode
            ? Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFieldWidget(
                            label: "First Name",
                            hint: user.firstName ?? "Enter your new first name",
                            isPassword: false,
                            controller: firstNameController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextFieldWidget(
                            label: "Last Name",
                            hint: user.lastName ?? "Enter your new last name",
                            isPassword: false,
                            controller: lastNameController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFieldWidget(
                      label: "Phone Number",
                      hint: user.phoneNumber ?? "Enter your new phone number",
                      isPassword: false,
                      controller: phoneNumberController,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFieldWidget(
                      label: "Address",
                      hint: user.address ?? "Enter your new address",
                      isPassword: false,
                      controller: addressController,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFieldWidget(
                      label: "City",
                      hint: user.city ?? "Enter your new address",
                      isPassword: false,
                      controller: cityController,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedGender,
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        hintText: user.gender ?? '',
                        focusColor: primaryPurple,
                        labelStyle: const TextStyle(
                          color: primaryPurple,
                        ),
                        hintStyle: TextStyle(
                          color: primaryPurple.withOpacity(0.4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: primaryPurple,
                            width: 2.0,
                          ),
                        ),
                      ),
                      items: ['Male', 'Female', 'Other']
                          .map((gender) => DropdownMenuItem<String>(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: BlocBuilder<AuthenticationBloc,
                          AuthenticationBlocState>(builder: (context, state) {
                        return outlinedButton(context,
                            text: "Update",
                            height: 60,
                            // width: 300,
                            isOulined: false,
                            isLoading: state is AuthenticationLoading,
                            color: primaryOrange, onPressed: () {
                          print('printed');

                          if (_formKey.currentState!.validate()) {
                            print('validated');

                            context.read<AuthenticationBloc>().add(
                                  AuthenticationUpdateProfile(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    phoneNumber: phoneNumberController.text,
                                    address: addressController.text,
                                    gender: selectedGender ?? '',
                                    city: cityController.text,
                                  ),
                                );
                            context
                                .read<AuthenticationBloc>()
                                .stream
                                .listen((authState) {
                              if (authState is AuthUserCacheFound) {
                                setState(() {
                                  editMode = false;
                                });
                              }
                            });
                          }
                        });
                      }),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  BorderlessListTile(
                      label: 'Full Name',
                      value: '${user.firstName ?? ''} ${user.lastName ?? ''}'),
                  BorderlessListTile(label: 'Email', value: user.email ?? ''),
                  BorderlessListTile(
                      label: 'Phone', value: user.phoneNumber ?? ''),
                  BorderlessListTile(
                      label: 'Address',
                      value: '${user.address ?? ''}, ${user.city ?? ''}'),
                  BorderlessListTile(label: 'Gender', value: user.gender ?? ''),
                ],
              ),
        SizedBox(height: 20),
        // Action Buttons
        InkWell(
          onTap: () {
            setState(() {
              changePassword = !changePassword;
            });
          },
          child: Row(
            children: [
              iconButton(context, icon: "assets/icons/lock-closed.svg"),
              const SizedBox(width: 10),
              Text(
                changePassword ? 'Cancel' : 'Change Password',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        changePassword
            ? Form(
                child: Column(
                  children: [
                    CustomTextFieldWidget(
                      label: "Current Password",
                      hint: "*****",
                      isPassword: true,
                      controller: currentPassword,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFieldWidget(
                      label: "New Password",
                      hint: "*****",
                      isPassword: true,
                      controller: newPassword,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFieldWidget(
                      label: "Confirm New Password",
                      hint: "*****",
                      isPassword: true,
                      controller: newPasswordConfirmation,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: BlocBuilder<AuthenticationBloc,
                          AuthenticationBlocState>(builder: (context, state) {
                        return outlinedButton(context,
                            text: "Change Password",
                            height: 60,
                            // width: 300,
                            isOulined: false,
                            isLoading: state is AuthenticationLoading,
                            color: primaryOrange, onPressed: () {
                          print('printed');

                          context.read<AuthenticationBloc>().add(
                                AuthenticationChangePassword(
                                    oldPassword: currentPassword.text,
                                    password: newPassword.text,
                                    passwordConfirmation:
                                        newPasswordConfirmation.text),
                              );
                          context
                              .read<AuthenticationBloc>()
                              .stream
                              .listen((authState) {
                            if (authState is AuthUserCacheFound) {
                              setState(() {
                                changePassword = false;
                              });
                            }
                          });
                        });
                      }),
                    ),
                  ],
                ),
              )
            : Container(),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            BlocProvider.of<AuthenticationBloc>(context).add(LogOut());
            context.read<AuthenticationBloc>().stream.listen((authState) {
              if (authState is AuthenticationFailure) {
                context.router
                    .push(const HomeRoute()); // Use your home route name
              }
            });
          },
          child: Row(
            children: [
              iconButton(context, icon: "assets/icons/logout.svg"),
              const SizedBox(width: 10),
              const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class BorderlessListTile extends StatelessWidget {
  final String label;
  final String value;

  const BorderlessListTile({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1))),
      ),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(value),
      ),
    );
  }
}
