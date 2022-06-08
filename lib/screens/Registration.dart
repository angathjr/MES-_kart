import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/widgets/ConfirmButton.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Registration> {
  final emailcontroller = TextEditingController();
  final passcontrolller = TextEditingController();
  final confirmcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;
    double hgth = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: wdth,
              height: hgth / 3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/images/title.png'),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                'Register your account',
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
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: 'eg :James@gmail.com',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: passcontrolller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: 'Password here',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Text(
                  'Confirm Password',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: confirmcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: 'Password here',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Container(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => {SignUp(), Navigator.pop(context)},
                    child: const Text('Sign up',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffFF4400)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                    ),
                  )),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xffFF4400),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  Future<void> SignUp() async {
    try {
      if (passcontrolller.text.trim() == confirmcontroller.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailcontroller.text.trim(),
            password: passcontrolller.text.trim());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password doesnot match')));
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
