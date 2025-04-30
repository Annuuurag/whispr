import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Pages/ChatPage/Widgets/ChatBubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(AssetsImage.boyPic),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ayushman Bordoloi",
              style: Theme.of(context).textTheme.bodyLarge,  
            ),
            Text(
              "Online", 
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.phone
            ),
          ),

          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.video_call
            ),
          ),
        ],
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImage.chatMicSvg,
                width: 25,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: false,
                  hintText: "Type your message..."
                ),
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImage.chatGallerySvg,
                width: 25,
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImage.chatSendSvg,
                width: 25,
              ),
            ),
          ],
        ),
      ),
      
      
      
      
      
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ChatBubble(
              message: "Hello, how are you?",
              imageUrl: "",
              isComming: true,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Fine",
              imageUrl: "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "What about you?",
              imageUrl: "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Fine too",
              imageUrl: "https://quickblox.com/wp-content/uploads/2019/12/what-is-flutter.png",
              isComming: true,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Good Good",
              imageUrl: "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Hello, how are you?",
              imageUrl: "",
              isComming: true,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Fine",
              imageUrl: "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "What about you?",
              imageUrl: 
                "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Fine too",
              imageUrl: "",
              isComming: true,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Good Good",
              imageUrl: 
                "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Hello, how are you?",
              imageUrl: "",
              isComming: true,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Fine",
              imageUrl: "https://quickblox.com/wp-content/uploads/2019/12/what-is-flutter.png",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "What about you?",
              imageUrl: 
                "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Fine too",
              imageUrl: "",
              isComming: true,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Good Good",
              imageUrl: 
                "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Hello, how are you?",
              imageUrl: "",
              isComming: true,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Fine",
              imageUrl: "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "What about you?",
              imageUrl: 
                "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Fine too",
              imageUrl: "",
              isComming: true,
              status: "read",
              time: "10:10 AM",
            ),

            ChatBubble(
              message: "Good Good",
              imageUrl: 
                "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),
          ],
        ),
      ),
    );
  }
}