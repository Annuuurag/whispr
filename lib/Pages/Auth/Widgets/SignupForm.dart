import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:whispr/Pages/Welcome/Widgets/PrimaryButton.dart';

class Signupform extends StatelessWidget {
  const Signupform({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        TextField(
          decoration: InputDecoration(
            hintText: "Full Name",
            prefixIcon: Icon(Icons.person_rounded),
          ),
        ),

        SizedBox(height: 30),
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
              ontap: (){},
              btnName: "SIGNUP", 
              icon: Icons.lock_open_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
