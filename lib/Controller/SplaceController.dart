import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Splacecontroller extends GetxController {
  final auth = FirebaseAuth.instance;


  void onInit() async {
    super.onInit();
    await splaceHandle();
  }


  Future<void> splaceHandle() async {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed("/homePage");
    });
    if (auth.currentUser == null) {
      Get.offAllNamed("/authPage");
    }/*else{
      Get.offAllNamed("/homePage");
    }*/ //theres an exception so i comment it
  }
}
