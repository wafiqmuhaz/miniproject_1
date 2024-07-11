class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

   

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
   Map<String, String> toMap() {
    return {
      'id': id.toString(),
      'title': title,
      'price': price.toString(),
      'description': description,
      'category': category,
      'image': image,
      'rate': rating.rate.toString(),
      'count': rating.count.toString(),
    };
  }
  static ProductModel fromMap(Map<String, String> map) {
    return ProductModel(
      id: int.parse(map['id'] ?? '0'),
      title: map['title']!,
      price: double.tryParse(map['price'] ?? '0') ?? 0,
      description: map['description']!,
      category: map['category']!,
      image: map['image']!,
      rating: Rating(
        rate: double.tryParse(map['rate'] ?? '0') ?? 0,
        count: int.tryParse(map['count'] ?? '0') ?? 0,
      ),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}
