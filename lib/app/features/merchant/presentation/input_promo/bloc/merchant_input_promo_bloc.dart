import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_input_promo_event.dart';
part 'merchant_input_promo_state.dart';

class MerchantInputPromoBloc
    extends Bloc<MerchantInputPromoEvent, MerchantInputPromoState> {
  MerchantInputPromoBloc() : super(const MerchantInputPromoState()) {
    on<MerchantInputPromoTipeChanged>(
      (e, emit) => emit(state.copyWith(tipe: e.value, nilai: '')),
    );
    on<MerchantInputPromoNamaChanged>(
      (e, emit) => emit(state.copyWith(nama: e.value)),
    );
    on<MerchantInputPromoNilaiChanged>(
      (e, emit) => emit(state.copyWith(nilai: e.value)),
    );
    on<MerchantInputPromoMinBeliChanged>(
      (e, emit) => emit(state.copyWith(minBeli: e.value)),
    );
    on<MerchantInputPromoMulaiChanged>(
      (e, emit) => emit(state.copyWith(mulai: e.date)),
    );
    on<MerchantInputPromoSelesaiChanged>(
      (e, emit) => emit(state.copyWith(selesai: e.date)),
    );
    on<MerchantInputPromoKuotaChanged>(
      (e, emit) => emit(state.copyWith(kuota: e.value)),
    );
    on<MerchantInputPromoSaved>((e, emit) async {
      if (!state.isValid) return;
      emit(state.copyWith(isSaving: true));
      await Future<void>.delayed(const Duration(milliseconds: 800));
      emit(state.copyWith(isSaving: false, isSaved: true));
    });
  }
}
