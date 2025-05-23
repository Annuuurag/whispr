import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/GroupController.dart';
import 'package:whispr/Controller/ProfileController.dart';
import 'package:whispr/Model/UserModel.dart';

class GroupMembersInfo extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String userEmail;
  final String groupId;
  const GroupMembersInfo({
    super.key,
    required this.profileImage,
    required this.userName,
    required this.userEmail,
    required this.groupId,
  });

  @override
  Widget build(BuildContext context) {
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
    GroupController groupController = Get.put(GroupController());
    return Container(
      padding: EdgeInsets.all(20),

      //height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        color: Theme.of(context).colorScheme.primaryContainer,
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: profileImage,
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) => CircularProgressIndicator(),
                          errorWidget:
                              (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      userEmail,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    InkWell(
                      onTap: () {
                        var newMember = UserModel(
                          email: "test1@gmail.com",
                          name: "test user1",
                          profileImage: "",
                          role: "admin",
                        );
                        groupController.addMemberToGroup(groupId, newMember);
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AssetsImage.groupAddUser,
                              width: 25,
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Add",
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      height: 50,

                      padding: EdgeInsets.all(15),

                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,

                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssetsImage.profileAudioCall,

                            width: 25,

                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                          ),

                          SizedBox(width: 10),

                          Text(
                            "Call",

                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 50,

                      padding: EdgeInsets.all(15),

                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,

                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssetsImage.profileVideoCall,

                            width: 25,

                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                          ),

                          SizedBox(width: 10),

                          Text(
                            "Video",

                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
