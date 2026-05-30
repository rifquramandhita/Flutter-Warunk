import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'customer_profil_event.dart';
import 'customer_profil_state.dart';

class CustomerProfilBloc
    extends Bloc<CustomerProfilEvent, CustomerProfilState> {
  CustomerProfilBloc() : super(const CustomerProfilState()) {
    on<CustomerLoadProfilData>(_onLoadProfilData);
  }

  Future<void> _onLoadProfilData(
    CustomerLoadProfilData event,
    Emitter<CustomerProfilState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final name = await SharedPreferencesHelper.getString(PREF_NAME) ?? '-';
    final phone = await SharedPreferencesHelper.getString(PREF_PHONE) ?? '-';

    // Simulate loading
    emit(
      state.copyWith(
        isLoading: false,
        name: name,
        phone: phone,
        transactionCount: 12,
        voucherCount: 3,
        favoriteCount: 8,
        unreadNotifications: 3,
      ),
    );
  }
}
