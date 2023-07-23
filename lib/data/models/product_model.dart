import 'dart:convert';

class ProductModel {
  int? id;
  String? company;
  String? name;
  String? type;
  String? price;
  String? image;
  String? description;

  ProductModel(
      {this.id,
        this.company,
        this.name,
        this.type,
        this.price,
        this.image,
        this.description});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company'] = this.company;
    data['name'] = this.name;
    data['type'] = this.type;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }


  static String encode(List<ProductModel> productModelList) => json.encode(
    productModelList
        .map<Map<String, dynamic>>((product) => product.toJson())
        .toList(),
  );

  static List<ProductModel> decode(String productModels) =>
      (json.decode(productModels) as List<dynamic>)
          .map<ProductModel>((item) => ProductModel.fromJson(item))
          .toList();
}
