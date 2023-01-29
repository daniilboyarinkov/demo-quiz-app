import 'package:get/get.dart';
import 'package:quizz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:quizz_app/controllers/zoom_drawer_controller.dart';
import 'package:quizz_app/screens/home_screen.dart';
import 'package:quizz_app/screens/splash_screen.dart';

import '../screens/introduction_screen.dart';
import '../screens/login_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/introduction", page: () => const IntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: "/login", page: () => const LoginScreen()),
      ];
}
