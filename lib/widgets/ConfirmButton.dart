import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
