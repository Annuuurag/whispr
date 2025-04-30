import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whispr/Pages/Welcome/Widgets/PrimaryButton.dart';

class Loginform extends StatelessWidget {
  const Loginform({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.alternate_email_rounded),
          ),
        ),

        SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password_outlined),
          ),
        ),

        SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Primarybutton(
              ontap: (){
                Get.offAllNamed("/homePage");
              },
              btnName: "LOGIN", 
              icon: Icons.lock_open_outlined),
          ],
        ),
      ],
    );
  }
}
