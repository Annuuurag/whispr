import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:whispr/Config/Images.dart';
import 'package:whispr/Controller/ProfileController.dart';

class LoginUserInfo extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String userEmail;
  const LoginUserInfo({
    super.key,
    required this.profileImage,
    required this.userName,
    required this.userEmail,
  });

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
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(profileImage, fit: BoxFit.cover),
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
