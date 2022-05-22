import 'package:flutter/material.dart';
import 'package:sample/products/products.dart';

class ListCard extends StatelessWidget {
  final Product product;
  const ListCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order #8889884311',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(color: Colors.transparent),
              width: 120,
              child: Image(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '\$ ${product.price}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Your order has been placed',
                        style: TextStyle(fontWeight: FontWeight.w400)),
                    Text(
                      "Delivery expected by  3 May, Friday",
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        const Divider(
          color: Color(0xffEDEDED),
        )
      ],
    ));
  }
}
