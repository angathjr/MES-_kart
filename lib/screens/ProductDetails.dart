import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Details Page',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w700, color: Colors.black, fontSize: 17),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Color(0xffFF4400)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 18),
        children: [
          Container(
            width: double.infinity,
            child: ListTile(
              leading: Image.asset(
                'lib/images/image1.png',
              ),
              title: Text('Lady home wallpaper'),
              subtitle: Container(
                child: Text('item description'),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffFF4400)),
          ),
          child: const Text(
            'Confirm purchase',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontFamily: 'lato'),
          ),
          onPressed: null,
        ),
      ),
    ));
  }
}
