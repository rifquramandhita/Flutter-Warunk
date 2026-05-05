import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_edit_profil_event.dart';
part 'merchant_edit_profil_state.dart';

class MerchantEditProfilBloc
    extends Bloc<MerchantEditProfilEvent, MerchantEditProfilState> {
  MerchantEditProfilBloc() : super(const MerchantEditProfilState()) {
    on<MerchantEditNamaToko>((event, emit) {
      emit(state.copyWith(namaToko: event.value));
    });
    on<MerchantEditKategoriToko>((event, emit) {
      emit(state.copyWith(kategoriToko: event.value));
    });
    on<MerchantEditWhatsApp>((event, emit) {
      emit(state.copyWith(whatsapp: event.value));
    });
    on<MerchantEditEmail>((event, emit) {
      emit(state.copyWith(email: event.value));
    });
    on<MerchantEditFotoTapped>((event, emit) {
      // TODO: open image picker
    });
    on<MerchantEditProfilSaved>((event, emit) async {
      emit(state.copyWith(isSaving: true));
      await Future<void>.delayed(const Duration(milliseconds: 800));
      emit(state.copyWith(isSaving: false, isSaved: true));
    });
  }
}
