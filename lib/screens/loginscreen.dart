import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'lib/images/title.png',
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                'Sign into your account',
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                )),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                'Get access to your order, products',
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                'Email Address',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'eg :James@gmail.com',
                    fillColor: Color.fromARGB(255, 236, 232, 232),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Text(
                  'Password',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'password here',
                    fillColor: Color.fromARGB(255, 236, 232, 232),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Container(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('sign in'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text(
              'forgot password?',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            )),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Row(
                children: const [
                  Text(
                    'Don’t have an account? ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Register now',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.deepOrange,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
