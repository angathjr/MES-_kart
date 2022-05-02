import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: Container(
                width: wdth,
                decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SizedBox(
                      width: wdth * 0.78,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: 'Search for paintings, cloths and more',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Flexible(
                        child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.search,
                        color: Color(0xffFF4400),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
