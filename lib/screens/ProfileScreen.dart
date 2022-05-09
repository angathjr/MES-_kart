import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;
    double hgth = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffededed),
                  ),
                  height: hgth * .2,
                  width: hgth * .2,
                ),
                Container(child: Icon(Icons.camera_alt_rounded))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
