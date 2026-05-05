import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_profil_event.dart';
part 'merchant_profil_state.dart';

class MerchantProfilBloc
    extends Bloc<MerchantProfilEvent, MerchantProfilState> {
  MerchantProfilBloc() : super(const MerchantProfilState()) {
    on<MerchantProfilEditTapped>((event, emit) {
      // TODO: navigate to edit profile page
    });

    on<MerchantProfilLogoutTapped>((event, emit) {
      emit(state.copyWith(isLoggingOut: true));
      // TODO: clear session and navigate to login
    });
  }
}
