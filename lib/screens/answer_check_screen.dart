import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/components/background_decoration.dart';
import 'package:quizz_app/components/content_area.dart';
import 'package:quizz_app/components/custom_app_bar.dart';
import 'package:quizz_app/configs/themes/custom_text_style.dart';
import 'package:quizz_app/controllers/questions_controller.dart';
import 'package:quizz_app/screens/result_screen.dart';

import '../components/questions/answer_card.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({super.key});

  static const String routeName = "/answer_check_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(
          () => Text(
              "Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}",
              style: appBarTS),
        ),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackgroundDecoration(
        child: Obx(() => Column(
              children: [
                Expanded(
                  child: ContentArea(
                      child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(children: [
                      Text(controller.currentQuestion.value!.question!),
                      const SizedBox(
                        height: 32.0,
                      ),
                      GetBuilder<QuestionsController>(
                          id: "answer_review_list",
                          builder: (_) {
                            return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, int index) {
                                  final answer = controller
                                      .currentQuestion.value!.answers![index];

                                  final selectedAnswer = controller
                                      .currentQuestion.value!.selectedAnswer;

                                  final correctAnswer = controller
                                      .currentQuestion.value!.correctAnswer;

                                  final String answerText =
                                      '${answer.identifier}. ${answer.answer}';

                                  if (correctAnswer == selectedAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    return CorrectAnswer(answer: answerText);
                                  } else if (selectedAnswer == null) {
                                    return NotAnswer(answer: answerText);
                                  } else if (correctAnswer != selectedAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    return WrongAnswer(answer: answerText);
                                  } else if (correctAnswer ==
                                      answer.identifier) {
                                    return CorrectAnswer(answer: answerText);
                                  }

                                  return AnswerCard(
                                    answer: answerText,
                                    onTap: () {},
                                    isSelected: false,
                                  );
                                },
                                separatorBuilder: (_, int index) {
                                  return const SizedBox(
                                    height: 10.0,
                                  );
                                },
                                itemCount: controller
                                    .currentQuestion.value!.answers!.length);
                          }),
                    ]),
                  )),
                ),
              ],
            )),
      ),
    );
  }
}
