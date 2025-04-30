import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Config/Strings.dart';

class Welcomefooterbutton extends StatelessWidget {
  const Welcomefooterbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: () {
        Get.offAllNamed("/authPage");
        return null;
      },
      sliderButtonIcon: SizedBox(
        height: 25,
        width: 25,
        child: SvgPicture.asset(AssetsImage.plugSVG, width: 25),
      ),
      text: WelcomePageString.slideToStart,
      textStyle: Theme.of(context).textTheme.labelLarge,
      submittedIcon: SvgPicture.asset(AssetsImage.connectSVG, width: 25),
      innerColor: Theme.of(context).colorScheme.primary,
      outerColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
