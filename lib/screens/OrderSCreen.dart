import 'package:flutter/material.dart';
import 'package:sample/products/products.dart';
import 'package:sample/widgets/ItemCard.dart';
import 'package:sample/widgets/Ordercard.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Search orders',
                      filled: true,
                      fillColor: Color(0xffF4F4F4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.search,
                          color: Color(0xffFF4400),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) => ListCard(
                          product: products[index],
                        )),
                    itemCount: 4)
              ],
            ),
          )),
    ));
  }
}
