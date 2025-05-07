import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/ContactController.dart';
import 'package:whispr/Controller/GroupController.dart';
import 'package:whispr/Pages/Groups/NewGroup/GroupTitle.dart';
import 'package:whispr/Pages/Groups/NewGroup/SelectedMemberList.dart';
import 'package:whispr/Pages/HomePage/Widget/ChatTile.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    Contactcontroller contactController = Get.put(Contactcontroller());
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(title: Text("New Group")),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          backgroundColor:
              groupController.groupMembers.isEmpty
                  ? Colors.grey
                  : Theme.of(context).colorScheme.primary,
          onPressed: () {
            if (groupController.groupMembers.isEmpty) {
              Get.snackbar("Error", "Please select at least one member");
            } else {
              Get.to(GroupTitle());
            }
          },
          child: Icon(
            Icons.arrow_forward,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SelectedMembers(),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Contacts on Whishpr",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                stream: contactController.getContacts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }
                  if (snapshot.data == null) {
                    return const Center(child: Text("No Messages"));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            groupController.selectMember(snapshot.data![index]);
                          },
                          child: ChatTile(
                            imageUrl:
                                snapshot.data![index].profileImage ??
                                AssetsImage.DefaultProfileUrl,
                            name: snapshot.data![index].name!,
                            lastChat: snapshot.data![index].about ?? "",
                            lastTime: "",
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
