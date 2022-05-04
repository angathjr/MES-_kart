import 'package:flutter/material.dart';

import '../products/products.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  // final Function press;
  const ItemCard({Key? key, required this.product, s}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: product.color, borderRadius: BorderRadius.circular(16)),
            child: Image.asset(product.image),
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
