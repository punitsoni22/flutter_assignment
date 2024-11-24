import 'package:get/get.dart';
import 'package:flutter_assignment/pages/home_page.dart';

class AppRoutes {
  static const String home = '/';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      transition: Transition.fadeIn, // Optional: Define transitions
    ),
  ];
}
