import 'package:flutter/material.dart';
import 'package:quizz_app/controllers/question_paper/data_uploader.dart';
import 'package:get/get.dart';
import 'package:quizz_app/firebase_ref/loading_status.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  final DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(
            controller.loadingStatus.value == LoadingStatus.completed
                ? "completed"
                : "uploading")),
      ),
    );
  }
}
