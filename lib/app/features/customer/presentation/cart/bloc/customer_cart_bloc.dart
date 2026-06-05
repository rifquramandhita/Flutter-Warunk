import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart_update_param.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_cart_get_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_cart_delete_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_cart_update_use_case.dart';

part 'customer_cart_event.dart';
part 'customer_cart_state.dart';

class CustomerCartBloc extends Bloc<CustomerCartEvent, CustomerCartState> {
  final CustomerCartGetUseCase _getUseCase;
  final CustomerCartUpdateUseCase _updateUseCase;
  final CustomerCartDeleteUseCase _deleteUseCase;

  CustomerCartBloc({
    required CustomerCartGetUseCase getUseCase,
    required CustomerCartUpdateUseCase updateUseCase,
    required CustomerCartDeleteUseCase deleteUseCase,
  }) : _getUseCase = getUseCase,
       _updateUseCase = updateUseCase,
       _deleteUseCase = deleteUseCase,
       super(const CustomerCartState(items: [])) {
    on<CustomerCartEventGet>(_onFetch);
    on<CustomerCartEventQtyChanged>(_onQtyChanged);
    on<CustomerCartEventItemRemoved>(_onItemRemoved);
    on<CustomerCartEventNoteChanged>(_onNoteChanged);
    on<CustomerCartEventMerchantToggled>(_onMerchantToggled);
    on<CustomerCartEventItemToggled>(_onItemToggled);
  }

  Future<void> _onFetch(
    CustomerCartEventGet event,
    Emitter<CustomerCartState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        selectedMerchantId: state.selectedMerchantId,
      ),
    );
    final result = await _getUseCase();
    if (result.success && result.data != null) {
      final items = result.data!;
      String? defaultSelectedMerchant = state.selectedMerchantId;
      Set<String> defaultSelectedItems = state.selectedItemIds;
      if (items.isNotEmpty && defaultSelectedMerchant == null) {
        defaultSelectedMerchant = items.first.product?.merchant?.id;
        defaultSelectedItems = items
            .where((i) => i.product?.merchant?.id == defaultSelectedMerchant)
            .map((i) => i.id)
            .toSet();
      }
      emit(
        state.copyWith(
          isLoading: false,
          items: items,
          selectedMerchantId: defaultSelectedMerchant,
          selectedItemIds: defaultSelectedItems,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: result.message.isNotEmpty
              ? result.message
              : 'Failed to fetch cart',
          selectedMerchantId: state.selectedMerchantId,
        ),
      );
    }
  }

  Future<void> _onQtyChanged(
    CustomerCartEventQtyChanged event,
    Emitter<CustomerCartState> emit,
  ) async {
    final items = List<CustomerCartEntity>.from(state.items);
    final item = items[event.index];
    final newQty = item.quantity + event.delta;
    if (newQty < 1) return;

    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        selectedMerchantId: state.selectedMerchantId,
      ),
    );

    final result = await _updateUseCase(
      params: CustomerCartUpdateParam(cartId: item.id, quantity: newQty),
    );

    if (result.success) {
      items[event.index] = item.copyWith(quantity: newQty);
      emit(
        state.copyWith(
          items: items,
          selectedMerchantId: state.selectedMerchantId,
        ),
      );
    } else {
      emit(
        state.copyWith(
          errorMessage: result.message.isNotEmpty
              ? result.message
              : 'Gagal memperbarui jumlah',
          selectedMerchantId: state.selectedMerchantId,
        ),
      );
    }
    emit(
      state.copyWith(
        isLoading: false,
        selectedMerchantId: state.selectedMerchantId,
      ),
    );
  }

  Future<void> _onItemRemoved(
    CustomerCartEventItemRemoved event,
    Emitter<CustomerCartState> emit,
  ) async {
    final items = List<CustomerCartEntity>.from(state.items);
    final item = items[event.index];

    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        selectedMerchantId: state.selectedMerchantId,
      ),
    );

    final result = await _deleteUseCase(params: item.id);

    if (result.success) {
      items.removeAt(event.index);

      final newSelectedItems = Set<String>.from(state.selectedItemIds);
      newSelectedItems.remove(item.id);
      String? newMerchantId = state.selectedMerchantId;
      if (newSelectedItems.isEmpty) {
        newMerchantId = null;
      }

      emit(
        state.copyWith(
          items: items,
          selectedItemIds: newSelectedItems,
          selectedMerchantId: newMerchantId,
        ),
      );
    } else {
      emit(
        state.copyWith(
          errorMessage: result.message.isNotEmpty
              ? result.message
              : 'Gagal menghapus keranjang',
          selectedMerchantId: state.selectedMerchantId,
        ),
      );
    }
    emit(
      state.copyWith(
        isLoading: false,
        selectedMerchantId: state.selectedMerchantId,
      ),
    );
  }

  void _onNoteChanged(
    CustomerCartEventNoteChanged event,
    Emitter<CustomerCartState> emit,
  ) {
    emit(
      state.copyWith(
        note: event.note,
        selectedMerchantId: state.selectedMerchantId,
      ),
    );
  }

  void _onMerchantToggled(
    CustomerCartEventMerchantToggled event,
    Emitter<CustomerCartState> emit,
  ) {
    if (event.isSelected) {
      final itemIds = state.items
          .where((i) => i.product?.merchant?.id == event.merchantId)
          .map((i) => i.id)
          .toSet();
      emit(
        state.copyWith(
          selectedMerchantId: event.merchantId,
          selectedItemIds: itemIds,
        ),
      );
    } else {
      emit(state.copyWith(selectedMerchantId: null, selectedItemIds: {}));
    }
  }

  void _onItemToggled(
    CustomerCartEventItemToggled event,
    Emitter<CustomerCartState> emit,
  ) {
    final newSelectedItems = Set<String>.from(state.selectedItemIds);
    String? newMerchantId = state.selectedMerchantId;

    if (event.isSelected) {
      if (newMerchantId != event.merchantId) {
        newMerchantId = event.merchantId;
        newSelectedItems.clear();
      }
      newSelectedItems.add(event.itemId);
    } else {
      newSelectedItems.remove(event.itemId);
      if (newSelectedItems.isEmpty) {
        newMerchantId = null;
      }
    }

    emit(
      state.copyWith(
        selectedMerchantId: newMerchantId,
        selectedItemIds: newSelectedItems,
      ),
    );
  }
}
