// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  ProductClass product;

  Product({
    required this.product,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        product: ProductClass.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
      };
}

class ProductClass {
  String id;
  String name;
  String category;
  String description;
  String price;

  ProductClass({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  factory ProductClass.fromJson(Map<String, dynamic> json) => ProductClass(
        id: json["Id"],
        name: json["name"],
        category: json["category"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "name": name,
        "category": category,
        "description": description,
        "price": price,
      };
}
