part of 'merchant_input_address_bloc.dart';

class MerchantInputAddressState extends Equatable {
  final String address;
  final String province;
  final String city;
  final String district;
  final String postalCode;
  final double longitude;
  final double latitude;
  final bool isLoading;
  final bool isSuccess;
  final bool isInitialLoaded;
  final String? errorMessage;

  const MerchantInputAddressState({
    this.address = '',
    this.province = '',
    this.city = '',
    this.district = '',
    this.postalCode = '',
    this.longitude = 0.0,
    this.latitude = 0.0,
    this.isLoading = false,
    this.isSuccess = false,
    this.isInitialLoaded = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
    address,
    province,
    city,
    district,
    postalCode,
    longitude,
    latitude,
    isLoading,
    isSuccess,
    isInitialLoaded,
    errorMessage,
  ];

  bool get isValid =>
      address.trim().isNotEmpty &&
      province.trim().isNotEmpty &&
      city.trim().isNotEmpty &&
      district.trim().isNotEmpty &&
      postalCode.trim().isNotEmpty &&
      longitude != 0.0 &&
      latitude != 0.0;

  MerchantInputAddressState copyWith({
    String? address,
    String? province,
    String? city,
    String? district,
    String? postalCode,
    double? longitude,
    double? latitude,
    bool? isLoading,
    bool? isSuccess,
    bool? isInitialLoaded,
    String? errorMessage,
  }) {
    return MerchantInputAddressState(
      address: address ?? this.address,
      province: province ?? this.province,
      city: city ?? this.city,
      district: district ?? this.district,
      postalCode: postalCode ?? this.postalCode,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? false,
      isInitialLoaded: isInitialLoaded ?? this.isInitialLoaded,
      errorMessage: errorMessage,
    );
  }
}
