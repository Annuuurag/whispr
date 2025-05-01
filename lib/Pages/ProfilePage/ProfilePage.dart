import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:whispr/Config/Images.dart';
import 'package:whispr/Pages/ProfilePage/Widgets/UserInfo.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed("/updateProfilePage");
          }, 
          icon: Icon(
            Icons.edit,
          ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            LoginUserInfo(),
            Spacer(),
            ElevatedButton(
              onPressed: (){}, 
              child: Text(
                "Logout"
              ),
            )
          ],
        ),
      ),
    );
  }
}