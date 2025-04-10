import 'package:flutter/material.dart';
import 'package:whispr/Config/Themes.dart';
import 'package:whispr/Pages/SplacePage/SplacePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whispr',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: Splacepage(),
    );
  }
}
