import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_wishlist.dart';

class CustomerWishlistState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<CustomerWishlistEntity> wishlists;

  const CustomerWishlistState({
    this.isLoading = false,
    this.errorMessage,
    this.wishlists = const [],
  });

  CustomerWishlistState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CustomerWishlistEntity>? wishlists,
  }) {
    return CustomerWishlistState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      wishlists: wishlists ?? this.wishlists,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, wishlists];
}
