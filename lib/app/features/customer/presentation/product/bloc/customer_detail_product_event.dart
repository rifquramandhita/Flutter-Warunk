import 'package:equatable/equatable.dart';

sealed class CustomerDetailProductEvent extends Equatable {
  const CustomerDetailProductEvent();

  @override
  List<Object?> get props => [];
}

class CustomerDetailProductEventStarted extends CustomerDetailProductEvent {
  final String productId;

  const CustomerDetailProductEventStarted({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class CustomerDetailProductEventQuantityChanged
    extends CustomerDetailProductEvent {
  final int quantity;

  const CustomerDetailProductEventQuantityChanged(this.quantity);

  @override
  List<Object?> get props => [quantity];
}

class CustomerDetailProductEventVariantChanged
    extends CustomerDetailProductEvent {
  final Map<String, String> selectedCombination;

  const CustomerDetailProductEventVariantChanged(this.selectedCombination);

  @override
  List<Object?> get props => [selectedCombination];
}

class CustomerDetailProductEventAddToCart extends CustomerDetailProductEvent {
  final String? notes;

  const CustomerDetailProductEventAddToCart({this.notes});

  @override
  List<Object?> get props => [notes];
}

class CustomerDetailProductEventAddToWishlist extends CustomerDetailProductEvent {
  const CustomerDetailProductEventAddToWishlist();
}

class CustomerDetailProductEventRemoveFromWishlist extends CustomerDetailProductEvent {
  const CustomerDetailProductEventRemoveFromWishlist();
}
