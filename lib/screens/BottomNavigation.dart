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
          selectedItemColor: Color(0xffFF4400),
          unselectedItemColor: Color(0xff79747E),
          currentIndex: updatedindex,
          onTap: (newindex) {
            MainScreen.indexnotify.value = newindex;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'My Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ],
        );
      },
    );
  }
}
