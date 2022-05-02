import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Details Page',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 17),
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
            bottomSheet: BottomAppBar(
                child: Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Confirm purchase',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffFF4400)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
                ),
              ),
            ))));
  }
}
