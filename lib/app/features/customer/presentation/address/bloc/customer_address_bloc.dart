import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_address_get_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_address_set_default_use_case.dart';
import 'package:warunk/core/network/data_state.dart';
import 'customer_address_event.dart';
import 'customer_address_state.dart';

class CustomerAddressBloc extends Bloc<CustomerAddressEvent, CustomerAddressState> {
  final CustomerAddressGetUseCase _getUseCase;
  final CustomerAddressSetDefaultUseCase _setDefaultUseCase;

  CustomerAddressBloc({
    required CustomerAddressGetUseCase getUseCase,
    required CustomerAddressSetDefaultUseCase setDefaultUseCase,
  })  : _getUseCase = getUseCase,
        _setDefaultUseCase = setDefaultUseCase,
        super(const CustomerAddressState()) {
    on<CustomerAddressEventLoadAddresses>(_onLoadAddresses);
    on<CustomerAddressEventSetDefaultAddress>(_onSetDefaultAddress);
  }

  Future<void> _onLoadAddresses(
      CustomerAddressEventLoadAddresses event, Emitter<CustomerAddressState> emit) async {
    emit(state.copyWith(isLoading: true));

    final response = await _getUseCase.call();

    if (response is SuccessState) {
      final addresses = response.data ?? [];
      String? defaultSelectedId;
      if (addresses.isNotEmpty) {
        final defaultAddress = addresses.cast<dynamic>().firstWhere(
            (element) => element.isDefault == true,
            orElse: () => addresses.first);
        defaultSelectedId = defaultAddress.id;
      }
      emit(state.copyWith(
        addresses: addresses,
        selectedAddressId: defaultSelectedId,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: response.message,
      ));
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onSetDefaultAddress(
      CustomerAddressEventSetDefaultAddress event, Emitter<CustomerAddressState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await _setDefaultUseCase.call(event.id);
    if (response is SuccessState) {
      add(CustomerAddressEventLoadAddresses());
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: response.message));
    }
  }
}
