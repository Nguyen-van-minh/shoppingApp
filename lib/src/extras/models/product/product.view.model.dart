class ProductVieModel {
  final String name;
  final String image;
  final double price;
  final int isHot;
  final int? id;
  ProductVieModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.isHot,
      this.id});
  factory ProductVieModel.fromMap(Map<String, dynamic> map) {
    return ProductVieModel(
        name: map['name'],
        image: map['image'],
        price: map['price'],
        isHot: map['isHot'],
        id: map['id']);
  }
}
