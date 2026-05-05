import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_address_event.dart';
import 'customer_address_state.dart';

class CustomerAddressBloc extends Bloc<CustomerAddressEvent, CustomerAddressState> {
  CustomerAddressBloc() : super(const CustomerAddressState()) {
    on<CustomerLoadAddresses>(_onLoadAddresses);
    on<CustomerSelectAddress>(_onSelectAddress);
  }

  void _onLoadAddresses(CustomerLoadAddresses event, Emitter<CustomerAddressState> emit) {
    emit(state.copyWith(isLoading: true));
    
    // Simulate loading dummy data
    const dummyAddresses = [
      CustomerAddressItem(
        id: '1',
        name: 'Andi Pratama',
        phone: '0812-3456-7890',
        address: 'Jl. Raya Bekasi No. 10,\nJakarta Timur',
        isPrimary: true,
        icon: Icons.home_outlined,
      ),
      CustomerAddressItem(
        id: '2',
        name: 'Ibu Sari',
        phone: '0813-7777-2200',
        address: 'Perumahan Harapan Indah\nBlok C2 No. 8, Bekasi',
        isPrimary: false,
        icon: Icons.home_outlined,
      ),
      CustomerAddressItem(
        id: '3',
        name: 'Kantor',
        phone: '021-88990011',
        address: 'Jl. Pemuda No. 15,\nRawamangun, Jakarta Timur',
        isPrimary: false,
        icon: Icons.business_outlined,
      ),
    ];

    emit(state.copyWith(
      isLoading: false,
      addresses: dummyAddresses,
      selectedAddressId: '1', // Default selected
    ));
  }

  void _onSelectAddress(CustomerSelectAddress event, Emitter<CustomerAddressState> emit) {
    emit(state.copyWith(selectedAddressId: event.id));
  }
}
