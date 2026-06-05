class CustomerCartUpdateParam {
  final String cartId;
  final int quantity;
  final String? notes;

  CustomerCartUpdateParam({
    required this.cartId,
    required this.quantity,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'quantity': quantity,
    };
    if (notes != null) {
      map['notes'] = notes;
    }
    return map;
  }
}
