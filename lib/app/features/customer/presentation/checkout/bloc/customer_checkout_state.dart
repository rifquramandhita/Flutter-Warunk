part of 'customer_checkout_bloc.dart';

class CustomerCheckoutState extends Equatable {
  final DeliveryMethodEnum? deliveryMethod;
  final String? selectedExpedition;
  final bool hasVoucher;
  final bool isLoading;
  final String? errorMessage;
  final CustomerAddressEntity? address;
  final List<CustomerCartEntity> items;
  final CustomerCheckoutOptionEntity? checkoutOption;
  final String? selectedPaymentMethodKey;
  final String? notes;
  final bool isSuccess;
  final String? appliedPromoId;
  final String? appliedPromoCode;
  final String? createdOrderId;

  int get ongkir {
    if (deliveryMethod == DeliveryMethodEnum.biteship) {
      if (selectedExpedition?.isNotEmpty == true) {
        final selectedPrice = checkoutOption?.biteshipShippingOptions
            ?.where((e) => e.key == selectedExpedition)
            .firstOrNull
            ?.price;
        if (selectedPrice != null) return selectedPrice;
      }
      return 0;
    }
    return checkoutOption?.summary?.shippingCost ?? 0;
  }

  int get subtotal => checkoutOption?.summary?.subtotal ?? 0;

  int get total {
    final sTotal = checkoutOption?.summary?.total ?? 0;
    if (deliveryMethod == DeliveryMethodEnum.biteship) {
      final originalOngkir = checkoutOption?.summary?.shippingCost ?? 0;
      return sTotal - originalOngkir + ongkir;
    }
    return sTotal;
  }

  CustomerMerchantEntity? get merchant => checkoutOption?.merchant;

  String get merchantName => merchant?.name ?? 'Toko Tidak Diketahui';
  String get merchantInitial {
    final names = merchantName.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }
    if (names.isNotEmpty && names[0].isNotEmpty) {
      return names[0][0].toUpperCase();
    }
    return 'WM';
  }

  bool get isMerchantOpen => merchant?.isOpen ?? false;

  String? get selectedPaymentMethodName {
    if (selectedPaymentMethodKey == null ||
        checkoutOption?.paymentMethods == null)
      return null;
    final method = checkoutOption!.paymentMethods!
        .where((e) => e.key == selectedPaymentMethodKey)
        .firstOrNull;
    return method?.label ?? method?.bankName;
  }

  const CustomerCheckoutState({
    this.deliveryMethod,
    this.selectedExpedition,
    this.hasVoucher = true,
    this.isLoading = false,
    this.errorMessage,
    this.address,
    this.items = const [],
    this.checkoutOption,
    this.selectedPaymentMethodKey,
    this.notes,
    this.isSuccess = false,
    this.appliedPromoId,
    this.appliedPromoCode,
    this.createdOrderId,
  });

  CustomerCheckoutState copyWith({
    DeliveryMethodEnum? deliveryMethod,
    String? selectedExpedition,
    bool? hasVoucher,
    bool? isLoading,
    String? errorMessage,
    CustomerAddressEntity? address,
    List<CustomerCartEntity>? items,
    CustomerCheckoutOptionEntity? checkoutOption,
    String? selectedPaymentMethodKey,
    String? notes,
    bool? isSuccess,
    String? appliedPromoId,
    bool? clearAppliedPromoId,
    String? appliedPromoCode,
    bool? clearAppliedPromoCode,
    String? createdOrderId,
  }) => CustomerCheckoutState(
    deliveryMethod: deliveryMethod ?? this.deliveryMethod,
    selectedExpedition: selectedExpedition ?? this.selectedExpedition,
    hasVoucher: hasVoucher ?? this.hasVoucher,
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage,
    address: address ?? this.address,
    items: items ?? this.items,
    checkoutOption: checkoutOption ?? this.checkoutOption,
    selectedPaymentMethodKey:
        selectedPaymentMethodKey ?? this.selectedPaymentMethodKey,
    notes: notes ?? this.notes,
    isSuccess: isSuccess ?? this.isSuccess,
    appliedPromoId:
        appliedPromoId ??
        ((clearAppliedPromoId ?? false) ? null : this.appliedPromoId),
    appliedPromoCode:
        appliedPromoCode ??
        ((clearAppliedPromoCode ?? false) ? null : this.appliedPromoCode),
    createdOrderId: createdOrderId ?? this.createdOrderId,
  );

  @override
  List<Object?> get props => [
    deliveryMethod,
    selectedExpedition,
    hasVoucher,
    isLoading,
    errorMessage,
    address,
    items,
    checkoutOption,
    selectedPaymentMethodKey,
    notes,
    isSuccess,
    appliedPromoId,
    appliedPromoCode,
    createdOrderId,
  ];
}
