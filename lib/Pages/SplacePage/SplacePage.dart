import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/SplaceController.dart';

class SplacePage extends StatelessWidget {
  const SplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    Splacecontroller splaceController = Get.put(Splacecontroller());
    return Scaffold(
      body: Center(child: SvgPicture.asset(AssetsImage.appIconSVG)),
    );
  }
}
