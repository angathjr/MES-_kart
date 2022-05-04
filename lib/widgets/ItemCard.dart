import 'package:flutter/material.dart';

import '../products/products.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  VoidCallback press;
  ItemCard({Key? key, required this.product, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16)),
              child: Image.asset(product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(product.title),
          ),
          Text('description'),
          Text('\$ ${product.price}')
        ],
      ),
    );
  }
}
