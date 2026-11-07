part of 'merchant_input_address_bloc.dart';

class MerchantInputAddressState extends Equatable {
  final String address;
  final String postalCode;
  final double longitude;
  final double latitude;

  final List<MerchantProvinceEntity> provinces;
  final List<MerchantRegencyEntity> regencies;
  final List<MerchantDistrictEntity> districts;

  final MerchantProvinceEntity? selectedProvince;
  final MerchantRegencyEntity? selectedRegency;
  final MerchantDistrictEntity? selectedDistrict;

  final bool isLoading;
  final bool isLoadingProvinces;
  final bool isLoadingRegencies;
  final bool isLoadingDistricts;
  final bool isSuccess;
  final bool isInitialLoaded;
  final String? errorMessage;

  const MerchantInputAddressState({
    this.address = '',
    this.postalCode = '',
    this.longitude = 0.0,
    this.latitude = 0.0,
    this.provinces = const [],
    this.regencies = const [],
    this.districts = const [],
    this.selectedProvince,
    this.selectedRegency,
    this.selectedDistrict,
    this.isLoading = false,
    this.isLoadingProvinces = false,
    this.isLoadingRegencies = false,
    this.isLoadingDistricts = false,
    this.isSuccess = false,
    this.isInitialLoaded = false,
    this.errorMessage,
  });

  String get province => selectedProvince?.name ?? '';
  String get city => selectedRegency?.name ?? '';
  String get district => selectedDistrict?.name ?? '';

  @override
  List<Object?> get props => [
    address,
    postalCode,
    longitude,
    latitude,
    provinces,
    regencies,
    districts,
    selectedProvince,
    selectedRegency,
    selectedDistrict,
    isLoading,
    isLoadingProvinces,
    isLoadingRegencies,
    isLoadingDistricts,
    isSuccess,
    isInitialLoaded,
    errorMessage,
  ];

  bool get isValid =>
      address.trim().isNotEmpty &&
      selectedDistrict != null &&
      postalCode.trim().isNotEmpty &&
      longitude != 0.0 &&
      latitude != 0.0;

  MerchantInputAddressState copyWith({
    String? address,
    String? postalCode,
    double? longitude,
    double? latitude,
    List<MerchantProvinceEntity>? provinces,
    List<MerchantRegencyEntity>? regencies,
    List<MerchantDistrictEntity>? districts,
    MerchantProvinceEntity? selectedProvince,
    bool clearSelectedProvince = false,
    MerchantRegencyEntity? selectedRegency,
    bool clearSelectedRegency = false,
    MerchantDistrictEntity? selectedDistrict,
    bool clearSelectedDistrict = false,
    bool? isLoading,
    bool? isLoadingProvinces,
    bool? isLoadingRegencies,
    bool? isLoadingDistricts,
    bool? isSuccess,
    bool? isInitialLoaded,
    String? errorMessage,
  }) {
    return MerchantInputAddressState(
      address: address ?? this.address,
      postalCode: postalCode ?? this.postalCode,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      provinces: provinces ?? this.provinces,
      regencies: regencies ?? this.regencies,
      districts: districts ?? this.districts,
      selectedProvince: clearSelectedProvince
          ? null
          : (selectedProvince ?? this.selectedProvince),
      selectedRegency: clearSelectedRegency
          ? null
          : (selectedRegency ?? this.selectedRegency),
      selectedDistrict: clearSelectedDistrict
          ? null
          : (selectedDistrict ?? this.selectedDistrict),
      isLoading: isLoading ?? this.isLoading,
      isLoadingProvinces: isLoadingProvinces ?? this.isLoadingProvinces,
      isLoadingRegencies: isLoadingRegencies ?? this.isLoadingRegencies,
      isLoadingDistricts: isLoadingDistricts ?? this.isLoadingDistricts,
      isSuccess: isSuccess ?? false,
      isInitialLoaded: isInitialLoaded ?? this.isInitialLoaded,
      errorMessage: errorMessage,
    );
  }
}
