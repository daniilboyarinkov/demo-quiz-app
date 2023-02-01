import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/components/app_circle_button.dart';

import '../configs/constants.dart';
import '../configs/themes/app_colors.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RxDouble opacityLevel = (0.0).obs;

    Future<void> animateOpacity() async {
      await Future.delayed(const Duration(milliseconds: 3000));
      opacityLevel.value = 1.0;
    }

    animateOpacity();

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.all_inclusive_rounded,
                size: 65,
              ),
              const SizedBox(
                height: 40.0,
              ),
              // ignore: prefer_const_constructors
              Obx(() => AnimatedOpacity(
                    duration: const Duration(seconds: 7),
                    opacity: opacityLevel.value,
                    child: const Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: onSurfaceTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                        introTitleText),
                  )),
              const SizedBox(
                height: 40.0,
              ),
              AppCircleButton(
                onTap: () => Get.offAndToNamed("/home"),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
