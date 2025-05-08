import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/ChatController.dart';
import 'package:whispr/Controller/GroupController.dart';
import 'package:whispr/Controller/ImagePicker.dart';
import 'package:whispr/Model/GropupModel.dart';
import 'package:whispr/Model/UserModel.dart';
import 'package:whispr/Pages/ChatPage/Widgets/ImagePickerBottonSheet.dart';

class GroupTypeMessage extends StatelessWidget {
  final GroupModel groupModel;
  GroupTypeMessage({super.key, required this.groupModel});
  RxString message = "".obs;

  @override
  Widget build(BuildContext context) {
    //Chatcontroller chatController = Get.put(Chatcontroller());
    GroupController groupController = Get.put(GroupController());
    TextEditingController messageController = TextEditingController();
    Imagepickercontroller imagePickerController = Get.put(
      Imagepickercontroller(),
    );
    //RxString imagePath = "".obs;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              AssetsImage.chatEmoji,
              width: 25,
              color: Color.fromARGB(255, 153, 153, 153),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {
                message.value = value;
              },
              controller: messageController,
              decoration: const InputDecoration(
                filled: false,
                hintText: "Type your message...",
              ),
            ),
          ),
          SizedBox(width: 10),
          Obx(
            () =>
                groupController.selectedImagePath.value == ""
                    ? InkWell(
                      onTap: () {
                        ImagePickerBottomSheet(
                          context,
                          groupController.selectedImagePath,
                          imagePickerController,
                        );
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset(
                          AssetsImage.chatGallerySvg,
                          width: 25,
                        ),
                      ),
                    )
                    : SizedBox(),
          ),
          SizedBox(width: 10),
          Obx(
            () =>
                message.value != "" ||
                        groupController.selectedImagePath.value != ""
                    ? InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        groupController.sendGroupMessage(
                          messageController.text,
                          groupModel.id!,
                          "",
                        );
                        messageController.clear();
                        message.value = "";
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        child:
                            groupController.isloading.value
                                ? CircularProgressIndicator()
                                : SvgPicture.asset(
                                  AssetsImage.chatSendSvg,
                                  width: 25,
                                ),
                      ),
                    )
                    : Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        AssetsImage.chatMicSvg,
                        width: 25,
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
