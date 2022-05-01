import 'package:flutter/material.dart';
import 'package:sample/screens/MainScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatehome();
  }

  _navigatehome() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double hgth = MediaQuery.of(context).size.height;
    double wdth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: hgth,
        width: wdth,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/splash.png'), fit: BoxFit.fill)),
      ),
    );
  }
}
