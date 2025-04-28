import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Config/Strings.dart';

class Welcomeheading extends StatelessWidget {
  const Welcomeheading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsImage.appIconSVG,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
    ],);
  }
}