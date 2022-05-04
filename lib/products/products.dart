import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "name",
      price: 234,
      size: 12,
      description: eg,
      image: "lib/images/image1.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "name",
      price: 234,
      size: 8,
      description: eg,
      image: "lib/images/img2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "name",
      price: 234,
      size: 10,
      description: eg,
      image: "lib/images/img3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "name",
      price: 234,
      size: 11,
      description: eg,
      image: "lib/images/img4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "name",
      price: 234,
      size: 12,
      description: eg,
      image: "lib/images/img2.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "name",
    price: 234,
    size: 12,
    description: eg,
    image: "lib/images/img3.png",
    color: Color(0xFFAEAEAE),
  ),
];

String eg = "hello there";
