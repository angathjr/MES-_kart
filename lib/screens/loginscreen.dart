import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/DataBase/firebase.dart';
import 'package:sample/main.dart';
import 'package:sample/screens/Homescreen.dart';
import 'package:sample/screens/MainScreen.dart';
import 'package:sample/screens/Registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sample/screens/forgot_pass.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
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
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: passcontroller,
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Container(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: SignIn,
                    child: const Text(
                      'Sign in',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
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
            Center(
                child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Forgot_pass()));
              },
              child: const Text(
                'forgot password?',
                style: TextStyle(
                    color: Color(0xffFF4400),
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            )),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don???t have an account? ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Registration()));
                  },
                  child: const Text(
                    'Register now',
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

  Future SignIn() async {
    FocusScope.of(context).unfocus();
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passcontroller.text.trim());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user found on that email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Incorrect password !!')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("The field can't be empty")));
      }
    }
    navigatorkey.currentState!.popUntil((route) => route.isFirst);
  }
}
