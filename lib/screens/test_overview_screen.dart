import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/components/background_decoration.dart';
import 'package:quizz_app/components/content_area.dart';
import 'package:quizz_app/components/custom_app_bar.dart';
import 'package:quizz_app/components/main_button.dart';
import 'package:quizz_app/components/question_number_card.dart';
import 'package:quizz_app/components/questions/answer_card.dart';
import 'package:quizz_app/components/questions/countdown_timer.dart';
import 'package:quizz_app/configs/themes/custom_text_style.dart';
import 'package:quizz_app/configs/themes/ui_parameters.dart';
import 'package:quizz_app/controllers/questions_controller.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});

  static const String routeName = "/test_overview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
        child: Column(children: [
          Expanded(
            child: ContentArea(
                child: Column(
              children: [
                Row(
                  children: [
                    CountdownTimer(
                      time: "",
                      color: UIParameters.isDarkMode()
                          ? Theme.of(context).textTheme.bodyText1!.color
                          : Theme.of(context).primaryColor,
                    ),
                    Obx(
                      () => Text(
                        "${controller.time} Remaining",
                        style: countdownTimerTS(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.allQuestions.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width ~/ 75,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (_, index) {
                      AnswerStatus? answerStatus;
                      if (controller.allQuestions[index].selectedAnswer !=
                          null) {
                        answerStatus = AnswerStatus.answered;
                      }
                      return QuestionNumberCard(
                        index: index + 1,
                        status: answerStatus,
                        onTap: () => controller.jumpToQuestion(index),
                      );
                    },
                  ),
                ),
              ],
            )),
          ),
          ColoredBox(
            color: Theme.of(context).secondaryHeaderColor,
            child: Padding(
              padding: UIParameters.mobileScreenPadding,
              child: MainButton(
                onTap: () {
                  controller.complete();
                },
                title: "Complete",
              ),
            ),
          )
        ]),
      ),
    );
  }
}
