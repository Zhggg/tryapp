class Product {
  final int productInfoID;
  final String productName;
  final double price;
  final int smallestUnitID;
  final int categoryID;
  final String unitName;
  final String thumbnailPic;
  final String? description;
  final String? categoryName;

  Product({
    required this.productInfoID,
    required this.productName,
    required this.price,
    required this.smallestUnitID,
    required this.categoryID,
    required this.unitName,
    required this.thumbnailPic,
    this.description,
    this.categoryName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productInfoID: json['productInfoID'] ?? 0,
      productName: json['productName'] ?? '',
      price: json['price'] ?? 0.0,
      smallestUnitID: json['smallestUnitID'] ?? 0,
      categoryID: json['categoryID'] ?? 0,
      unitName: json['unitName'] ?? '',
      thumbnailPic: json['thumbnailPic'] ?? '',
      description: json['description'] ?? '',
      categoryName: json['categoryName'] ?? '',
    );
  }
}
