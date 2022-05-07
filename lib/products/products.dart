import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  List<String> images = [];
  Product(
      {required this.id,
      required this.image,
      required this.title,
      required this.price,
      required this.description,
      required this.size,
      required this.color,
      required this.images});
}

List<Product> products = [
  Product(
      images: [
        "lib/images/img4.png",
        "lib/images/img2.png",
        "lib/images/img3.png",
        "lib/images/img4.png",
      ],
      id: 1,
      title: "Product hello",
      price: 234,
      size: 12,
      description: eg,
      image: "lib/images/img4.png",
      color: Color(0xFF3D82AE)),
  Product(
      images: [
        "lib/images/img4.png",
        "lib/images/img2.png",
        "lib/images/img3.png",
        "lib/images/img4.png",
      ],
      id: 2,
      title: "Product Name",
      price: 234,
      size: 8,
      description: eg,
      image: "lib/images/img2.png",
      color: Color(0xFFD3A984)),
  Product(
      images: [
        "lib/images/img4.png",
        "lib/images/img2.png",
        "lib/images/img3.png",
        "lib/images/img4.png",
      ],
      id: 3,
      title: "Product Name",
      price: 234,
      size: 10,
      description: eg,
      image: "lib/images/img3.png",
      color: Color(0xFF989493)),
  Product(
      images: [
        "lib/images/img4.png",
        "lib/images/img2.png",
        "lib/images/img3.png",
        "lib/images/img4.png",
      ],
      id: 4,
      title: "Product Name",
      price: 234,
      size: 11,
      description: eg,
      image: "lib/images/img4.png",
      color: Color(0xFFE6B398)),
  Product(
      images: [
        "lib/images/img4.png",
        "lib/images/img2.png",
        "lib/images/img3.png",
        "lib/images/img4.png",
      ],
      id: 5,
      title: "Product Name",
      price: 234,
      size: 12,
      description: eg,
      image: "lib/images/img2.png",
      color: Color(0xFFFB7883)),
  Product(
    images: [
      "lib/images/img4.png",
      "lib/images/img2.png",
      "lib/images/img3.png",
      "lib/images/img4.png",
    ],
    id: 6,
    title: "Product Name",
    price: 234,
    size: 12,
    description: eg,
    image: "lib/images/image1.png",
    color: Color(0xFFAEAEAE),
  ),
];

String eg = "hello there";
