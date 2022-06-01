import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/screens/MainScreen.dart';
import 'package:sample/screens/loginscreen.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Upload product',
                  style: GoogleFonts.lato(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Product images',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700, fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Please upload product images with dimension 1000x1000',
                    style: GoogleFonts.lato(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff79747E),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: wdth * .2,
                      width: wdth * .2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_rounded),
                          Text(
                            'Upload ',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffEDEDED),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      height: wdth * .2,
                      width: wdth * .2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_rounded),
                          Text(
                            'Upload ',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffEDEDED),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      height: wdth * .2,
                      width: wdth * .2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_rounded),
                          Text(
                            'Upload ',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffEDEDED),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      height: wdth * .2,
                      width: wdth * .2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_rounded),
                          Text(
                            'Upload ',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffEDEDED),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  ' product name',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Place holder',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  ' product price',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Place holder',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  '  Description',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 114,
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: ' description',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => {
                        FirebaseAuth.instance.signOut(),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        )
                      },
                      child: const Text(
                        'Upload',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffFF4400)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
