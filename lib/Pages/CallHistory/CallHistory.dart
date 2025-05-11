import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/ChatController.dart';
import 'package:whispr/Pages/HomePage/Widget/ChatTile.dart';

class Callhistory extends StatelessWidget {
  const Callhistory({super.key});

  @override
  Widget build(BuildContext context) {
    Chatcontroller chatcontroller = Get.put(Chatcontroller());
    return StreamBuilder(
      stream: chatcontroller.getCalls(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ChatTile(
                imageUrl:
                    snapshot.data![index].callerPic ??
                    AssetsImage.DefaultProfileUrl,
                name: snapshot.data![index].receiverName ?? "...",
                lastChat: snapshot.data![index].type ?? "...",
                lastTime: snapshot.data![index].time ?? "...",
              );
            },
          );
        } else {
          return Center(
            child: Container(
              height: 200,
              width: 200,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
