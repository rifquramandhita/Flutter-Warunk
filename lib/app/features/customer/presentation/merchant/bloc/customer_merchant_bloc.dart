import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_by_quick_filter_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_location_get_current_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

import 'customer_merchant_event.dart';
import 'customer_merchant_state.dart';

class CustomerMerchantBloc extends Bloc<CustomerMerchantEvent, CustomerMerchantState> {
  final CustomerMerchantGetUseCase _getUseCase;
  final CustomerMerchantGetByQuickFilterUseCase _getByQuickFilterUseCase;
  final CustomerLocationGetCurrentUseCase _getCurrentLocationUseCase;

  CustomerMerchantBloc({
    required CustomerMerchantGetUseCase getUseCase,
    required CustomerMerchantGetByQuickFilterUseCase getByQuickFilterUseCase,
    required CustomerLocationGetCurrentUseCase getCurrentLocationUseCase,
  })  : _getUseCase = getUseCase,
        _getByQuickFilterUseCase = getByQuickFilterUseCase,
        _getCurrentLocationUseCase = getCurrentLocationUseCase,
        super(const CustomerMerchantState()) {
    on<CustomerMerchantEventGet>(_onGetMerchants);
  }

  Future<void> _onGetMerchants(
    CustomerMerchantEventGet event,
    Emitter<CustomerMerchantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    if (event.key != null) {
      final locationResult = await _getCurrentLocationUseCase();
      if (locationResult is ErrorState) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: locationResult.message ?? 'Gagal mendapatkan lokasi',
        ));
        return;
      }
      
      final location = locationResult.data;
      if (location == null) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: 'Lokasi tidak ditemukan',
        ));
        return;
      }

      final result = await _getByQuickFilterUseCase(
        key: event.key!,
        latitude: location.latitude,
        longitude: location.longitude,
      );

      if (result is ErrorState) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: result.message ?? 'Gagal memuat daftar warung',
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          merchants: result.data ?? [],
        ));
      }
    } else {
      final result = await _getUseCase(category: event.categorySlug);

      if (result is ErrorState) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: result.message ?? 'Gagal memuat daftar warung',
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          merchants: result.data ?? [],
        ));
      }
    }
  }
}
