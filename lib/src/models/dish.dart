class Dish {
  String name;
  String description;
  double price;
  String image;
  String? categoryName;

  Dish({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.categoryName,
  });
}
