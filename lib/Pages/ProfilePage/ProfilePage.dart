import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    TextEditingController phone = TextEditingController(text: profilecontroller.currentUser.value.phoneNumber);
    TextEditingController about = TextEditingController(text: profilecontroller.currentUser.value.about);
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
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
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              radius: 80,
                              child: Icon(Icons.image),
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
                                        ontap: () {
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
