import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whispr/Controller/AuthController.dart';
//import 'package:get/get.dart';
import 'package:whispr/Pages/Welcome/Widgets/PrimaryButton.dart';

class Signupform extends StatelessWidget {
  const Signupform({super.key});

  @override
  Widget build(BuildContext context) {
    Authcontroller authcontroller = Get.put(Authcontroller());

    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Column(
      children: [
        const SizedBox(height: 50),
        TextField(
          controller: name,
          decoration: const InputDecoration(
            hintText: "Full Name",
            prefixIcon: Icon(Icons.person_rounded),
          ),
        ),

        const SizedBox(height: 30),
        TextField(
          controller: email,
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.alternate_email_rounded),
          ),
        ),

        const SizedBox(height: 30),
        TextField(
          controller: password,
          decoration: const InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password_outlined),
          ),
        ),

        const SizedBox(height: 60),
        Obx(() =>
        authcontroller.isLoading.value ? const CircularProgressIndicator()
        : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Primarybutton(
                  ontap: () {
                    authcontroller.createUser(email.text, password.text);
                  },
                  btnName: "SIGNUP",
                  icon: Icons.lock_open_outlined,
                ),
              ],
            ),
        ),
      ],
    );
  }
}
