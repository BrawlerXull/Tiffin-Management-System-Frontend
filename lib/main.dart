import 'package:flutter/material.dart';
import 'package:tiffin/pages/homepage.dart';
import 'package:tiffin/pages/mainpage.dart';
import 'package:tiffin/pages/updatepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
