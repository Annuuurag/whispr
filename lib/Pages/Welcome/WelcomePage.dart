import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Config/Strings.dart';
import 'package:whispr/Pages/Welcome/Widgets/WelcomeBody.dart';
import 'package:whispr/Pages/Welcome/Widgets/WelcomeFooterButton.dart';
import 'package:whispr/Pages/Welcome/Widgets/WelcomeHeading.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
