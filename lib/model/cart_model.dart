final sampleDataCarts = [
  {
    "id": 1,
    "userId": 1,
    "date": "2020-03-02T00:00:00.000Z",
    "products": [
      {"productId": 1, "quantity": 4},
      {"productId": 2, "quantity": 1},
      {"productId": 3, "quantity": 6}
    ]
  }
];

class CartModel {
  int id;
  int userId;
  String date;
  List<Products> products;
  int version;

  CartModel(
      {required this.id,
      required this.userId,
      required this.date,
      required this.products,required this.version});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final productsJson = json['products'] as List;
    List<Products> productList =
        productsJson.map((data) => Products.fromJson(data)).toList();

    return CartModel(
        id: json['id'],
        userId: json['userId'],
        date: json['date'],
        products: productList,
        version: json['__v']);
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'userId': userId,
      'date': date,
      'products': products.map((product)=> product.toJson()).toList(),
       '__v': version,
    };
  }
}

class Products {
  int productId;
  int quantity;

  Products({required this.productId, required this.quantity});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      productId: json['productId'], 
      quantity: json['quantity']
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}
