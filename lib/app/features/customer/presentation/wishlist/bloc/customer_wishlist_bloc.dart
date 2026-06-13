import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_wishlists_get_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_wishlist_remove_use_case.dart';
import 'package:warunk/app/features/customer/presentation/wishlist/bloc/customer_wishlist_event.dart';
import 'package:warunk/app/features/customer/presentation/wishlist/bloc/customer_wishlist_state.dart';

class CustomerWishlistBloc
    extends Bloc<CustomerWishlistEvent, CustomerWishlistState> {
  final CustomerWishlistsGetUseCase _getWishlistsUseCase;
  final CustomerWishlistRemoveUseCase _removeWishlistUseCase;

  CustomerWishlistBloc({
    required CustomerWishlistsGetUseCase getWishlistsUseCase,
    required CustomerWishlistRemoveUseCase removeWishlistUseCase,
  }) : _getWishlistsUseCase = getWishlistsUseCase,
       _removeWishlistUseCase = removeWishlistUseCase,
       super(const CustomerWishlistState()) {
    on<CustomerWishlistEventLoad>(_onLoad);
    on<CustomerWishlistEventRemove>(_onRemove);
  }

  Future<void> _onLoad(
    CustomerWishlistEventLoad event,
    Emitter<CustomerWishlistState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getWishlistsUseCase();
    if (result.data != null) {
      emit(state.copyWith(isLoading: false, wishlists: result.data));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.message));
    }
  }

  Future<void> _onRemove(
    CustomerWishlistEventRemove event,
    Emitter<CustomerWishlistState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _removeWishlistUseCase(event.productId);
    if (result.data != null) {
      // Remove from current list
      final newList = state.wishlists
          .where((item) => item.product?.id != event.productId)
          .toList();
      emit(state.copyWith(isLoading: false, wishlists: newList));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.message));
    }
  }
}
