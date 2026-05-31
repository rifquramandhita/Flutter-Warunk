part of 'customer_input_address_bloc.dart';

class CustomerInputAddressState extends Equatable {
  final String? id;
  final String recipientName;
  final String phone;
  final String label;
  final String address;
  final String province;
  final String city;
  final String district;
  final String postalCode;
  final double longitude;
  final double latitude;
  final String notes;
  final bool isDefault;

  final bool isInitialLoaded;
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  const CustomerInputAddressState({
    this.id,
    this.recipientName = '',
    this.phone = '',
    this.label = '',
    this.address = '',
    this.province = '',
    this.city = '',
    this.district = '',
    this.postalCode = '',
    this.longitude = 0.0,
    this.latitude = 0.0,
    this.notes = '',
    this.isDefault = false,
    this.isInitialLoaded = false,
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  CustomerInputAddressState copyWith({
    String? id,
    String? recipientName,
    String? phone,
    String? label,
    String? address,
    String? province,
    String? city,
    String? district,
    String? postalCode,
    double? longitude,
    double? latitude,
    String? notes,
    bool? isDefault,
    bool? isInitialLoaded,
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return CustomerInputAddressState(
      id: id ?? this.id,
      recipientName: recipientName ?? this.recipientName,
      phone: phone ?? this.phone,
      label: label ?? this.label,
      address: address ?? this.address,
      province: province ?? this.province,
      city: city ?? this.city,
      district: district ?? this.district,
      postalCode: postalCode ?? this.postalCode,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      notes: notes ?? this.notes,
      isDefault: isDefault ?? this.isDefault,
      isInitialLoaded: isInitialLoaded ?? this.isInitialLoaded,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? false,
    );
  }

  bool get isValid =>
      recipientName.isNotEmpty &&
      phone.isNotEmpty &&
      label.isNotEmpty &&
      address.isNotEmpty &&
      province.isNotEmpty &&
      city.isNotEmpty &&
      district.isNotEmpty &&
      postalCode.isNotEmpty;

  @override
  List<Object?> get props => [
    id,
    recipientName,
    phone,
    label,
    address,
    province,
    city,
    district,
    postalCode,
    longitude,
    latitude,
    notes,
    isDefault,
    isInitialLoaded,
    isLoading,
    errorMessage,
    isSuccess,
  ];
}
