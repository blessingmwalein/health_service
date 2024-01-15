import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';
import 'package:health_service/ui/util/shared/strike_through_text.dart';

class AuthPageLayout extends StatefulWidget {
  const AuthPageLayout(
      {super.key,
      required this.child,
      required this.title,
      this.welcomeText = "",
      this.welcomeSubText = "",
      required this.hasSocial});

  final Widget child;
  final String title;
  final String welcomeText;
  final String welcomeSubText;
  final bool hasSocial;
  @override
  State<AuthPageLayout> createState() => _AuthPageLayoutState();
}

class _AuthPageLayoutState extends State<AuthPageLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //add logo here from asset

            const SizedBox(
              height: 100,
            ),
            Text(
              widget.welcomeText,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryPurple),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.welcomeSubText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: primaryPurple.withOpacity(0.4)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0, right:20, top:2),
              child: widget.child,
            ),
            widget.hasSocial
                ? Padding(
                    padding: const EdgeInsets.only(left:20, right:20, top:5),
                    child: Column(
                      children: [
                        const StrikeThroughTextField(
                          text: "OR",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        socialMediaButton(
                          context,
                          text: "Sign In with Google",
                          height: 60,
                          iconPath: "assets/icons/google.svg",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        socialMediaButton(
                          context,
                          text: "Sign In with Facebook",
                          height: 60,
                          iconPath: "assets/icons/facebook.svg",
                        )
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
