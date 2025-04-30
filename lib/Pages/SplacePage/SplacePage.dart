import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/SplaceController.dart';

class Splacepage extends StatelessWidget {
  const Splacepage({super.key});

  @override
  Widget build(BuildContext context) {
    Splacecontroller splacecontroller = Get.put(Splacecontroller());
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AssetsImage.appIconSVG,),
      )
    );
  }
}
