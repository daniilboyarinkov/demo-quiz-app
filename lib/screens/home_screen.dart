import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:quizz_app/components/app_circle_button.dart';
import 'package:quizz_app/components/question_card.dart';
import 'package:quizz_app/configs/themes/app_colors.dart';
import 'package:quizz_app/configs/themes/app_icons.dart';
import 'package:quizz_app/configs/themes/custom_text_style.dart';
import 'package:quizz_app/configs/themes/ui_parameters.dart';
import 'package:quizz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:quizz_app/controllers/zoom_drawer_controller.dart';
import 'package:quizz_app/screens/menu_screen.dart';

import '../components/content_area.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();

    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.1),
        body: GetBuilder<MyZoomDrawerController>(
          builder: (_) {
            return ZoomDrawer(
              controller: _.zoomDrawerController,
              borderRadius: 50.0,
              showShadow: true,
              angle: 0.0,
              style: DrawerStyle.defaultStyle,
              slideWidth: MediaQuery.of(context).size.width * 0.8,
              // openCurve: Curves.fastOutSlowIn,
              // closeCurve: Curves.bounceIn,
              menuScreen: const MyMenuScreen(),
              mainScreen: Container(
                decoration: BoxDecoration(gradient: mainGradient()),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(mobileScreenPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppCircleButton(
                              onTap: controller.toggleDrawer,
                              child: const Icon(AppIcons.menuLeft),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                children: [
                                  const Icon(AppIcons.peace),
                                  Text(
                                    "Hello friend",
                                    style: detailText.copyWith(
                                        color: onSurfaceTextColor),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "What do you want to learn today?",
                              style: headerText.copyWith(
                                  color: onSurfaceTextColor),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ContentArea(
                            addPadding: false,
                            child: Obx(
                              () => ListView.separated(
                                padding: UIParameters.mobileScreenPadding,
                                itemBuilder: (BuildContext context, int index) {
                                  return QuestionCard(
                                    model: questionPaperController
                                        .allPapers[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount:
                                    questionPaperController.allPapers.length,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
