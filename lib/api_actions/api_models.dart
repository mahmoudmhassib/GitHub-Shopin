class Product {
  final int id;
  final String title;
  final int price;
  final int oldPrice;
  final num rating;
  final String ratingTitle;
  final num ratingNum;
  final List<dynamic> sizes;
  final String details;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.ratingTitle,
    required this.ratingNum,
    required this.sizes,
    required this.details,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      oldPrice: json['oldPrice'],
      rating: json['rating'],
      ratingTitle: json['ratingTitle'],
      ratingNum: json['ratingNum'],
      sizes: json['sizes'],
      details: json['details'],
      image: json['image'],
    );
  }
}
