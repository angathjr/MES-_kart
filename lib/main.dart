import 'package:flutter/material.dart';
import 'package:sample/screens/ProductInfo.dart';
import 'package:sample/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorkey=GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      theme: ThemeData(
          primaryColor: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home:const splashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
