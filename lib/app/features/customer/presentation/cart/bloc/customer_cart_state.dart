part of 'customer_cart_bloc.dart';

class CustomerCartState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<CustomerCartEntity> items;
  final String note;
  final String? selectedMerchantId;
  final Set<String> selectedItemIds;

  static const int serviceFee = 2000;
  static const int ongkir = 8000;
  static const int diskon = 8000;

  List<CustomerCartEntity> get selectedItems =>
      items.where((i) => i.product?.merchant?.id == selectedMerchantId && selectedItemIds.contains(i.id)).toList();

  int get subtotal => selectedItems.fold(0, (s, i) => s + (i.unitPrice * i.quantity));
  int get itemCount => selectedItems.fold(0, (s, i) => s + i.quantity);
  int get total => selectedItems.isEmpty ? 0 : subtotal + serviceFee + ongkir - diskon;

  Map<String, List<MapEntry<int, CustomerCartEntity>>>
  get groupedItemsWithIndex {
    final map = <String, List<MapEntry<int, CustomerCartEntity>>>{};
    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final key = item.product?.merchant?.id ?? '';
      map.putIfAbsent(key, () => []).add(MapEntry(i, item));
    }
    return map;
  }

  const CustomerCartState({
    this.isLoading = false,
    this.errorMessage,
    required this.items,
    this.note = '',
    this.selectedMerchantId,
    this.selectedItemIds = const {},
  });

  CustomerCartState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CustomerCartEntity>? items,
    String? note,
    String? selectedMerchantId,
    Set<String>? selectedItemIds,
  }) => CustomerCartState(
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage,
    items: items ?? this.items,
    note: note ?? this.note,
    selectedMerchantId: selectedMerchantId,
    selectedItemIds: selectedItemIds ?? this.selectedItemIds,
  );

  @override
  List<Object?> get props => [isLoading, errorMessage, items, note, selectedMerchantId, selectedItemIds];
}
