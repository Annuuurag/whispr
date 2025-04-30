import 'package:flutter/material.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Pages/HomePage/Widget/ChatTile.dart';
//import 'package:whispr/Config/Images.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Ayushman Bordoloi",
          lastChat: "Messages are shown here",
          lastTime: "08:55 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Anurag Rajbonshi",
          lastChat: "Messages are shown here",
          lastTime: "09:23 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Ayushman Bordoloi",
          lastChat: "Messages are shown here",
          lastTime: "08:55 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Anurag Rajbonshi",
          lastChat: "Messages are shown here",
          lastTime: "09:23 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Ayushman Bordoloi",
          lastChat: "Messages are shown here",
          lastTime: "08:55 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Anurag Rajbonshi",
          lastChat: "Messages are shown here",
          lastTime: "09:23 PM",
        ),
      ],
    );
  }
}