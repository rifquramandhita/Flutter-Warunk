import 'package:equatable/equatable.dart';

sealed class CustomerProductEvent extends Equatable {
  const CustomerProductEvent();

  @override
  List<Object?> get props => [];
}

class CustomerDetailProductEventStarted extends CustomerProductEvent {
  final String productId;

  const CustomerDetailProductEventStarted({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class CustomerDetailProductEventQuantityChanged extends CustomerProductEvent {
  final int quantity;

  const CustomerDetailProductEventQuantityChanged(this.quantity);

  @override
  List<Object?> get props => [quantity];
}

class CustomerDetailProductEventVariantChanged extends CustomerProductEvent {
  final Map<String, String> selectedCombination;

  const CustomerDetailProductEventVariantChanged(this.selectedCombination);

  @override
  List<Object?> get props => [selectedCombination];
}

class CustomerDetailProductEventAddToCart extends CustomerProductEvent {
  final String? notes;

  const CustomerDetailProductEventAddToCart({this.notes});

  @override
  List<Object?> get props => [notes];
}

class CustomerDetailProductEventAddToWishlist extends CustomerProductEvent {
  const CustomerDetailProductEventAddToWishlist();
}

class CustomerDetailProductEventRemoveFromWishlist
    extends CustomerProductEvent {
  const CustomerDetailProductEventRemoveFromWishlist();
}
