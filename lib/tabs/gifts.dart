import 'package:flutter/material.dart';
import 'package:sample/screens/ProductDetails.dart';
import 'package:sample/widgets/ItemCard.dart';

import '../products/products.dart';

class GiftCategory extends StatelessWidget {
  const GiftCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
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
                      ProductDetails(product: products[index]))),
        ),
      ),
    ));
  }
}
