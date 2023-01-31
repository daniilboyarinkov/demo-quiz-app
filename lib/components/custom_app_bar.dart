import 'package:flutter/material.dart';
import 'package:quizz_app/components/app_circle_button.dart';
import 'package:quizz_app/configs/themes/app_colors.dart';
import 'package:quizz_app/configs/themes/custom_text_style.dart';
import 'package:quizz_app/configs/themes/ui_parameters.dart';

import '../configs/themes/app_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title = "",
      this.titleWidget,
      this.showActionIcon = false,
      this.onMenuActionTap,
      this.leading});

  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mobileScreenPadding,
            vertical: mobileScreenPadding,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: titleWidget == null
                    ? Center(
                        child: Text(
                          title,
                          style: appBarTS,
                        ),
                      )
                    : Center(child: titleWidget),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leading ??
                      Transform.translate(
                        offset: const Offset(-14, 0),
                        child: const BackButton(),
                      ),
                  if (showActionIcon)
                    Transform.translate(
                      offset: const Offset(10, 0),
                      child: AppCircleButton(
                        onTap: onMenuActionTap,
                        child: const Icon(AppIcons.menu),
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
