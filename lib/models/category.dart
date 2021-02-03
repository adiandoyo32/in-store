part of 'models.dart';

class Category {
  final int id;
  final String name;
  final String slug;
  final String description;

  Category({
    @required this.id,
    @required this.name,
    @required this.slug,
    @required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['descriptiom'],
    );
  }

  @override
  String toString() => 'Category { id: $id, name: $name, slug: $slug }';
}
