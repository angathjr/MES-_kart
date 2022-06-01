<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:sample/screens/ProductInfo.dart';
import 'package:sample/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: splashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:sample/screens/ProductInfo.dart';
import 'package:sample/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: splashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
>>>>>>> 776526292bf05460e36b1c233f7f3e10600347de
