import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quizz_app/controllers/auth_controller.dart';
import 'package:quizz_app/firebase_ref/references.dart';
import 'package:quizz_app/models/question_paper_model.dart';
import 'package:quizz_app/screens/question_screen.dart';
import 'package:quizz_app/services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    // Do we really need this?
    // List<String> imgName = [
    //   "biology",
    //   "chemistry",
    //   "maths",
    //   "physics",
    // ];

    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();

      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FireBaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
        // print(imgUrl);
        // allPaperImages.add(imgUrl!);
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController authController = Get.find();
    if (authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        Get.toNamed(QuestionsScreen.routeName,
            arguments: paper, preventDuplicates: false);
      } else {
        Get.toNamed(QuestionsScreen.routeName, arguments: paper);
      }
    } else {
      authController.showLoginAlertDialogue();
    }
  }
}
