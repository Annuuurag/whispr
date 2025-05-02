import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/ProfileController.dart';

class LoginUserInfo extends StatelessWidget {
  const LoginUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
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

                  children: [Image.asset(AssetsImage.boyPic)],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Obx(
                      () => Text(
                        profilecontroller.currentUser.value.name! ?? "User",

                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Obx(
                      () => Text(
                        profilecontroller.currentUser.value.email!,

                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
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
                            AssetsImage.appIconSVG,

                            width: 25,

                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                          ),

                          SizedBox(width: 10),

                          Text(
                            "Chat",

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
