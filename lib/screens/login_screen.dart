import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quizz_app/components/main_button.dart';
import 'package:quizz_app/configs/themes/app_colors.dart';
import 'package:quizz_app/controllers/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/app_splash_logo.png",
            // width: 200,
            // height: 200,
          ),
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Text("This is a study quiz app.",
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),
          ),
          MainButton(
            onTap: () {
              controller.signInWithGoogle();
            },
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: SvgPicture.asset("assets/icons/google.svg")),
                Center(
                  child: Text(
                    "Sign in with Google",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
