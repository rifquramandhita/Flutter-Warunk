import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_preview_store_event.dart';
part 'merchant_preview_store_state.dart';

class MerchantPreviewStoreBloc
    extends Bloc<MerchantPreviewStoreEvent, MerchantPreviewStoreState> {
  MerchantPreviewStoreBloc() : super(const MerchantPreviewStoreState()) {
    on<MerchantPreviewStoreTabChanged>((event, emit) {
      emit(state.copyWith(selectedTabIndex: event.index));
    });
    
    on<MerchantPreviewStoreEditTapped>((event, emit) {
      // Navigate to edit screen, usually handled in UI via BlocListener or direct routing
    });
  }
}
