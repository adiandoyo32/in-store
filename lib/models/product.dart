part of 'models.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.category,
    @required this.image,
  });

  // @override
  // List<Object> get props => [id, title, price, description, category, image];

  @override
  String toString() => 'Device { id: $id, title: $title, price: $price }';

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}
