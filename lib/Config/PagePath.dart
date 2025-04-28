import 'package:get/get.dart';
import 'package:whispr/Pages/Auth/AuthPage.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
    page: () => Authpage(),
    transition: Transition.rightToLeft,
  ),
];
