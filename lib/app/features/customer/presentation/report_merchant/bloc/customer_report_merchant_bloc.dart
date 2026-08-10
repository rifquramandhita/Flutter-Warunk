import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_report_send_param.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_report_get_category_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_report_send_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

import 'customer_report_merchant_event.dart';
import 'customer_report_merchant_state.dart';

class CustomerReportMerchantBloc extends Bloc<CustomerReportMerchantEvent, CustomerReportMerchantState> {
  final CustomerReportGetCategoryUseCase _getCategoryUseCase;
  final CustomerReportSendUseCase _sendUseCase;

  CustomerReportMerchantBloc({
    required CustomerReportGetCategoryUseCase getCategoryUseCase,
    required CustomerReportSendUseCase sendUseCase,
  })  : _getCategoryUseCase = getCategoryUseCase,
        _sendUseCase = sendUseCase,
        super(const CustomerReportMerchantState()) {
    on<CustomerReportMerchantEventGetCategories>(_onGetCategories);
    on<CustomerReportMerchantEventSelectCategory>(_onSelectCategory);
    on<CustomerReportMerchantEventInputReason>(_onInputReason);
    on<CustomerReportMerchantEventSubmit>(_onSubmit);
  }

  Future<void> _onGetCategories(
    CustomerReportMerchantEventGetCategories event,
    Emitter<CustomerReportMerchantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _getCategoryUseCase();
      if (response is SuccessState) {
        final categories = response.data ?? [];
        emit(state.copyWith(
          isLoading: false,
          categories: categories,
          selectedCategory: categories.isNotEmpty ? categories.first : null,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: response.message,
        ));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _onSelectCategory(
    CustomerReportMerchantEventSelectCategory event,
    Emitter<CustomerReportMerchantState> emit,
  ) {
    emit(state.copyWith(selectedCategory: event.category));
  }

  void _onInputReason(
    CustomerReportMerchantEventInputReason event,
    Emitter<CustomerReportMerchantState> emit,
  ) {
    emit(state.copyWith(reason: event.reason));
  }

  Future<void> _onSubmit(
    CustomerReportMerchantEventSubmit event,
    Emitter<CustomerReportMerchantState> emit,
  ) async {
    if (state.selectedCategory == null || state.selectedCategory!.isEmpty) {
      emit(state.copyWith(errorMessage: 'Kategori laporan harus dipilih'));
      return;
    }

    if (state.selectedCategory?.toLowerCase() == 'lainnya') {
      if (state.reason.trim().isEmpty) {
        emit(state.copyWith(errorMessage: 'Alasan laporan tidak boleh kosong'));
        return;
      }
    }

    emit(state.copyWith(isLoading: true));
    try {
      final param = CustomerReportSendParam(
        merchantId: event.merchantId,
        categoryReport: state.selectedCategory!,
        reason: state.reason.trim(),
      );

      final response = await _sendUseCase(param);
      if (response is SuccessState) {
        emit(state.copyWith(
          isLoading: false,
          successMessage: 'Laporan berhasil dikirim',
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: response.message,
        ));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
