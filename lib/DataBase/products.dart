class Product {
  String? category;
  String? description;
  String? id;
  String? image;
  int? price;
  String? title;

  Product(
      {this.category,
      this.description,
      this.id,
      this.image,
      this.price,
      this.title});

  Product.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    description = json['description'];
    id = json['id'];
    image = json['image'];
    price = json['price'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['price'] = this.price;
    data['title'] = this.title;
    return data;
  }
}
