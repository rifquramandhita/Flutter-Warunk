import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product_category.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_publish_usecase.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_unpublish_usecase.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_products_get_use_case.dart';

part 'merchant_product_event.dart';
part 'merchant_product_state.dart';

class MerchantProductBloc
    extends Bloc<MerchantProductEvent, MerchantProductState> {
  final MerchantProductsGetUseCase useCase;
  final MerchantProductPublishUseCase publishUseCase;
  final MerchantProductUnpublishUseCase unpublishUseCase;

  MerchantProductBloc({
    required this.useCase,
    required this.publishUseCase,
    required this.unpublishUseCase,
  }) : super(const MerchantProductState()) {
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

    on<MerchantProductEventToggled>((event, emit) async {
      final productIndex =
          state.allProducts.indexWhere((p) => p.id == event.productId);
      if (productIndex == -1) return;

      final product = state.allProducts[productIndex];
      final isCurrentlyPublished = product.isPublished;

      emit(state.copyWith(isLoading: true, errorMessage: null));

      final result = isCurrentlyPublished
          ? await unpublishUseCase.call(product.id)
          : await publishUseCase.call(product.id);

      if (result.success) {
        final updated = List<MerchantProductEntity>.from(state.allProducts);
        updated[productIndex] =
            product.copyWith(isPublished: !isCurrentlyPublished);
        emit(state.copyWith(isLoading: false, allProducts: updated));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: result.message));
      }
    });

    on<MerchantProductEventAddTapped>((event, emit) {
      // Navigate to add product
    });
  }
}
