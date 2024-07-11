class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, dynamic> attributeValues;

  ProductVariationModel(
      {required this.id,
      this.image = "",
      this.price = 0.0,
      this.salePrice = 0.0,
      this.stock = 0,
      this.sku = "",
      this.description,
      required this.attributeValues});

  static ProductVariationModel empty() =>
      ProductVariationModel(id: "", attributeValues: {});

  toJson() {
    return {
      "Id": id,
      "Image": image,
      "SKU": sku,
      "Price": price,
      "SalePrice": salePrice,
      "Stock": stock,
      "Description": description,
      "AttributeValues": attributeValues,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data["Id"] ?? "",
      description: data["Description"] ?? "",
      image: data["Image"] ?? "",
      price: double.parse((data["Price"] ?? 0.0).toString()),
      salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
      sku: data["SKU"] ?? "",
      stock: data["Stock"] ?? "",
      attributeValues: Map<String, dynamic>.from(data["AttributeValues"]),
    );
  }
}
