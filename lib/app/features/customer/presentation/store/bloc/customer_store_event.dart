import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';

abstract class CustomerStoreEvent {}

class CustomerStoreEventLoadStoreDetails extends CustomerStoreEvent {
  final String storeId;
  CustomerStoreEventLoadStoreDetails({required this.storeId});
}

class CustomerStoreEventSelectCategory extends CustomerStoreEvent {
  final int index;
  CustomerStoreEventSelectCategory(this.index);
}

class CustomerStoreEventAddToCart extends CustomerStoreEvent {
  final CustomerProductEntity product;
  CustomerStoreEventAddToCart(this.product);
}
