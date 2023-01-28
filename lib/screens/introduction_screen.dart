import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quizz_app/components/app_circle_button.dart';

import '../configs/themes/app_colors.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  size: 65,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      color: onSurfaceTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                    "This is just a test quiz app aimed on learning such a fascinating thing as Flutter. I pretty enjoy you using it. Hope it's not the worst thing you saw in your life."),
                const SizedBox(
                  height: 40.0,
                ),
                AppCircleButton(
                  onTap: () => Get.offAndToNamed("/home"),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 35,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
