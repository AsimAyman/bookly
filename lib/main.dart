import 'package:book_extchange/style/measures.dart';
import 'package:book_extchange/style/theme.dart';
import 'package:book_extchange/ui/screen/login_screen.dart';
import 'package:book_extchange/ui/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: LayoutBuilder(builder: (context, constraints) {
        deviceWidth = constraints.maxWidth;
        deviceHeight = constraints.maxHeight;
        return LoginScreen();
      }),
    );
  }
}
