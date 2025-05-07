import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/ChatController.dart';
import 'package:whispr/Controller/ContactController.dart';
import 'package:whispr/Controller/ProfileController.dart';
import 'package:whispr/Pages/ChatPage/ChatPage.dart';
import 'package:whispr/Pages/ContactPage/Widgets/ContactSearch.dart';
import 'package:whispr/Pages/ContactPage/Widgets/NewContactTile.dart';
import 'package:whispr/Pages/Groups/NewGroup/NewGroup.dart';
import 'package:whispr/Pages/HomePage/Widget/ChatTile.dart';

class Contactpage extends StatelessWidget {
  const Contactpage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    Contactcontroller contactController = Get.put(Contactcontroller());
    Chatcontroller chatController = Get.put(Chatcontroller());
    Profilecontroller profileController = Get.put(Profilecontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Contact"),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon:
                  isSearchEnable.value ? Icon(Icons.close) : Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Obx(() => isSearchEnable.value ? Contactsearch() : SizedBox()),
            SizedBox(height: 10),
            Newcontacttile(
              btnName: "New Contact",
              icon: Icons.person_add,
              ontap: () {},
            ),
            SizedBox(height: 10),
            Newcontacttile(
              btnName: "New Group",
              icon: Icons.group_add,
              ontap: () {
                Get.to(NewGroup());
              },
            ),
            SizedBox(height: 10),
            Row(children: [Text("Contacts on Whispr")]),
            SizedBox(height: 10),
            Obx(
              () => Column(
                children:
                    contactController.userList
                        .map(
                          (e) => InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Get.to(ChatPage(userModel: e));
                            },
                            child: ChatTile(
                              imageUrl:
                                  e.profileImage ??
                                  AssetsImage.DefaultProfileUrl,
                              name: e.name ?? "User",
                              lastChat: e.about ?? "Messages are shown here",
                              lastTime:
                                  e.email ==
                                          profileController.currentUser.value.email
                                      ? "You"
                                      : "",
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
