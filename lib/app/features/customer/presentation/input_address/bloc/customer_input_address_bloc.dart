import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_address_get_by_id_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_address_send_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_location_get_placemark_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'customer_input_address_event.dart';
part 'customer_input_address_state.dart';

class CustomerInputAddressBloc
    extends Bloc<CustomerInputAddressEvent, CustomerInputAddressState> {
  final CustomerAddressGetByIdUseCase _getByIdUseCase;
  final CustomerAddressSendUseCase _sendUseCase;
  final CustomerLocationGetPlacemarkUseCase _getPlacemarkUseCase;

  CustomerInputAddressBloc(
    this._getByIdUseCase,
    this._sendUseCase,
    this._getPlacemarkUseCase,
  ) : super(const CustomerInputAddressState()) {
    on<CustomerInputAddressEventInit>(_onInit);
    on<CustomerInputAddressEventRecipientNameChanged>(_onRecipientNameChanged);
    on<CustomerInputAddressEventPhoneChanged>(_onPhoneChanged);
    on<CustomerInputAddressEventLabelChanged>(_onLabelChanged);
    on<CustomerInputAddressEventAddressChanged>(_onAddressChanged);
    on<CustomerInputAddressEventProvinceChanged>(_onProvinceChanged);
    on<CustomerInputAddressEventCityChanged>(_onCityChanged);
    on<CustomerInputAddressEventDistrictChanged>(_onDistrictChanged);
    on<CustomerInputAddressEventPostalCodeChanged>(_onPostalCodeChanged);
    on<CustomerInputAddressEventLocationChanged>(_onLocationChanged);
    on<CustomerInputAddressEventNotesChanged>(_onNotesChanged);
    on<CustomerInputAddressEventIsDefaultChanged>(_onIsDefaultChanged);
    on<CustomerInputAddressEventSaved>(_onSaved);
  }

  Future<void> _onInit(
    CustomerInputAddressEventInit event,
    Emitter<CustomerInputAddressState> emit,
  ) async {
    if (event.id != null) {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      final response = await _getByIdUseCase(event.id!);

      if (response is SuccessState) {
        final addr = response.data!;
        emit(
          state.copyWith(
            id: addr.id,
            recipientName: addr.recipientName,
            phone: addr.phone,
            label: addr.label,
            address: addr.address,
            province: addr.province,
            city: addr.city,
            district: addr.district,
            postalCode: addr.postalCode,
            longitude: addr.longitude,
            latitude: addr.latitude,
            notes: addr.notes ?? '',
            isDefault: addr.isDefault,
            isInitialLoaded: true,
          ),
        );
      } else {
        emit(state.copyWith(errorMessage: response.message, isInitialLoaded: true));
      }
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(isInitialLoaded: true));
    }
  }

  void _onRecipientNameChanged(
    CustomerInputAddressEventRecipientNameChanged event,
    Emitter<CustomerInputAddressState> emit,
  ) {
    emit(state.copyWith(recipientName: event.recipientName));
  }

  void _onPhoneChanged(
    CustomerInputAddressEventPhoneChanged event,
    Emitter<CustomerInputAddressState> emit,
  ) {
    emit(state.copyWith(phone: event.phone));
  }

  void _onLabelChanged(
    CustomerInputAddressEventLabelChanged event,
    Emitter<CustomerInputAddressState> emit,
  ) {
    emit(state.copyWith(label: event.label));
  }

  void _onAddressChanged(
    CustomerInputAddressEventAddressChanged event,
    Emitter<CustomerInputAddressState> emit,
  ) {
    emit(state.copyWith(address: event.address));
  }

  void _onProvinceChanged(
    CustomerInputAddressEventProvinceChanged event,
    Emitter<CustomerInputAddressState> emit,
  ) {
    emit(state.copyWith(province: event.province));
  }

  void _onCityChanged(
    CustomerInputAddressEventCityChanged event,
    Emitter<CustomerInputAddressState> emit,
  ) {
    emit(state.copyWith(city: event.city));
  }

  void _onDistrictChanged(
    CustomerInputAddressEventDistrictChanged event,
    Emitter<CustomerInputAddressState> emit,
  ) {
    emit(state.copyWith(district: event.district));
  }

  void _onPostalCodeChanged(
    CustomerInputAddressEventPostalCodeChanged event,
    Emitter<CustomerInputAddressState> emit,
  ) {
    emit(state.copyWith(postalCode: event.postalCode));
  }

  Future<void> _onLocationChanged(
    CustomerInputAddressEventLocationChanged event,
    Emitter<CustomerInputAddressState> emit,
  ) async {
    emit(state.copyWith(
      longitude: event.longitude,
      latitude: event.latitude,
      isLoading: true,
    ));

    final result = await _getPlacemarkUseCase.call(
      params: CustomerLocationGetPlacemarkParams(
        latitude: event.latitude,
        longitude: event.longitude,
      ),
    );

    if (result is SuccessState && result.data != null) {
      emit(state.copyWith(
        province: result.data!.province.isNotEmpty ? result.data!.province : state.province,
        city: result.data!.city.isNotEmpty ? result.data!.city : state.city,
        district: result.data!.district.isNotEmpty ? result.data!.district : state.district,
        postalCode: result.data!.postalCode.isNotEmpty ? result.data!.postalCode : state.postalCode,
        address: result.data!.address.isEmpty ? state.address : result.data!.address,
      ));
    }

    emit(state.copyWith(isLoading: false));
  }

  void _onNotesChanged(
    CustomerInputAddressEventNotesChanged event,
    Emitter<CustomerInputAddressState> emit,
  ) {
    emit(state.copyWith(notes: event.notes));
  }

  void _onIsDefaultChanged(
    CustomerInputAddressEventIsDefaultChanged event,
    Emitter<CustomerInputAddressState> emit,
  ) {
    emit(state.copyWith(isDefault: event.isDefault));
  }

  Future<void> _onSaved(
    CustomerInputAddressEventSaved event,
    Emitter<CustomerInputAddressState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final param = CustomerAddressSendParam(
      id: state.id,
      recipientName: state.recipientName,
      phone: state.phone,
      label: state.label,
      address: state.address,
      province: state.province,
      city: state.city,
      district: state.district,
      postalCode: state.postalCode,
      longitude: state.longitude,
      latitude: state.latitude,
      notes: state.notes.isNotEmpty ? state.notes : null,
      isDefault: state.isDefault,
    );

    final response = await _sendUseCase(param: param);

    if (response is SuccessState) {
      emit(state.copyWith(isSuccess: true));
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }
    emit(state.copyWith(isLoading: false));
  }
}
