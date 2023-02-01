import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/configs/themes/app_colors.dart';
import 'package:quizz_app/configs/themes/app_dark_theme.dart';
import 'package:quizz_app/configs/themes/ui_parameters.dart';
import 'package:quizz_app/controllers/zoom_drawer_controller.dart';

import '../configs/constants.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: mainGradient(),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(cardBorderRadius),
              topRight: Radius.circular(cardBorderRadius))),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor)),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toggleDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => controller.user.value == null
                            ? CircleAvatar(
                                radius: 32.0,
                                backgroundColor: Colors.white,
                                child: Text(
                                  'UN',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                              )
                            : CircleAvatar(
                                radius: 32.0,
                                backgroundImage: NetworkImage(
                                    controller.user.value!.photoURL ??
                                        defaultProfilePicture),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Obx(
                      () => controller.user.value == null
                          ? const SizedBox()
                          : Text(
                              controller.user.value!.displayName ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: onSurfaceTextColor),
                            ),
                    ),
                    const Spacer(flex: 1),
                    _DrawButton(
                      label: "Github",
                      icon: Icons.web,
                      onPressed: () => controller.webSite(),
                    ),
                    _DrawButton(
                      label: "Email",
                      icon: Icons.email,
                      onPressed: () => controller.email(),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    _DrawButton(
                      label: "выйти",
                      icon: Icons.logout,
                      onPressed: () => controller.signOut(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  const _DrawButton({required this.label, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed, icon: Icon(icon, size: 15), label: Text(label));
  }
}
