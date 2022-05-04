import 'package:flutter/material.dart';
import 'package:sample/widgets/card.dart';

import '../products/products.dart';

class GiftCategory extends StatelessWidget {
  const GiftCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.60,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          itemBuilder: (context, index) => ItemCard(
            product: products[index],
          ),
        ),
      ),
    ));
  }
}
