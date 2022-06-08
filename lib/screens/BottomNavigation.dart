import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/screens/MainScreen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MainScreen.indexnotify,
      builder: (BuildContext ctx, int updatedindex, Widget? _) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: const Color(0xffFF4400),
          unselectedItemColor: const Color(0xff79747E),
          currentIndex: MainScreen.indexnotify.value,
          onTap: (newindex) {
            MainScreen.indexnotify.value = newindex;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'My Orders'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_business_rounded), label: 'Sell'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ],
        );
      },
    );
  }
}
