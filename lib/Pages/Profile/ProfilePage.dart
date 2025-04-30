import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whispr/Config/Images.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
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
                            Text(
                              "Name here",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Email here",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(width: 10),
                                  Text("Call"),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(width: 10),
                                  Text("Call"),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(width: 10),
                                  Text("Call"),
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
            ),
          ],
        ),
      ),
    );
  }
}
