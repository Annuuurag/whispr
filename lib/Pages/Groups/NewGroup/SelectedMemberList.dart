import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/GroupController.dart';

class SelectedMembers extends StatelessWidget {
  const SelectedMembers({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Obx(
              () => Row(
                children:
                    groupController.groupMembers
                        .map(
                          (e) => Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        e.profileImage ??
                                        AssetsImage.DefaultProfileUrl,
                                    fit: BoxFit.cover,
                                    placeholder:
                                        (context, url) =>
                                            CircularProgressIndicator(),
                                    errorWidget:
                                        (context, url, error) =>
                                            Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: InkWell(
                                  onTap: () {
                                    groupController.groupMembers.remove(e);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              ),
            );
  }
}