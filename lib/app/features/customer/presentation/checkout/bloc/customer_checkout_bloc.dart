import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_address_get_default_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_checkout_get_option_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_checkout_get_shipping_option_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_order_create_use_case.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_checkout.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/entity/delivery_method.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_promotion.dart';

part 'customer_checkout_event.dart';
part 'customer_checkout_state.dart';

class CustomerCheckoutBloc
    extends Bloc<CustomerCheckoutEvent, CustomerCheckoutState> {
  final CustomerAddressGetDefaultUseCase _getDefaultAddressUseCase;
  final CustomerCheckoutGetOptionUseCase _getOptionUseCase;
  final CustomerCheckoutGetShippingOptionUseCase _getShippingOptionUseCase;
  final CustomerOrderCreateUseCase _createOrderUseCase;

  CustomerCheckoutBloc({
    required CustomerAddressGetDefaultUseCase getDefaultAddressUseCase,
    required CustomerCheckoutGetOptionUseCase getOptionUseCase,
    required CustomerCheckoutGetShippingOptionUseCase getShippingOptionUseCase,
    required CustomerOrderCreateUseCase createOrderUseCase,
  }) : _getDefaultAddressUseCase = getDefaultAddressUseCase,
       _getOptionUseCase = getOptionUseCase,
       _getShippingOptionUseCase = getShippingOptionUseCase,
       _createOrderUseCase = createOrderUseCase,
       super(const CustomerCheckoutState()) {
    on<CustomerCheckoutEventFetchStarted>(_onFetchStarted);
    on<CustomerCheckoutEventDeliveryChanged>(_onDeliveryChanged);
    on<CustomerCheckoutEventExpeditionChanged>(_onExpeditionChanged);
    on<CustomerCheckoutEventVoucherRemoved>(_onVoucherRemoved);
    on<CustomerCheckoutEventAddressChanged>(_onAddressChanged);
    on<CustomerCheckoutEventPaymentMethodChanged>(_onPaymentMethodChanged);
    on<CustomerCheckoutEventPaymentProofChanged>(_onPaymentProofChanged);
    on<CustomerCheckoutEventNotesChanged>(_onNotesChanged);
    on<CustomerCheckoutEventSubmit>(_onSubmit);
    on<CustomerCheckoutEventPromoChanged>(_onPromoChanged);
  }

  Future<void> _onFetchStarted(
    CustomerCheckoutEventFetchStarted event,
    Emitter<CustomerCheckoutState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, items: event.items),
    );

    final addressResult = await _getDefaultAddressUseCase();

    if (addressResult.success) {
      emit(state.copyWith(address: addressResult.data));
    } else {
      emit(state.copyWith(errorMessage: addressResult.message));
    }

    if (event.items.isNotEmpty) {
      final param = CustomerCheckoutSendParam(
        cartIds: event.items.map((e) => e.id).toList(),
      );
      final optionResult = await _getOptionUseCase(param);

      if (optionResult.success) {
        final option = optionResult.data;
        DeliveryMethod? deliveryMethod = DeliveryMethod.fromString(
          option?.selectedShippingKey,
        );
        String? expedition = option?.selectedBiteshipRateKey;

        if (deliveryMethod == DeliveryMethod.biteship &&
            (expedition == null || expedition.isEmpty) &&
            option?.biteshipShippingOptions?.isNotEmpty == true) {
          expedition = option!.biteshipShippingOptions!.first.key;
        }

        String? paymentKey = state.selectedPaymentMethodKey;
        if ((paymentKey == null || paymentKey.isEmpty) &&
            option?.paymentMethods?.isNotEmpty == true) {
          paymentKey = option!.paymentMethods!.first.key;
        }

        emit(
          state.copyWith(
            checkoutOption: option,
            deliveryMethod: deliveryMethod,
            selectedExpedition: expedition,
            selectedPaymentMethodKey: paymentKey,
            hasVoucher: option?.promotion != null,
          ),
        );
      } else {
        emit(state.copyWith(errorMessage: optionResult.message));
      }
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onDeliveryChanged(
    CustomerCheckoutEventDeliveryChanged event,
    Emitter<CustomerCheckoutState> emit,
  ) async {
    String? expedition = state.selectedExpedition;
    final availableCouriers =
        state.checkoutOption?.biteshipShippingOptions
            ?.map((e) => e.key!)
            .toList() ??
        [];
    if (event.method == DeliveryMethod.biteship &&
        (expedition == null || expedition.isEmpty) &&
        availableCouriers.isNotEmpty) {
      expedition = availableCouriers.first;
    }
    emit(
      state.copyWith(
        deliveryMethod: event.method,
        selectedExpedition: expedition,
      ),
    );
    await _fetchShippingOptions(emit);
  }

  Future<void> _onExpeditionChanged(
    CustomerCheckoutEventExpeditionChanged event,
    Emitter<CustomerCheckoutState> emit,
  ) async {
    emit(state.copyWith(selectedExpedition: event.expedition));
    await _fetchShippingOptions(emit);
  }

  Future<void> _onAddressChanged(
    CustomerCheckoutEventAddressChanged event,
    Emitter<CustomerCheckoutState> emit,
  ) async {
    emit(state.copyWith(address: event.address));
    await _fetchShippingOptions(emit);
  }

  Future<void> _onPaymentMethodChanged(
    CustomerCheckoutEventPaymentMethodChanged event,
    Emitter<CustomerCheckoutState> emit,
  ) async {
    emit(state.copyWith(selectedPaymentMethodKey: event.methodKey));
  }

  Future<void> _fetchShippingOptions(
    Emitter<CustomerCheckoutState> emit,
  ) async {
    if (state.items.isEmpty) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final param = CustomerCheckoutGetShippingOptionParam(
      cartIds: state.items.map((e) => e.id).toList(),
      addressId: state.address?.id,
      shippingKey: state.deliveryMethod != null
          ? state.deliveryMethod!.value
          : null,
      promotions:
          (state.appliedPromoId != null || state.appliedPromoCode != null)
          ? [
              {
                if (state.appliedPromoId != null) "id": state.appliedPromoId!,
                if (state.appliedPromoCode != null)
                  "code": state.appliedPromoCode!,
              },
            ]
          : state.checkoutOption?.promotion != null
          ? [
              {
                if (state.checkoutOption!.promotion!.id != null)
                  "id": state.checkoutOption!.promotion!.id!,
                if (state.checkoutOption!.promotion!.code != null)
                  "code": state.checkoutOption!.promotion!.code!,
              },
            ]
          : null,
    );
    final result = await _getShippingOptionUseCase(param);

    if (result.success) {
      final newOption = result.data;
      String? expedition = state.selectedExpedition;
      if (state.deliveryMethod == DeliveryMethod.biteship &&
          (expedition == null || expedition.isEmpty) &&
          newOption?.biteshipShippingOptions?.isNotEmpty == true) {
        expedition = newOption!.biteshipShippingOptions!.first.key;
      }

      String? paymentKey = state.selectedPaymentMethodKey;
      if ((paymentKey == null || paymentKey.isEmpty) &&
          newOption?.paymentMethods?.isNotEmpty == true) {
        paymentKey = newOption!.paymentMethods!.first.key;
      }

      emit(
        state.copyWith(
          checkoutOption: newOption,
          selectedExpedition: expedition,
          selectedPaymentMethodKey: paymentKey,
          isLoading: false,
          hasVoucher:
              state.appliedPromoId != null ||
              state.appliedPromoCode != null ||
              newOption?.promotion != null,
        ),
      );
    } else {
      emit(state.copyWith(errorMessage: result.message, isLoading: false));
    }
  }

  void _onVoucherRemoved(
    CustomerCheckoutEventVoucherRemoved event,
    Emitter<CustomerCheckoutState> emit,
  ) {
    emit(
      state.copyWith(
        hasVoucher: false,
        appliedPromoId: null,
        appliedPromoCode: null,
      ),
    );
  }

  Future<void> _onPromoChanged(
    CustomerCheckoutEventPromoChanged event,
    Emitter<CustomerCheckoutState> emit,
  ) async {
    String? promoId = event.promo?.id;
    String? promoCode = event.code;

    emit(
      state.copyWith(
        appliedPromoId: promoId,
        clearAppliedPromoId: promoId == null,
        appliedPromoCode: promoCode,
        clearAppliedPromoCode: promoCode == null,
        hasVoucher: true,
      ),
    );
    await _fetchShippingOptions(emit);
  }

  void _onPaymentProofChanged(
    CustomerCheckoutEventPaymentProofChanged event,
    Emitter<CustomerCheckoutState> emit,
  ) {
    emit(state.copyWith(paymentProof: event.file));
  }

  void _onNotesChanged(
    CustomerCheckoutEventNotesChanged event,
    Emitter<CustomerCheckoutState> emit,
  ) {
    emit(state.copyWith(notes: event.notes));
  }

  Future<void> _onSubmit(
    CustomerCheckoutEventSubmit event,
    Emitter<CustomerCheckoutState> emit,
  ) async {
    if (state.address == null) {
      emit(
        state.copyWith(errorMessage: 'Pilih alamat pengiriman terlebih dahulu'),
      );
      return;
    }
    if (state.deliveryMethod == null) {
      emit(
        state.copyWith(errorMessage: 'Pilih metode pengiriman terlebih dahulu'),
      );
      return;
    }
    if (state.deliveryMethod == DeliveryMethod.biteship &&
        (state.selectedExpedition == null ||
            state.selectedExpedition!.isEmpty)) {
      emit(state.copyWith(errorMessage: 'Pilih kurir terlebih dahulu'));
      return;
    }
    if (state.selectedPaymentMethodKey == null ||
        state.selectedPaymentMethodKey!.isEmpty) {
      emit(
        state.copyWith(errorMessage: 'Pilih metode pembayaran terlebih dahulu'),
      );
      return;
    }
    if (state.paymentProof == null) {
      emit(state.copyWith(errorMessage: 'Mohon unggah bukti pembayaran'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final param = CustomerOrderCreateParam(
      addressId: state.address!.id,
      shippingKey: state.deliveryMethod != null
          ? state.deliveryMethod!.value
          : null,
      biteshipRateKey: state.deliveryMethod == DeliveryMethod.biteship
          ? state.selectedExpedition
          : null,
      merchantAccountId: state.checkoutOption?.paymentMethods
          ?.where((e) => e.key == state.selectedPaymentMethodKey)
          .firstOrNull
          ?.key,
      notes: state.notes,
      paymentProof: state.paymentProof!.path,
      cartIds: state.items.map((e) => e.id).toList(),
      promotionId: state.appliedPromoId ?? state.checkoutOption?.promotion?.id,
      promotionCode:
          state.appliedPromoCode ?? state.checkoutOption?.promotion?.code,
    );

    final result = await _createOrderUseCase(params: param);

    if (result.success) {
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.message));
    }
  }
}
