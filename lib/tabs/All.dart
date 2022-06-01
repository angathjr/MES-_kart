import 'package:flutter/material.dart';
import 'package:sample/screens/ProductDetails.dart';
import 'package:sample/screens/ProductInfo.dart';
import 'package:sample/widgets/ItemCard.dart';

import '../products/products.dart';

class AllCatogery extends StatelessWidget {
  const AllCatogery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [Expanded(
          child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.60,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        itemBuilder: (context, index) => ItemCard(
          product: products[index],
          press: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductInfo(itemindex: index, product: products[index]))),
        ),
      )),]
    );
  }
}
