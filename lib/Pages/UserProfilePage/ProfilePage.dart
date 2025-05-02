import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whispr/Controller/AuthController.dart';
import 'package:whispr/Controller/ProfileController.dart';
import 'package:whispr/Pages/UserProfilePage/Widgets/UserInfo.dart';

//import 'package:flutter_svg/svg.dart';

//import 'package:whispr/Config/Images.dart';

import 'package:whispr/Pages/UserProfilePage/Widgets/UserInfo.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

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
            LoginUserInfo(),
            Spacer(),

            ElevatedButton(onPressed: () {
              authcontroller.logoutUser();
            }, child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
