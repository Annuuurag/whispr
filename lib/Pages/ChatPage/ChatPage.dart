import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/ChatController.dart';
import 'package:whispr/Controller/ProfileController.dart';
import 'package:whispr/Model/UserModel.dart';
import 'package:whispr/Pages/ChatPage/Widgets/ChatBubble.dart';
import 'package:whispr/Pages/UserProfilePage/ProfilePage.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    Chatcontroller chatController = Get.put(Chatcontroller());
    TextEditingController messageController = TextEditingController();
    Profilecontroller profileController = Get.put(Profilecontroller());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () async {
            Get.to(UserProfilePage(
              userModel: userModel,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(AssetsImage.boyPic),
          ),
        ),
        title: InkWell(
          onTap: () async {
            Get.to(UserProfilePage(
              userModel: userModel,
            ));
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name ?? "User",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text("Online", style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),

          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(AssetsImage.chatMicSvg, width: 25),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  filled: false,
                  hintText: "Type your message...",
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(AssetsImage.chatGallerySvg, width: 25),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                if (messageController.text.isNotEmpty) {
                  chatController.sendMessage(
                    userModel.id!,
                    messageController.text, userModel
                  );
                  messageController.clear();
                }
              },
              child: Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(AssetsImage.chatSendSvg, width: 25),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 70,
          left: 10,
          right: 10,
          top: 10,
        ),
        child: StreamBuilder(
          stream: chatController.getMessages(userModel.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            if (snapshot.data == null) {
              return Center(child: Text("No Messages"));
            } else {
              return ListView.builder(
                reverse: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  DateTime timestamp = DateTime.parse(
                    snapshot.data![index].timestamp!,
                  );
                  String formattedTime = DateFormat(
                    'hh:mm a',
                  ).format(timestamp);
                  return ChatBubble(
                    message: snapshot.data![index].message!,
                    imageUrl: snapshot.data![index].imageUrl ?? "",
                    isComming:snapshot.data![index].receiverId ==
                        profileController.currentUser.value.id,
                    status: "read",
                    time: formattedTime,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
