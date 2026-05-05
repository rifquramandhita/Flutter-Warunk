import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_profil_event.dart';
import 'customer_profil_state.dart';

class CustomerProfilBloc extends Bloc<CustomerProfilEvent, CustomerProfilState> {
  CustomerProfilBloc() : super(const CustomerProfilState()) {
    on<CustomerLoadProfilData>(_onLoadProfilData);
  }

  void _onLoadProfilData(CustomerLoadProfilData event, Emitter<CustomerProfilState> emit) {
    emit(state.copyWith(isLoading: true));
    
    // Simulate loading
    emit(state.copyWith(
      isLoading: false,
      name: 'Andi Pratama',
      phone: '0812-3456-7890',
      location: 'Jakarta Timur',
      transactionCount: 12,
      voucherCount: 3,
      favoriteCount: 8,
      unreadNotifications: 3,
    ));
  }
}
