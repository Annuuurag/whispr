import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Model/GropupModel.dart';
import 'package:whispr/Pages/GroupInfo/GroupMembersInfo.dart';
import 'package:whispr/Pages/HomePage/Widget/ChatTile.dart';
import 'package:whispr/Pages/UserProfilePage/Widgets/UserInfo.dart';

class Groupinfo extends StatelessWidget {
  final GroupModel groupModel;
  const Groupinfo({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupModel.name!),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            GroupMembersInfo(
              groupId: groupModel.id!,
              profileImage:
                  groupModel.profileUrl == ""
                      ? AssetsImage.DefaultProfileUrl
                      : groupModel.profileUrl!,
              userName: groupModel.name!,
              userEmail: groupModel.description ?? "No Description Available",
            ),
            SizedBox(height: 20),
            Text("Members", style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: 10),
            Column(
              children:
                  groupModel.members!
                      .map(
                        (member) => ChatTile(
                          imageUrl:
                              member.profileImage ??
                              AssetsImage.DefaultProfileUrl,
                          name: member.name!,
                          lastChat: member.email!,
                          lastTime: member.role == "admin" ? "Admin" : "User",
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
