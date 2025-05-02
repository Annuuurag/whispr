import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whispr/Controller/AuthController.dart';
import 'package:whispr/Pages/Widgets/PrimaryButton.dart';

class Loginform extends StatelessWidget {
  const Loginform({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    Authcontroller authcontroller = Get.put(Authcontroller());

    return Column(
      children: [
        const SizedBox(height: 50),
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
                    authcontroller.login(email.text, password.text);
                    //Get.offAllNamed("/homePage");
                  },
                  btnName: "LOGIN",
                  icon: Icons.lock_open_outlined,
                ),
              ],
            ),
        )
      ],
    );
  }
}
