import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/components/app_icon_text.dart';
import 'package:quizz_app/configs/themes/ui_parameters.dart';
import 'package:quizz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:quizz_app/models/question_paper_model.dart';

import '../configs/themes/app_icons.dart';
import '../configs/themes/custom_text_style.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({super.key, required this.model});

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double padding = 10.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: () {
          controller.navigateToQuestions(paper: model);
        },
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      child: SizedBox(
                        width: Get.width * 0.15,
                        height: Get.width * 0.15,
                        // child: FadeInImage(
                        //   image: NetworkImage(
                        //       _questionPaperController.allPapers[index].imageUrl!),
                        //   placeholder:
                        //       const AssetImage("assets/images/app_splash_logo.png"),
                        // ),
                        child: CachedNetworkImage(
                          imageUrl: model.imageUrl!,
                          placeholder: ((context, url) => Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              )),
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/images/app_splash_logo.png"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title ?? "No title",
                          style: cardTitles(context),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 15.0),
                          child: Text(model.description ?? "No description"),
                        ),
                        Row(
                          children: [
                            AppIconText(
                                icon: Icon(
                                  Icons.help_outline_sharp,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                ),
                                text: Text('${model.questionCount}',
                                    style: detailText.copyWith(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Theme.of(context).primaryColor))),
                            const SizedBox(
                              width: 15.0,
                            ),
                            AppIconText(
                                icon: Icon(
                                  Icons.timer,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                ),
                                text: Text(model.timeInMinutes(),
                                    style: detailText.copyWith(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Theme.of(context).primaryColor))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: -padding,
                  right: -padding,
                  child: GestureDetector(
                    child: Container(
                        // ignore: prefer_const_constructors
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(cardBorderRadius),
                            bottomRight: Radius.circular(cardBorderRadius),
                          ),
                        ),
                        child: const Icon(
                          AppIcons.trophyOutLine,
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
