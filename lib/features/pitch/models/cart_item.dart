class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, dynamic>? selectedVariation;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId = "",
    this.title = "",
    this.image,
    this.brandName,
    this.selectedVariation,
    this.price = 0.0,
  });

  static CartItemModel empty() => CartItemModel(productId: "", quantity: 0);

  Map<String, dynamic> toJson() {
    return {
      "ProductId": productId,
      "Quantity": quantity,
      "Image": image,
      "BrandName": brandName,
      "Price": price,
      "SelectedVariation": selectedVariation,
      "VariationId": variationId,
      "Title": title,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json["ProductId"],
      quantity: json["Quantity"],
      brandName: json["BrandName"],
      image: json["Image"],
      price: json["Price"] as double,
      selectedVariation: json["SelectedVariation"] != null
          ? Map<String, String>.from(json["SelectedVariation"])
          : null,
      title: json["Title"],
      variationId: json["VariationId"],
    );
  }
}
