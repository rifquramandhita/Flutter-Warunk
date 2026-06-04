import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';

abstract class CustomerMerchantEvent {}

class CustomerMerchantEventGet extends CustomerMerchantEvent {
  final String storeId;
  CustomerMerchantEventGet({required this.storeId});
}

class CustomerMerchantEventSelectCategory extends CustomerMerchantEvent {
  final int index;
  CustomerMerchantEventSelectCategory(this.index);
}

class CustomerMerchantEventAddToCart extends CustomerMerchantEvent {
  final CustomerProductEntity product;
  CustomerMerchantEventAddToCart(this.product);
}
