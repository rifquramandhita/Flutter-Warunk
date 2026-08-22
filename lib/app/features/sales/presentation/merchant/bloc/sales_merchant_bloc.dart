import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/sales/domain/entity/sales_merchant.dart';
import 'package:warunk/app/features/sales/domain/use_case/sales_merchant_get_use_case.dart';
import 'package:warunk/app/features/sales/domain/use_case/sales_merchant_claim_use_case.dart';
import 'package:warunk/app/features/sales/domain/use_case/sales_merchant_get_url_web_use_case.dart';
import 'package:warunk/app/features/sales/presentation/merchant/bloc/sales_merchant_event.dart';

part 'sales_merchant_state.dart';

class SalesMerchantBloc extends Bloc<SalesMerchantEvent, SalesMerchantState> {
  final SalesMerchantGetUseCase _getUseCase;
  final SalesMerchantClaimUseCase _claimUseCase;
  final SalesMerchantGetUrlWebUseCase _getUrlWebUseCase;

  SalesMerchantBloc({
    required SalesMerchantGetUseCase getUseCase,
    required SalesMerchantClaimUseCase claimUseCase,
    required SalesMerchantGetUrlWebUseCase getUrlWebUseCase,
  })  : _getUseCase = getUseCase,
        _claimUseCase = claimUseCase,
        _getUrlWebUseCase = getUrlWebUseCase,
        super(const SalesMerchantState()) {
    on<SalesMerchantLoadEvent>(_onLoad);
    on<SalesMerchantClaimEvent>(_onClaim);
    on<SalesMerchantOpenWebviewEvent>(_onOpenWebview);
  }

  Future<void> _onLoad(
    SalesMerchantLoadEvent event,
    Emitter<SalesMerchantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _getUseCase(
      params: SalesMerchantGetUseCaseParams(
        page: event.page,
        keyword: event.keyword,
      ),
    );

    if (result.success && result.data != null) {
      emit(state.copyWith(
        isLoading: false,
        merchants: result.data!.merchants,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.message ?? 'Failed to load merchants',
      ));
    }
  }

  Future<void> _onClaim(
    SalesMerchantClaimEvent event,
    Emitter<SalesMerchantState> emit,
  ) async {
    emit(state.copyWith(isClaimLoading: true, claimErrorMessage: null, claimSuccessMessage: null));
    final result = await _claimUseCase(params: event.merchantId);

    if (result.success) {
      emit(state.copyWith(
        isClaimLoading: false,
        claimSuccessMessage: result.message ?? 'Berhasil claim merchant',
      ));
      add(const SalesMerchantLoadEvent());
    } else {
      emit(state.copyWith(
        isClaimLoading: false,
        claimErrorMessage: result.message ?? 'Gagal claim merchant',
      ));
    }
  }

  Future<void> _onOpenWebview(
    SalesMerchantOpenWebviewEvent event,
    Emitter<SalesMerchantState> emit,
  ) async {
    emit(state.copyWith(isWebviewLoading: true, webviewUrl: null, webviewErrorMessage: null));
    final result = await _getUrlWebUseCase(params: event.merchantId);

    if (result.success && result.data != null) {
      emit(state.copyWith(
        isWebviewLoading: false,
        webviewUrl: result.data,
      ));
    } else {
      emit(state.copyWith(
        isWebviewLoading: false,
        webviewErrorMessage: result.message ?? 'Gagal memuat url webview',
      ));
    }
  }
}
