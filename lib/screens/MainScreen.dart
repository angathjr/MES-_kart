import 'package:flutter/material.dart';
import 'package:sample/screens/BottomNavigation.dart';
import 'package:sample/screens/Homescreen.dart';
import 'package:sample/screens/OrderSCreen.dart';
import 'package:sample/screens/ProfileScreen.dart';
import 'package:sample/screens/SellScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static ValueNotifier<int> indexnotify = ValueNotifier(0);

  final pages = const [
    HomeScreen(),
    MyOrderScreen(),
    SellScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: indexnotify,
        builder: (BuildContext context, int updatedindex, _) {
          return pages[updatedindex];
        },
      )),
    );
  }
}
