import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/configs/themes/app_dark_theme.dart';
import 'package:quizz_app/configs/themes/app_light_theme.dart';
import 'package:quizz_app/configs/themes/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Color(0xFF3ac3cb);
const Color wrongAnswerColor = Color(0xFF851817);
const Color notAnswerColor = Color(0xFF2a3c65);

LinearGradient mainGradient() {
  final colors = UIParameters.isDarkMode()
      ? [
          primaryDarkColorDark,
          primaryColorDark,
        ]
      : [
          primaryLightColorLight,
          primaryColorLight,
        ];

  return LinearGradient(
      begin: Alignment.topLeft, end: Alignment.bottomRight, colors: colors);
}

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ? const Color(0xFF2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);

Color answerSelectedColor() => UIParameters.isDarkMode()
    ? Theme.of(Get.context!).cardColor.withOpacity(0.5)
    : Theme.of(Get.context!).primaryColor;

Color answerBorerColor() => UIParameters.isDarkMode()
    ? const Color.fromARGB(255, 20, 26, 158)
    : const Color.fromARGB(255, 221, 221, 221);
