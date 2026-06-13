import 'package:equatable/equatable.dart';

abstract class CustomerWishlistEvent extends Equatable {
  const CustomerWishlistEvent();

  @override
  List<Object?> get props => [];
}

class CustomerWishlistEventLoad extends CustomerWishlistEvent {}

class CustomerWishlistEventRemove extends CustomerWishlistEvent {
  final String productId;

  const CustomerWishlistEventRemove(this.productId);

  @override
  List<Object?> get props => [productId];
}
