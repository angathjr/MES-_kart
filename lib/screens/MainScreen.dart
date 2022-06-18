import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample/screens/BottomNavigation.dart';
import 'package:sample/screens/Homescreen.dart';
import 'package:sample/screens/OrderSCreen.dart';
import 'package:sample/screens/ProfileScreen.dart';
import 'package:sample/screens/SellScreen.dart';

var user;

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  static ValueNotifier<int> indexnotify = ValueNotifier(0);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pages =  [
     HomeScreen(),
     MyOrderScreen(),
      SellScreen(),
     ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser;
    return Scaffold(

      resizeToAvoidBottomInset: false,
      bottomNavigationBar:const  BottomNavigation(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: MainScreen.indexnotify,
        builder: (BuildContext context, int updatedindex, _) {
       //   print(MainScreen.indexnotify.value);
          return pages[updatedindex];
        },
      )),
    );
  }
}
