<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:sample/screens/MainScreen.dart';
import 'package:sample/screens/home.dart';
import 'package:sample/screens/loginscreen.dart';

import '../main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatehome();
  }

  _navigatehome() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;
    double hgth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: hgth,
          width: wdth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/images/splash.png'),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:sample/screens/MainScreen.dart';
import 'package:sample/screens/home.dart';
import 'package:sample/screens/loginscreen.dart';

import '../main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatehome();
  }

  _navigatehome() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;
    double hgth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: hgth,
          width: wdth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/images/splash.png'),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
>>>>>>> 776526292bf05460e36b1c233f7f3e10600347de
