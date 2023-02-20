class Product {
  int id;
  String name;
  double price;
  String image;
  String description;
  bool isAdded;

  String get imageUrl =>
      "https://firtman.github.io/coffeemasters/api/images/$image";

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.isAdded,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as double,
      image: json['image'] as String,
      description: json['description'] as String,
      isAdded: json['isAdded'] as bool,
    );
  }
}

class Category {
  String name;
  List<Product> products;

  Category({required this.name, required this.products});

  factory Category.fromJson(Map<String, dynamic> json) {
    var products = json['products'] as Iterable<dynamic>;
    Iterable<Product> productsFromJson = products.map((json) {
      return Product.fromJson(json);
    });
    return Category(
        name: json['name'], products: productsFromJson as List<Product>);
  }
}

class ItemInCart {
  Product product;
  int quantity;

  ItemInCart({required this.product, required this.quantity});
}
