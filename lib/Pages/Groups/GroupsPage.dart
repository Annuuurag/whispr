import 'package:flutter/material.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Pages/HomePage/Widget/ChatTile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(imageUrl: AssetsImage.DefaultProfileUrl, name: "Study Group", lastChat: "Last Message", lastTime: "Last Time"),
      ],
    );
  }
}