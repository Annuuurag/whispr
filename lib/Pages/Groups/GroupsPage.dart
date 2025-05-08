import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/GroupController.dart';
import 'package:whispr/Pages/GroupChat/GroupChat.dart';
import 'package:whispr/Pages/HomePage/Widget/ChatTile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Obx(
      () => ListView(
        children:
            groupController.groupList
                .map(
                  (group) => InkWell(
                    onTap: () {
                      Get.to(GroupChatPage(groupModel: group));
                    },
                    child: ChatTile(
                      name: group.name!,
                      imageUrl:
                          group.profileUrl == ""
                              ? AssetsImage.DefaultProfileUrl
                              : group.profileUrl!,
                      lastChat: "Group Created",
                      lastTime: "Just Now",
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
