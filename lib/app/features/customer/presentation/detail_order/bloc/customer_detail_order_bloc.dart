import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_order_get_by_id_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_order_received_use_case.dart';
import 'package:warunk/core/network/data_state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_cart_add_use_case.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart_add_param.dart';

part 'customer_detail_order_event.dart';
part 'customer_detail_order_state.dart';

class CustomerDetailOrderBloc
    extends Bloc<CustomerDetailOrderEvent, CustomerDetailOrderState> {
  final CustomerOrderGetByIdUseCase _getByIdUseCase;
  final CustomerOrderReceivedUseCase _receivedUseCase;
  final CustomerCartAddUseCase _cartAddUseCase;

  CustomerDetailOrderBloc(
    this._getByIdUseCase,
    this._receivedUseCase,
    this._cartAddUseCase,
  ) : super(const CustomerDetailOrderState()) {
    on<CustomerDetailOrderFetchStarted>(_onFetchStarted);
    on<CustomerDetailOrderTrackOrder>(_onTrackOrder);
    on<CustomerDetailOrderContactMerchant>(_onContactMerchant);
    on<CustomerDetailOrderMarkReceived>(_onMarkReceived);
    on<CustomerDetailOrderReorder>(_onReorder);
  }

  Future<void> _onFetchStarted(
    CustomerDetailOrderFetchStarted event,
    Emitter<CustomerDetailOrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final id = event.orderId;

    final response = await _getByIdUseCase.call(id: id);

    if (response is SuccessState) {
      emit(state.copyWith(transaction: response.data, isLoading: false, errorMessage: null));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: response.message));
    }
  }

  Future<void> _onTrackOrder(
    CustomerDetailOrderTrackOrder event,
    Emitter<CustomerDetailOrderState> emit,
  ) async {
    final biteshipResponse = state.transaction?.shipping?.biteshipResponse;
    String? trackingUrl;
    
    if (biteshipResponse is Map<String, dynamic>) {
      final courier = biteshipResponse['courier'];
      if (courier is Map<String, dynamic>) {
        trackingUrl = courier['link'] as String?;
      }
    }

    if (trackingUrl != null && trackingUrl.isNotEmpty) {
      final url = Uri.parse(trackingUrl);
      try {
        await launchUrl(url, mode: LaunchMode.inAppWebView);
      } catch (e) {
        // Handle error silently
      }
    }
  }

  void _onContactMerchant(
    CustomerDetailOrderContactMerchant event,
    Emitter<CustomerDetailOrderState> emit,
  ) {
    /* open chat */
  }

  Future<void> _onMarkReceived(
    CustomerDetailOrderMarkReceived event,
    Emitter<CustomerDetailOrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final response = await _receivedUseCase(id: event.orderId);

    if (response is SuccessState) {
      // Re-fetch the order details to update UI
      add(CustomerDetailOrderFetchStarted(event.orderId));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: response.message));
    }
  }

  Future<void> _onReorder(
    CustomerDetailOrderReorder event,
    Emitter<CustomerDetailOrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isReorderSuccess: false));

    final items = state.transaction?.items ?? [];
    if (items.isEmpty) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Tidak ada produk untuk dipesan ulang'));
      return;
    }

    try {
      for (final item in items) {
        if (item.productId != null) {
          final param = CustomerCartAddParam(
            productId: item.productId!,
            productVariantId: item.productVariantId,
            quantity: item.quantity ?? 1,
            notes: item.notes,
          );
          final response = await _cartAddUseCase(param);
          if (response is! SuccessState) {
            emit(state.copyWith(
              isLoading: false,
              errorMessage: response.message ?? 'Gagal menambahkan produk ke keranjang',
            ));
            return;
          }
        }
      }
      emit(state.copyWith(isLoading: false, isReorderSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
