import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_order_get_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_wishlists_get_use_case.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'customer_profil_event.dart';
import 'customer_profil_state.dart';

class CustomerProfilBloc
    extends Bloc<CustomerProfilEvent, CustomerProfilState> {
  final CustomerOrderGetUseCase _orderGetUseCase;
  final CustomerWishlistsGetUseCase _wishlistsGetUseCase;

  CustomerProfilBloc({
    required CustomerOrderGetUseCase orderGetUseCase,
    required CustomerWishlistsGetUseCase wishlistsGetUseCase,
  })  : _orderGetUseCase = orderGetUseCase,
        _wishlistsGetUseCase = wishlistsGetUseCase,
        super(const CustomerProfilState()) {
    on<CustomerLoadProfilData>(_onLoadProfilData);
    on<CustomerLaunchUrlEvent>(_onLaunchUrl);
  }

  Future<void> _onLoadProfilData(
    CustomerLoadProfilData event,
    Emitter<CustomerProfilState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final name = await SharedPreferencesHelper.getString(PREF_NAME) ?? '-';
    final phone = await SharedPreferencesHelper.getString(PREF_PHONE) ?? '-';

    int transactionCount = 0;
    int favoriteCount = 0;

    try {
      final orderResult = await _orderGetUseCase.call();
      if (orderResult.data != null) {
        transactionCount = orderResult.data!.length;
      }
    } catch (e) {
      // ignore error
    }

    try {
      final wishlistResult = await _wishlistsGetUseCase.call();
      if (wishlistResult.data != null) {
        favoriteCount = wishlistResult.data!.length;
      }
    } catch (e) {
      // ignore error
    }

    emit(
      state.copyWith(
        isLoading: false,
        name: name,
        phone: phone,
        transactionCount: transactionCount,
        voucherCount: 0,
        favoriteCount: favoriteCount,
        unreadNotifications: 3,
      ),
    );
  }

  Future<void> _onLaunchUrl(
    CustomerLaunchUrlEvent event,
    Emitter<CustomerProfilState> emit,
  ) async {
    try {
      final uri = Uri.parse(event.url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        emit(state.copyWith(errorMessage: 'Tidak dapat membuka tautan'));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Terjadi kesalahan: ${e.toString()}'));
    }
  }
}
