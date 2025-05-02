import 'package:flutter/material.dart';

import 'package:whispr/Pages/Widgets/PrimaryButton.dart';

class UserUpdateProfile extends StatelessWidget {
  const UserUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Profile")),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                color: Theme.of(context).colorScheme.primaryContainer,
              ),

              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 200,

                          height: 200,

                          child: Center(
                            child: Icon(Icons.image_search, size: 40),
                          ),

                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,

                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),

                        SizedBox(height: 20),

                        Row(
                          children: [
                            Text(
                              "Personal Info",

                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        Row(
                          children: [
                            Text(
                              "Name",

                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        TextField(
                          textInputAction: TextInputAction.next,

                          decoration: InputDecoration(
                            hintText: "Your Name",

                            prefixIcon: Icon(Icons.person),
                          ),
                        ),

                        SizedBox(height: 20),

                        Row(
                          children: [
                            Text(
                              "Email id",

                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        TextField(
                          textInputAction: TextInputAction.next,

                          decoration: InputDecoration(
                            hintText: "example@gmail.com",

                            prefixIcon: Icon(Icons.alternate_email_rounded),
                          ),
                        ),

                        SizedBox(height: 20),

                        Row(
                          children: [
                            Text(
                              "Phone number",

                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        TextField(
                          textInputAction: TextInputAction.next,

                          decoration: InputDecoration(
                            hintText: "000xxx0000",

                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),

                        SizedBox(height: 40),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Primarybutton(
                              btnName: "Save",

                              icon: Icons.save_alt,

                              ontap: () {},
                            ),
                          ],
                        ),
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
