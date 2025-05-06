import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/ContactController.dart';
import 'package:whispr/Controller/ProfileController.dart';
import 'package:whispr/Pages/ChatPage/ChatPage.dart';
import 'package:whispr/Pages/HomePage/Widget/ChatTile.dart';
//import 'package:whispr/Config/Images.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    Contactcontroller contactController = Get.put(Contactcontroller());
    Profilecontroller profileController = Get.put(Profilecontroller());
    return RefreshIndicator(
      child: Obx(
        () => ListView(
          children:
              contactController.chatRoomList
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        Get.to(
                          ChatPage(
                            userModel:
                                (e.receiver!.id ==
                                        profileController.currentUser.value.id
                                    ? e.sender
                                    : e.receiver)!,
                          ),
                        );
                      },
                      child: ChatTile(
                        imageUrl:
                            (e.receiver!.id == 
                                profileController.currentUser.value.id 
                                ? e.sender!.profileImage
                                : e.receiver!.profileImage) ??
                                AssetsImage.DefaultProfileUrl,
                        name: 
                            (e.receiver!.id == 
                            profileController.currentUser.value.id
                            ? e.sender!.name : e.receiver!.name)!,
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
