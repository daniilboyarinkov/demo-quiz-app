import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/configs/themes/app_colors.dart';

class MainButton extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  final bool enabled;
  final Widget? child;
  final Color? color;

  const MainButton(
      {super.key,
      required this.onTap,
      this.title,
      this.enabled = true,
      this.child,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        width: double.maxFinite,
        child: InkWell(
          onTap: enabled ? onTap : null,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color ?? Theme.of(context).cardColor,
            ),
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child ??
                  Center(
                    child: Text(
                      title ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode
                            ? onSurfaceTextColor
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
