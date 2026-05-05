import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_information_store_event.dart';
part 'merchant_information_store_state.dart';

class MerchantInformationStoreBloc
    extends Bloc<MerchantInformationStoreEvent, MerchantInformationStoreState> {
  MerchantInformationStoreBloc() : super(const MerchantInformationStoreState()) {
    on<MerchantInformationStoreLogoTapped>((e, emit) {
      // TODO: pick image
    });
    on<MerchantInformationStoreBannerTapped>((e, emit) {
      // TODO: pick image
    });
    on<MerchantInformationStoreNamaChanged>(
      (e, emit) => emit(state.copyWith(namaToko: e.value)),
    );
    on<MerchantInformationStoreKategoriChanged>(
      (e, emit) => emit(state.copyWith(kategoriToko: e.value)),
    );
    on<MerchantInformationStorePicChanged>(
      (e, emit) => emit(state.copyWith(pic: e.value)),
    );
    on<MerchantInformationStoreWhatsappChanged>(
      (e, emit) => emit(state.copyWith(whatsapp: e.value)),
    );
    on<MerchantInformationStoreKotaChanged>(
      (e, emit) => emit(state.copyWith(kota: e.value)),
    );
    on<MerchantInformationStoreAlamatChanged>(
      (e, emit) => emit(state.copyWith(alamat: e.value)),
    );
    on<MerchantInformationStoreLokasiTapped>((e, emit) {
      // TODO: open map picker
    });
    on<MerchantInformationStorePreviewTapped>((e, emit) {
      // TODO: open preview
    });
    on<MerchantInformationStoreSaved>((e, emit) async {
      if (!state.isValid) return;
      emit(state.copyWith(isSaving: true));
      await Future<void>.delayed(const Duration(milliseconds: 800));
      emit(state.copyWith(isSaving: false, isSaved: true));
    });
  }
}
