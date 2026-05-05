import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_product_event.dart';
part 'merchant_product_state.dart';

class MerchantProductBloc
    extends Bloc<MerchantProductEvent, MerchantProductState> {
  MerchantProductBloc() : super(const MerchantProductState()) {
    on<MerchantProductTabChanged>((event, emit) {
      emit(state.copyWith(selectedTab: event.index));
    });

    on<MerchantProductSearchChanged>((event, emit) {
      emit(state.copyWith(searchQuery: event.query));
    });

    on<MerchantProductToggled>((event, emit) {
      final updated = state.allProducts.map((p) {
        return p.id == event.productId ? p.copyWith(isActive: !p.isActive) : p;
      }).toList();
      emit(state.copyWith(allProducts: updated));
    });

    on<MerchantProductAddTapped>((event, emit) {
      // TODO: navigate to add product page
    });
  }
}
