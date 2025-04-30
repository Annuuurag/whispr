import 'package:get/get.dart';
import 'package:whispr/Pages/Auth/AuthPage.dart';
import 'package:whispr/Pages/ChatPage/ChatPage.dart';
import 'package:whispr/Pages/HomePage/HomePage.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
    page: () => Authpage(),
    transition: Transition.rightToLeft,
  ),

  GetPage(
    name: "/homePage",
    page: () => HomePage(),
    transition: Transition.rightToLeft,
  ),

  GetPage(
    name: "/chatPage",
    page: () => ChatPage(),
    transition: Transition.rightToLeft,
  ),
];
