import 'package:flutter/material.dart';
import 'package:sample/screens/Registration.dart';
import 'package:sample/screens/loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Registration(),
      debugShowCheckedModeBanner: false,
    );
  }
}
