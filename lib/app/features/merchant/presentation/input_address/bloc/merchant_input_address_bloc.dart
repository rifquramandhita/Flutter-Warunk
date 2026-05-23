import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_update_location_use_case.dart';
import 'package:equatable/equatable.dart';

part 'merchant_input_address_event.dart';
part 'merchant_input_address_state.dart';

class MerchantInputAddressBloc
    extends Bloc<MerchantInputAddressEvent, MerchantInputAddressState> {
  final MerchantMerchantGetUseCase _getUseCase;
  final MerchantMerchantUpdateLocationUseCase _updateLocationUseCase;

  MerchantInputAddressBloc(this._getUseCase, this._updateLocationUseCase)
    : super(const MerchantInputAddressState()) {
    on<MerchantInputAddressEventGet>(_onGet);
    on<MerchantInputAddressEventAddressChanged>(_onAddressChanged);
    on<MerchantInputAddressEventProvinceChanged>(_onProvinceChanged);
    on<MerchantInputAddressEventCityChanged>(_onCityChanged);
    on<MerchantInputAddressEventDistrictChanged>(_onDistrictChanged);
    on<MerchantInputAddressEventPostalCodeChanged>(_onPostalCodeChanged);
    on<MerchantInputAddressEventLocationChanged>(_onLocationChanged);
    on<MerchantInputAddressEventSaved>(_onSaved);
  }

  Future<void> _onGet(
    MerchantInputAddressEventGet event,
    Emitter<MerchantInputAddressState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final response = await _getUseCase.call();

    if (response.success) {
      final merchant = response.data!;
      emit(
        state.copyWith(
          address: merchant.address ?? '',
          province: merchant.province ?? '',
          city: merchant.city ?? '',
          district: merchant.district ?? '',
          postalCode: merchant.postalCode ?? '',
          latitude: merchant.latitude ?? 0.0,
          longitude: merchant.longitude ?? 0.0,
          isInitialLoaded: true,
        ),
      );
    } else {
      emit(
        state.copyWith(errorMessage: response.message, isInitialLoaded: true),
      );
    }

    emit(state.copyWith(isLoading: false));
  }

  void _onAddressChanged(
    MerchantInputAddressEventAddressChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) {
    emit(state.copyWith(address: event.address));
  }

  void _onProvinceChanged(
    MerchantInputAddressEventProvinceChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) {
    emit(state.copyWith(province: event.province));
  }

  void _onCityChanged(
    MerchantInputAddressEventCityChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) {
    emit(state.copyWith(city: event.city));
  }

  void _onDistrictChanged(
    MerchantInputAddressEventDistrictChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) {
    emit(state.copyWith(district: event.district));
  }

  void _onPostalCodeChanged(
    MerchantInputAddressEventPostalCodeChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) {
    emit(state.copyWith(postalCode: event.postalCode));
  }

  void _onLocationChanged(
    MerchantInputAddressEventLocationChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) {
    emit(state.copyWith(longitude: event.longitude, latitude: event.latitude));
  }

  Future<void> _onSaved(
    MerchantInputAddressEventSaved event,
    Emitter<MerchantInputAddressState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(isLoading: true));

    final response = await _updateLocationUseCase(
      address: state.address,
      province: state.province,
      city: state.city,
      district: state.district,
      postalCode: state.postalCode,
      longitude: state.longitude,
      latitude: state.latitude,
    );

    if (response.success) {
      emit(state.copyWith(isSuccess: true));
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }

    emit(state.copyWith(isLoading: false));
  }
}
