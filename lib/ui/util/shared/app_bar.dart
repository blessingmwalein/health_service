import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_service/bloc/auth/authentication_bloc.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';
import 'package:health_service/ui/util/shared/user_avatar.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthUserCache()); // Replace with your authentication event
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        InkWell(
          onTap: () {},
          child: appBarButton(
            context,
            icon: "assets/icons/bell-outlined.svg",
          ),
        ),
        const SizedBox(width: 10),
      ],
      leading: Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: InkWell(
          onTap: () {
            context.router.push(const ProfileRoute());
          },
          child: userAvatar(context),
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Location",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryBlack.withOpacity(0.5),
              fontSize: 15,
            ),
          ),
          Row(
            children: [
              myIcon(
                path: "assets/icons/location-marker.svg",
                iconColor: primaryBlue,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 5),
              Row(
                children: [
                  BlocBuilder<AuthenticationBloc, AuthenticationBlocState>(
                    builder: (context, state) {
                      if (state is AuthUserCacheFound) {
                        return Text(
                          state.userModel.address ?? "No address found",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: primaryBlack.withOpacity(0.8),
                          ),
                        );
                      } else {
                        return Text(
                          "Logged In As Guest",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: primaryBlack.withOpacity(0.8),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 5),
                  myIcon(
                    path: "assets/icons/chevron-down.svg",
                    iconColor: primaryBlack,
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
