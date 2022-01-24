class Product {
  late String name;
  late String cost;
  late String type;
  bool isLiked;
  late String image;
  String catergory;
  static List<Product> likedProduct=[];

  Product(
      {required this.name,
       required this.cost,
       required this.type,
       required this.image,
       required this.catergory,
        required this.isLiked
      }
       );

}
