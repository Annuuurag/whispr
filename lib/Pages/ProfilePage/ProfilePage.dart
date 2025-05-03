import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whispr/Controller/AuthController.dart';
import 'package:whispr/Controller/ImagePicker.dart';
import 'package:whispr/Controller/ProfileController.dart';
import 'package:whispr/Pages/Widgets/PrimaryButton.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
    TextEditingController name = TextEditingController(
      text: profilecontroller.currentUser.value.name,
    );
    TextEditingController email = TextEditingController(
      text: profilecontroller.currentUser.value.email,
    );
    TextEditingController phone = TextEditingController(
      text: profilecontroller.currentUser.value.phoneNumber,
    );
    TextEditingController about = TextEditingController(
      text: profilecontroller.currentUser.value.about,
    );
    Imagepickercontroller imagepickercontroller = Get.put(
      Imagepickercontroller(),
    );
    RxString imagePath = "".obs;

    Authcontroller authcontroller = Get.put(Authcontroller());

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              authcontroller.logoutUser();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              //height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () =>
                                  isEdit.value
                                      ? InkWell(
                                        onTap: () async {
                                          imagePath.value =
                                              await imagepickercontroller
                                                  .pickImage();
                                          print(
                                            "Image picked" + imagePath.value,
                                          );
                                        },
                                        child: Container(
                                          height: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.surface,
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                          ),
                                          child:
                                              imagePath.value == ""
                                                  ? Icon(Icons.add)
                                                  : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          100,
                                                        ),
                                                    child: Image.file(
                                                      File(imagePath.value),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                        ),
                                      )
                                      : Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.surface,
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                        child:
                                            profilecontroller
                                                            .currentUser
                                                            .value
                                                            .profileImage ==
                                                        "" ||
                                                    profilecontroller
                                                            .currentUser
                                                            .value
                                                            .profileImage ==
                                                        null
                                                ? Icon(Icons.image)
                                                : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        100,
                                                      ),
                                                  child: Image.network(
                                                    profilecontroller
                                                        .currentUser
                                                        .value
                                                        .profileImage!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                      ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                        Obx(
                          () => TextField(
                            controller: name,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "Name",
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () => TextField(
                            controller: about,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "About",
                              prefixIcon: Icon(Icons.info_outline),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: email,
                          enabled: false,
                          decoration: InputDecoration(
                            filled: false,
                            labelText: "email",
                            prefixIcon: Icon(Icons.alternate_email_outlined),
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () => TextField(
                            controller: phone,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "Phone",
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () =>
                                  isEdit.value
                                      ? Primarybutton(
                                        btnName: "Save",
                                        icon: Icons.save,
                                        ontap: () async {
                                          await profilecontroller.updateProfile(
                                            imagePath.value,
                                            name.text,
                                            about.text,
                                            phone.text,
                                          );
                                          isEdit.value = false;
                                        },
                                      )
                                      : Primarybutton(
                                        btnName: "Edit",
                                        icon: Icons.edit,
                                        ontap: () {
                                          isEdit.value = true;
                                        },
                                      ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
