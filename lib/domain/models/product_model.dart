class Product {
  int id;
  String article;
  String title;
  String description;
  double price;
  String category;
  int minamount;
  String size;
  String photo;

  Product(
      {required this.id,
      required this.article,
      required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.minamount,
      required this.size,
      required this.photo});

  factory Product.fromJson(Map<dynamic, dynamic> json) {
    return Product(
        id: int.parse(json['id'].toString()),
        article: json['article'].toString(),
        title: json['title'].toString(),
        description: json['description'].toString(),
        price: double.parse(json['price'].toString()),
        category: json['category'].toString(),
        minamount: int.parse(json['minamount'].toString()),
        size: json['size'].toString(),
        photo: json['photo'].toString());
  }

  Map<String, dynamic> toDatabaseJson() => {
        'id': this.id,
        'article': this.article,
        'title': this.title,
        'description': this.description,
        'price': this.price,
        'category': this.category,
        'minamount': this.minamount,
        'size': this.size,
        'photo': this.photo
      };
}
