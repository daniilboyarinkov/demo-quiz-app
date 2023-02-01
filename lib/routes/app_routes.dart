import 'package:get/get.dart';
import 'package:quizz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:quizz_app/controllers/questions_controller.dart';
import 'package:quizz_app/controllers/zoom_drawer_controller.dart';
import 'package:quizz_app/screens/answer_check_screen.dart';
import 'package:quizz_app/screens/home_screen.dart';
import 'package:quizz_app/screens/question_screen.dart';
import 'package:quizz_app/screens/result_screen.dart';
import 'package:quizz_app/screens/splash_screen.dart';
import 'package:quizz_app/screens/test_overview_screen.dart';

import '../screens/introduction_screen.dart';
import '../screens/login_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/introduction", page: () => const IntroductionScreen()),
        GetPage(
            name: HomeScreen.routeName,
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(
          name: TestOverviewScreen.routeName,
          page: () => const TestOverviewScreen(),
        ),
        GetPage(
          name: ResultScreen.routeName,
          page: () => const ResultScreen(),
          binding: BindingsBuilder(() {
            Get.put<QuestionsController>(QuestionsController());
          }),
        ),
        GetPage(
            name: AnswerCheckScreen.routeName,
            page: () => const AnswerCheckScreen()),
        GetPage(
          name: QuestionsScreen.routeName,
          page: () => const QuestionsScreen(),
          binding: BindingsBuilder(() {
            Get.put<QuestionsController>(QuestionsController());
          }),
        ),
      ];
}
