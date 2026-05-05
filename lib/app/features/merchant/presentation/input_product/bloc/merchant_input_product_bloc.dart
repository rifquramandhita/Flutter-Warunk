import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_input_product_event.dart';
part 'merchant_input_product_state.dart';

class MerchantInputProductBloc
    extends Bloc<MerchantInputProductEvent, MerchantInputProductState> {
  MerchantInputProductBloc() : super(const MerchantInputProductState()) {
    on<MerchantInputProductNamaChanged>(
      (e, emit) => emit(state.copyWith(nama: e.value)),
    );
    on<MerchantInputProductKategoriChanged>(
      (e, emit) => emit(state.copyWith(kategori: e.value)),
    );
    on<MerchantInputProductHargaChanged>(
      (e, emit) => emit(state.copyWith(harga: e.value)),
    );
    on<MerchantInputProductStokChanged>(
      (e, emit) => emit(state.copyWith(stok: e.value)),
    );
    on<MerchantInputProductSatuanChanged>(
      (e, emit) => emit(state.copyWith(satuan: e.value)),
    );
    on<MerchantInputProductDeskripsiChanged>(
      (e, emit) => emit(state.copyWith(deskripsi: e.value)),
    );
    on<MerchantInputProductTampilkanToggled>(
      (e, emit) => emit(state.copyWith(tampilkan: !state.tampilkan)),
    );
    on<MerchantInputProductFotoTapped>((e, emit) {
      // TODO: open image picker, then set hasFoto = true
    });
    on<MerchantInputProductSaved>((e, emit) async {
      if (!state.isValid) return;
      emit(state.copyWith(isSaving: true));
      await Future<void>.delayed(const Duration(milliseconds: 800));
      emit(state.copyWith(isSaving: false, isSaved: true));
    });
  }
}
