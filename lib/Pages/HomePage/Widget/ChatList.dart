import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/ContactController.dart';
import 'package:whispr/Pages/ChatPage/ChatPage.dart';
import 'package:whispr/Pages/HomePage/Widget/ChatTile.dart';
//import 'package:whispr/Config/Images.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    Contactcontroller contactController = Get.put(Contactcontroller());
    return RefreshIndicator(
      child: Obx(
        () => ListView(
          children:
              contactController.chatRoomList
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        Get.to(ChatPage(userModel: e.receiver!));
                      },
                      child: ChatTile(
                        imageUrl:
                            e.receiver!.profileImage ??
                            AssetsImage.DefaultProfileUrl,
                        name: e.receiver!.name ?? "User Name",
                        lastChat: e.lastMessage ?? "No message",
                        lastTime: e.lastMessageTimeStamp ?? "",
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
      onRefresh: () {
        return contactController.getChatRoomList();
      },
    );
  }
}
