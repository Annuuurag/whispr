import 'package:flutter/material.dart';
import 'package:whispr/Pages/Welcome/Widgets/WelcomeBody.dart';
import 'package:whispr/Pages/Welcome/Widgets/WelcomeFooterButton.dart';
import 'package:whispr/Pages/Welcome/Widgets/WelcomeHeading.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Welcomeheading(), WelcomeBody(), Welcomefooterbutton()],
          ),
        ),
      ),
    );
  }
}
