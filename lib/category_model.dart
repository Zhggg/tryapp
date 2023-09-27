import 'package:tryapp/product_model.dart';

class CategoryModel {
  final int categoryID;
  final String categoryName;
  final String subTitle;
  final List<Product> products;

  CategoryModel({
    required this.categoryID,
    required this.categoryName,
    required this.subTitle,
    required this.products,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> productsJson = json['Products'];
    List<Product> products = productsJson
        .map((productJson) => Product.fromJson(productJson))
        .toList();

    return CategoryModel(
      categoryID: json['CategoryID'],
      categoryName: json['CategoryName'],
      subTitle: json['SubTitle'],
      products: products,
    );
  }
}
