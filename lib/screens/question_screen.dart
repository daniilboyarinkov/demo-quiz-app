import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/components/background_decoration.dart';
import 'package:quizz_app/components/custom_app_bar.dart';
import 'package:quizz_app/components/main_button.dart';
import 'package:quizz_app/components/questions/answer_card.dart';
import 'package:quizz_app/components/questions/countdown_timer.dart';
import 'package:quizz_app/components/questions_placeholder.dart';
import 'package:quizz_app/configs/themes/app_colors.dart';
import 'package:quizz_app/configs/themes/custom_text_style.dart';
import 'package:quizz_app/configs/themes/ui_parameters.dart';
import 'package:quizz_app/controllers/questions_controller.dart';
import 'package:quizz_app/firebase_ref/loading_status.dart';
import 'package:quizz_app/screens/test_overview_screen.dart';

import '../components/content_area.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});

  static const String routeName = "/questions";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showActionIcon: true,
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(
                side: BorderSide(color: onSurfaceTextColor, width: 2)),
          ),
          child: Obx(
            () => CountdownTimer(
                time: controller.time.value, color: onSurfaceTextColor),
          ),
        ),
        titleWidget: Obx(
          () => Text(
            "Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
            style: appBarTS,
          ),
        ),
      ),
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            children: [
              if (controller.loadingStatus.value == LoadingStatus.loading)
                const Expanded(
                  child: ContentArea(
                    child: QuestionPlaceholder(),
                  ),
                ),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Column(children: [
                        Text(controller.currentQuestion.value!.question!,
                            style: questionTS),
                        GetBuilder<QuestionsController>(
                            id: "answers_list",
                            builder: (context) {
                              return ListView.separated(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 25.0),
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  final answer = controller
                                      .currentQuestion.value!.answers![index];

                                  return AnswerCard(
                                    answer:
                                        '${answer.identifier}. ${answer.answer}',
                                    onTap: () {
                                      controller
                                          .selectedAnswer(answer.identifier);
                                    },
                                    isSelected: answer.identifier ==
                                        controller.currentQuestion.value!
                                            .selectedAnswer,
                                  );
                                },
                                itemCount: controller
                                    .currentQuestion.value!.answers!.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(height: 10.0);
                                },
                              );
                            }),
                      ]),
                    ),
                  ),
                ),
              ColoredBox(
                color: Theme.of(context).secondaryHeaderColor,
                child: Padding(
                  padding: UIParameters.mobileScreenPadding,
                  child: Row(children: [
                    Visibility(
                      visible: controller.isFirstQuestion,
                      child: SizedBox(
                        width: 55,
                        height: 55,
                        child: MainButton(
                          onTap: () {
                            controller.previousQuestion();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Get.isDarkMode
                                ? onSurfaceTextColor
                                : Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Visibility(
                        visible: controller.loadingStatus.value ==
                            LoadingStatus.completed,
                        child: MainButton(
                          onTap: () {
                            controller.isLastQuestion
                                ? Get.toNamed(TestOverviewScreen.routeName)
                                : controller.nextQuestion();
                          },
                          title:
                              controller.isLastQuestion ? "Complete" : 'Next',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
