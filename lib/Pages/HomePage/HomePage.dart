import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:whispr/Config/Images.dart';
import 'package:whispr/Config/Strings.dart';
import 'package:whispr/Controller/ImagePicker.dart';
import 'package:whispr/Controller/ProfileController.dart';
import 'package:whispr/Pages/HomePage/Widget/ChatList.dart';
import 'package:whispr/Pages/HomePage/Widget/TabBar.dart';
import 'package:whispr/Pages/ProfilePage/ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
    Imagepickercontroller imagePickerController = Get.put(
      Imagepickercontroller(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(AssetsImage.appIconSVG),
        ),
        actions: [
          IconButton(
            onPressed: () {
              imagePickerController.pickImage();
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () async {
              //Get.toNamed("/profilePage");
              await profilecontroller.getUserDetails();
              Get.to(Profilepage());
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
        bottom: MyTabBar(tabController, context),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onSurface),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          children: [
            ChatList(),

            ListView(children: [ListTile(title: Text("Name Nitish"))]),

            ListView(children: [ListTile(title: Text("Name Nitish"))]),
          ],
        ),
      ),
    );
  }
}
