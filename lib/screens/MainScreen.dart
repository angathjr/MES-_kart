import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample/screens/BottomNavigation.dart';
import 'package:sample/screens/Homescreen.dart';
import 'package:sample/screens/OrderSCreen.dart';
import 'package:sample/screens/ProfileScreen.dart';
import 'package:sample/screens/SellScreen.dart';

var user;

class MainScreen extends StatelessWidget {
  MainScreen({Key? key, required this.index}) : super(key: key);
  int index;

  static ValueNotifier<int> indexnotify = ValueNotifier(0);

  final pages = [HomeScreen(), MyOrderScreen(), SellScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        index: indexnotify.value,
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: indexnotify,
        builder: (BuildContext context, int updatedindex, _) {
          index = updatedindex;
          print(indexnotify.value);
          return pages[updatedindex];
        },
      )),
    );
  }
}
