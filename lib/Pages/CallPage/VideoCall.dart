import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whispr/Config/Strings.dart';
import 'package:whispr/Controller/ChatController.dart';
import 'package:whispr/Controller/ProfileController.dart';
import 'package:whispr/Model/UserModel.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class Videocallpage extends StatelessWidget {
  final UserModel target;
  const Videocallpage({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
    Chatcontroller chatcontroller = Get.put(Chatcontroller());
    var callId = chatcontroller.getRoomId(target.id!);
    return ZegoUIKitPrebuiltCall(
      appID: ZegoCloudConfig.appId, // your AppID,
      appSign: ZegoCloudConfig.appSign,
      userID: profilecontroller.currentUser.value.id ?? "root",
      userName: profilecontroller.currentUser.value.name ?? "root",
      callID: callId,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
