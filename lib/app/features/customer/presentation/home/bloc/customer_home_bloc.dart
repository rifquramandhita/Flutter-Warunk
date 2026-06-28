import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_category.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_category_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_nearby_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_location_get_current_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'customer_home_event.dart';
part 'customer_home_state.dart';

class CustomerHomeBloc extends Bloc<CustomerHomeEvent, CustomerHomeState> {
  final CustomerMerchantGetCategoryUseCase _getCategoryUseCase;
  final CustomerMerchantGetNearbyUseCase _getNearbyUseCase;
  final CustomerLocationGetCurrentUseCase _getCurrentLocationUseCase;

  CustomerHomeBloc({
    required CustomerMerchantGetCategoryUseCase getCategoryUseCase,
    required CustomerMerchantGetNearbyUseCase getNearbyUseCase,
    required CustomerLocationGetCurrentUseCase getCurrentLocationUseCase,
  }) : _getCategoryUseCase = getCategoryUseCase,
       _getNearbyUseCase = getNearbyUseCase,
       _getCurrentLocationUseCase = getCurrentLocationUseCase,
       super(const CustomerHomeState()) {
    on<CustomerHomeBannerChanged>(_onBannerChanged);
    on<CustomerHomeGetCategoriesStarted>(_onGetCategoriesStarted);
    on<CustomerHomeGetNearbyStarted>(_onGetNearbyStarted);
  }

  void _onBannerChanged(
    CustomerHomeBannerChanged event,
    Emitter<CustomerHomeState> emit,
  ) {
    emit(state.copyWith(currentBanner: event.index));
  }

  Future<void> _onGetCategoriesStarted(
    CustomerHomeGetCategoriesStarted event,
    Emitter<CustomerHomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingCategories: true, errorMessage: null));

    final result = await _getCategoryUseCase();

    if (result is ErrorState) {
      emit(
        state.copyWith(
          isLoadingCategories: false,
          errorMessage: result.message,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoadingCategories: false,
          categories: result.data ?? [],
        ),
      );
    }
  }

  Future<void> _onGetNearbyStarted(
    CustomerHomeGetNearbyStarted event,
    Emitter<CustomerHomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingNearby: true, errorMessage: null));

    final locationResult = await _getCurrentLocationUseCase();

    if (locationResult is ErrorState) {
      emit(
        state.copyWith(
          isLoadingNearby: false,
          errorMessage: locationResult.message,
        ),
      );
      return;
    }

    final location = locationResult.data;
    if (location == null) {
      emit(
        state.copyWith(
          isLoadingNearby: false,
          errorMessage: 'Lokasi tidak ditemukan',
        ),
      );
      return;
    }

    final result = await _getNearbyUseCase(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    if (result is ErrorState) {
      emit(
        state.copyWith(
          isLoadingNearby: false,
          errorMessage: result.message,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoadingNearby: false,
          nearbyMerchants: result.data ?? [],
        ),
      );
    }
  }
}
