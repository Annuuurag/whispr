import 'package:get/get.dart';
import 'package:whispr/Pages/Auth/AuthPage.dart';
import 'package:whispr/Pages/ChatPage/ChatPage.dart';
import 'package:whispr/Pages/HomePage/HomePage.dart';
import 'package:whispr/Pages/UserProfilePage/ProfilePage.dart';
import 'package:whispr/Pages/UserProfilePage/UpdateProfile.dart';

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

  /*GetPage(
    name: "/profilePage",
    page: () => UserProfilePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/updateProfilePage",

    page: () => UserUpdateProfile(),

    transition: Transition.rightToLeft,
  ),*/
];
