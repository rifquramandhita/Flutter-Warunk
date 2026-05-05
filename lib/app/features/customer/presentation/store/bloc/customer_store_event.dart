import 'package:warunk/app/features/customer/presentation/store/bloc/customer_store_state.dart';

abstract class CustomerStoreEvent {}

class CustomerLoadStoreDetails extends CustomerStoreEvent {
  final String storeName;
  CustomerLoadStoreDetails(this.storeName);
}

class CustomerSelectCategory extends CustomerStoreEvent {
  final int index;
  CustomerSelectCategory(this.index);
}

class CustomerAddToCart extends CustomerStoreEvent {
  final CustomerProductItem product;
  CustomerAddToCart(this.product);
}
