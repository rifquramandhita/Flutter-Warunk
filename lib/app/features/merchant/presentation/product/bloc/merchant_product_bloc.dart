import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product_category.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_products_get_use_case.dart';

part 'merchant_product_event.dart';
part 'merchant_product_state.dart';

class MerchantProductBloc
    extends Bloc<MerchantProductEvent, MerchantProductState> {
  final MerchantProductsGetUseCase useCase;

  MerchantProductBloc({required this.useCase})
    : super(const MerchantProductState()) {
    on<MerchantProductEventGet>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      final result = await useCase.call();
      if (result.success && result.data != null) {
        emit(state.copyWith(isLoading: false, allProducts: result.data));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: result.message));
      }
    });

    on<MerchantProductEventTabChanged>((event, emit) {
      emit(state.copyWith(selectedTab: event.index));
    });

    on<MerchantProductEventSearchChanged>((event, emit) {
      emit(state.copyWith(searchQuery: event.query));
    });

    on<MerchantProductEventToggled>((event, emit) {
      // Toggle logic would ideally call an API, but for local state:
      final updated = state.allProducts.map((p) {
        return p.id == event.productId
            ? p.copyWith(isPublished: !p.isPublished)
            : p;
      }).toList();
      emit(state.copyWith(allProducts: updated));
    });

    on<MerchantProductEventAddTapped>((event, emit) {
      // Navigate to add product
    });
  }
}
