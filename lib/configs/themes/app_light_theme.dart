import 'package:flutter/material.dart';
import 'package:quizz_app/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xFF5A7D7C);
const Color primaryColorLight = Color(0xFFDADFF7);
const Color mainTextColorLight = Color(0xFF232C33);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      primaryColor: primaryLightColorLight,
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        fontFamily: "sans-serif",
        bodyColor: mainTextColorLight,
        displayColor: mainTextColorLight,
      ),
    );
  }
}
