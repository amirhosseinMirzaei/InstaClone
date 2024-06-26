import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/root.dart';
import 'package:untitled1/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
