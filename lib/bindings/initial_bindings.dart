import 'package:get/get.dart';
import 'package:quizz_app/controllers/auth_controller.dart';
import 'package:quizz_app/controllers/theme_controller.dart';

import '../services/firebase_storage_service.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    // uncomment in order to upload new papers
    //Get.put(PapersDataUploader());
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => FireBaseStorageService());
  }
}
