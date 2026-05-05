import 'package:equatable/equatable.dart';

class CustomerProfileState extends Equatable {
  final bool isLoading;
  final bool isSaving;
  final String name;
  final String email;
  final String phone;
  final String city;
  final String birthDate;
  final String gender;
  final String? errorMessage;

  const CustomerProfileState({
    this.isLoading = false,
    this.isSaving = false,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.city = '',
    this.birthDate = '',
    this.gender = 'Laki-laki',
    this.errorMessage,
  });

  CustomerProfileState copyWith({
    bool? isLoading,
    bool? isSaving,
    String? name,
    String? email,
    String? phone,
    String? city,
    String? birthDate,
    String? gender,
    String? errorMessage,
  }) {
    return CustomerProfileState(
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      errorMessage: errorMessage, // deliberately allowing null
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isSaving,
    name,
    email,
    phone,
    city,
    birthDate,
    gender,
    errorMessage,
  ];
}
