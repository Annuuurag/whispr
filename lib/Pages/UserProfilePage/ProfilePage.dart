import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/AuthController.dart';
import 'package:whispr/Controller/ProfileController.dart';
import 'package:whispr/Model/UserModel.dart';
import 'package:whispr/Pages/UserProfilePage/Widgets/UserInfo.dart';

//import 'package:flutter_svg/svg.dart';

//import 'package:whispr/Config/Images.dart';

import 'package:whispr/Pages/UserProfilePage/Widgets/UserInfo.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    Authcontroller authcontroller = Get.put(Authcontroller());

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),

        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/updateProfilePage");
            },

            icon: Icon(Icons.edit),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: Column(
          children: [
            LoginUserInfo(
              profileImage: userModel.profileImage ?? AssetsImage.DefaultProfileUrl,
              userName: userModel.name ?? "User",
              userEmail: userModel.email ?? "",

            ),
            Spacer(),

            ElevatedButton(
              onPressed: () {
                authcontroller.logoutUser();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
