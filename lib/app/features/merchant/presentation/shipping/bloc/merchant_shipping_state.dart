part of 'merchant_shipping_bloc.dart';

class MerchantShippingState {
  final bool pickupAtStore;
  final bool internalCourier;
  final bool instantCourier;
  final int maxDistanceInternalCourier;
  final List<String> availableCouriers;
  final List<String> selectedCouriers;
  
  final bool isLoadingData;
  final bool isSaving;
  final bool isSaved;
  final String? errorMessage;

  const MerchantShippingState({
    this.pickupAtStore = false,
    this.internalCourier = false,
    this.instantCourier = false,
    this.maxDistanceInternalCourier = 0,
    this.availableCouriers = const [],
    this.selectedCouriers = const [],
    this.isLoadingData = false,
    this.isSaving = false,
    this.isSaved = false,
    this.errorMessage,
  });

  MerchantShippingState copyWith({
    bool? pickupAtStore,
    bool? internalCourier,
    bool? instantCourier,
    int? maxDistanceInternalCourier,
    List<String>? availableCouriers,
    List<String>? selectedCouriers,
    bool? isLoadingData,
    bool? isSaving,
    bool? isSaved,
    String? errorMessage,
  }) {
    return MerchantShippingState(
      pickupAtStore: pickupAtStore ?? this.pickupAtStore,
      internalCourier: internalCourier ?? this.internalCourier,
      instantCourier: instantCourier ?? this.instantCourier,
      maxDistanceInternalCourier: maxDistanceInternalCourier ?? this.maxDistanceInternalCourier,
      availableCouriers: availableCouriers ?? this.availableCouriers,
      selectedCouriers: selectedCouriers ?? this.selectedCouriers,
      isLoadingData: isLoadingData ?? this.isLoadingData,
      isSaving: isSaving ?? this.isSaving,
      isSaved: isSaved ?? this.isSaved,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
