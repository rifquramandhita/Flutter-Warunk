class CustomerCartAddParam {
  final String productId;
  final String? productVariantId;
  final int quantity;
  final String? notes;

  CustomerCartAddParam({
    required this.productId,
    this.productVariantId,
    required this.quantity,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      if (productVariantId != null) 'product_variant_id': productVariantId,
      'quantity': quantity,
      if (notes != null) 'notes': notes,
    };
  }
}
