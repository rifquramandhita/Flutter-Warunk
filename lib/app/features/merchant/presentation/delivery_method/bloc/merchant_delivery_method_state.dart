part of 'merchant_delivery_method_bloc.dart';

class DeliveryMethodItem {
  final String id;
  final String name;
  final String description;
  final bool isActive;
  final String iconType;

  const DeliveryMethodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.isActive,
    required this.iconType,
  });

  DeliveryMethodItem copyWith({
    String? id,
    String? name,
    String? description,
    bool? isActive,
    String? iconType,
  }) {
    return DeliveryMethodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      iconType: iconType ?? this.iconType,
    );
  }
}

class ShippingFeeTier {
  final String distance;
  final int fee;

  const ShippingFeeTier({
    required this.distance,
    required this.fee,
  });
}

class MerchantDeliveryMethodState {
  final List<DeliveryMethodItem> methods;
  final List<ShippingFeeTier> feeTiers;
  final bool isSaving;
  final bool isSaved;

  const MerchantDeliveryMethodState({
    this.methods = const [
      DeliveryMethodItem(
        id: 'pickup',
        name: 'Ambil Sendiri',
        description: 'Customer ambil langsung di toko',
        isActive: true,
        iconType: 'pickup',
      ),
      DeliveryMethodItem(
        id: 'store_delivery',
        name: 'Diantar Toko',
        description: 'Diantar oleh kurir toko sendiri',
        isActive: true,
        iconType: 'store_delivery',
      ),
      DeliveryMethodItem(
        id: 'third_party',
        name: 'Kurir Pihak Ketiga',
        description: 'JNE, J&T, SiCepat, dll',
        isActive: true,
        iconType: 'third_party',
      ),
    ],
    this.feeTiers = const [
      ShippingFeeTier(distance: '0 - 3 km', fee: 5000),
      ShippingFeeTier(distance: '> 3 - 7 km', fee: 8000),
      ShippingFeeTier(distance: '> 7 - 10 km', fee: 12000),
      ShippingFeeTier(distance: '> 10 km', fee: 15000),
    ],
    this.isSaving = false,
    this.isSaved = false,
  });

  MerchantDeliveryMethodState copyWith({
    List<DeliveryMethodItem>? methods,
    List<ShippingFeeTier>? feeTiers,
    bool? isSaving,
    bool? isSaved,
  }) {
    return MerchantDeliveryMethodState(
      methods: methods ?? this.methods,
      feeTiers: feeTiers ?? this.feeTiers,
      isSaving: isSaving ?? this.isSaving,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
