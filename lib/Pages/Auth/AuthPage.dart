import 'package:flutter/material.dart';
import 'package:whispr/Pages/Auth/Widgets/AuthPageBody.dart';
import 'package:whispr/Pages/Welcome/Widgets/WelcomeHeading.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),
                Welcomeheading(),
                SizedBox(height: 150),
                Authpagebody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
