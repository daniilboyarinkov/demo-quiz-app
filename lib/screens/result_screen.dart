import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quizz_app/components/background_decoration.dart';
import 'package:quizz_app/components/content_area.dart';
import 'package:quizz_app/components/custom_app_bar.dart';
import 'package:quizz_app/components/question_number_card.dart';
import 'package:quizz_app/components/questions/answer_card.dart';
import 'package:quizz_app/configs/themes/custom_text_style.dart';
import 'package:quizz_app/configs/themes/ui_parameters.dart';
import 'package:quizz_app/controllers/questions_controller_ext.dart';
import 'package:quizz_app/screens/answer_check_screen.dart';

import '../components/main_button.dart';
import '../controllers/questions_controller.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});

  static const String routeName = "/result_screen";

  @override
  Widget build(BuildContext context) {
    Color textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: const SizedBox(
          height: 80,
        ),
        title: controller.correctAnsweredQuestions,
      ),
      body: BackgroundDecoration(
        child: Column(children: [
          Expanded(
            child: ContentArea(
              child: Column(
                children: [
                  SvgPicture.asset("assets/images/bulb.svg"),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                    child: Text(
                      "Congratulations",
                      style: headerText.copyWith(color: textColor),
                    ),
                  ),
                  Text("You have ${controller.points} points.",
                      style: TextStyle(color: textColor)),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Text(
                    "Tap below question numbers to view correct answers",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: controller.allQuestions.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Get.width ~/ 0.75,
                          childAspectRatio: 1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (_, index) {
                          final question = controller.allQuestions[index];

                          AnswerStatus status = AnswerStatus.notAnswered;

                          final selectedAnswer = question.selectedAnswer;
                          final correctAnswer = question.correctAnswer;

                          if (selectedAnswer == correctAnswer) {
                            status = AnswerStatus.correct;
                          } else if (question.selectedAnswer == null) {
                            status = AnswerStatus.wrong;
                          } else {
                            status = AnswerStatus.wrong;
                          }

                          return QuestionNumberCard(
                              index: index,
                              status: status,
                              onTap: () {
                                controller.jumpToQuestion(index,
                                    isGoBack: false);
                                Get.toNamed(AnswerCheckScreen.routeName);
                              });
                        }),
                  ),
                ],
              ),
            ),
          ),
          ColoredBox(
            color: Theme.of(context).secondaryHeaderColor,
            child: Padding(
              padding: UIParameters.mobileScreenPadding,
              child: Row(children: [
                Expanded(
                  child: MainButton(
                    onTap: () {
                      controller.tryAgain();
                    },
                    color: Colors.blueGrey,
                    title: "Try again",
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: MainButton(
                    onTap: () {
                      controller.saveTestResults();
                    },
                    color: Colors.blueGrey,
                    title: "Go home",
                  ),
                ),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
