import 'package:flutter/material.dart';
import 'package:sample/products/products.dart';
import 'package:sample/screens/ProductDetails.dart';

class BuyNowButton extends StatefulWidget {
  final Product product;
  int itemindex;

  BuyNowButton({Key? key, required this.product, required this.itemindex})
      : super(key: key);

  @override
  State<BuyNowButton> createState() => _BuyNowButtonState(itemindex);
}

class _BuyNowButtonState extends State<BuyNowButton> {
  _BuyNowButtonState(int itemindex);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetails(
                        product: products[widget.itemindex],
                      )));
        },
        child: const Text(
          ' Buy Now',
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
