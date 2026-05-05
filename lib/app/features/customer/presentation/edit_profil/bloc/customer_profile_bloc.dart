import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_profile_event.dart';
import 'customer_profile_state.dart';

class CustomerProfileBloc extends Bloc<CustomerProfileEvent, CustomerProfileState> {
  CustomerProfileBloc() : super(const CustomerProfileState()) {
    on<CustomerLoadProfile>(_onLoadProfile);
    on<CustomerUpdateProfileField>(_onUpdateProfileField);
    on<CustomerSaveProfile>(_onSaveProfile);
  }

  void _onLoadProfile(CustomerLoadProfile event, Emitter<CustomerProfileState> emit) {
    emit(state.copyWith(isLoading: true));
    
    // Simulating API call to load dummy data
    emit(state.copyWith(
      isLoading: false,
      name: 'Andi Pratama',
      email: 'andi@email.com',
      phone: '0812-3456-7890',
      city: 'Jakarta Timur',
      birthDate: '12 Jan 2001',
      gender: 'Laki-laki',
    ));
  }

  void _onUpdateProfileField(CustomerUpdateProfileField event, Emitter<CustomerProfileState> emit) {
    switch (event.field) {
      case 'name':
        emit(state.copyWith(name: event.value));
        break;
      case 'email':
        emit(state.copyWith(email: event.value));
        break;
      case 'phone':
        emit(state.copyWith(phone: event.value));
        break;
      case 'city':
        emit(state.copyWith(city: event.value));
        break;
      case 'birthDate':
        emit(state.copyWith(birthDate: event.value));
        break;
      case 'gender':
        emit(state.copyWith(gender: event.value));
        break;
    }
  }

  Future<void> _onSaveProfile(CustomerSaveProfile event, Emitter<CustomerProfileState> emit) async {
    emit(state.copyWith(isSaving: true));
    
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Example validation
    if (state.name.isEmpty || state.email.isEmpty) {
      emit(state.copyWith(isSaving: false, errorMessage: 'Nama dan Email tidak boleh kosong.'));
      return;
    }

    // Success save
    emit(state.copyWith(isSaving: false, errorMessage: null));
  }
}
