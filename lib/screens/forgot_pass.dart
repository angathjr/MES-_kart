import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgot_pass extends StatelessWidget {
  const Forgot_pass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool start=false;

    final emailcontroller = TextEditingController();

    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Text(
              'Enter your Email address',
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

                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
