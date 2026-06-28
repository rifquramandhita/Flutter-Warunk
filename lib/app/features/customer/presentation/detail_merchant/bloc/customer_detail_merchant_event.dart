import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';

abstract class CustomerDetailMerchantEvent {}

class CustomerDetailMerchantEventGet extends CustomerDetailMerchantEvent {
  final String storeId;
  CustomerDetailMerchantEventGet({required this.storeId});
}

class CustomerDetailMerchantEventSelectCategory
    extends CustomerDetailMerchantEvent {
  final int index;
  CustomerDetailMerchantEventSelectCategory(this.index);
}

class CustomerDetailMerchantEventAddToCart extends CustomerDetailMerchantEvent {
  final CustomerProductEntity product;
  CustomerDetailMerchantEventAddToCart(this.product);
}
