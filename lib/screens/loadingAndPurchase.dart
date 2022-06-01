<<<<<<< HEAD
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/screens/MainScreen.dart';
import 'package:sample/screens/OrderSCreen.dart';
import 'package:sample/screens/loginscreen.dart';

import '../main.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    _navigateorder();
  }

  _navigateorder() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>  MainScreen(
                  index: 1,
                )));
  }

  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;
    double hgth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: []),
      )),
    );
  }

  Container loadingdetails() {
    return Container(
        child: Column(
      children: [
        Image(image: AssetImage('lib/images/loading.png')),
        Text(
          'Purchase in progress',
          style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          'Please wait',
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xffff4400),
          ),
        )
      ],
    ));
  }

  Container purchase() {
    return Container(
        child: Column(
      children: [
        Image(image: AssetImage('lib/images/purchase.png')),
        Text(
          'Purchased !',
          style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          'Please await a call from delivery team soon',
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xffff4400),
          ),
        )
      ],
    ));
  }
}
=======
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/screens/MainScreen.dart';
import 'package:sample/screens/OrderSCreen.dart';
import 'package:sample/screens/loginscreen.dart';

import '../main.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    _navigateorder();
  }

  _navigateorder() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MainScreen(
                  index: 1,
                )));
  }

  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;
    double hgth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: []),
      )),
    );
  }

  Container loadingdetails() {
    return Container(
        child: Column(
      children: [
        Image(image: AssetImage('lib/images/loading.png')),
        Text(
          'Purchase in progress',
          style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          'Please wait',
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xffff4400),
          ),
        )
      ],
    ));
  }

  Container purchase() {
    return Container(
        child: Column(
      children: [
        Image(image: AssetImage('lib/images/purchase.png')),
        Text(
          'Purchased !',
          style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          'Please await a call from delivery team soon',
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xffff4400),
          ),
        )
      ],
    ));
  }
}
>>>>>>> 776526292bf05460e36b1c233f7f3e10600347de
