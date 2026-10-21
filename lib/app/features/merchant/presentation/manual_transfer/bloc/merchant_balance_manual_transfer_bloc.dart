import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_balance_history_detail_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_upload_transfer_proof_use_case.dart';
import 'package:warunk/app/features/merchant/presentation/manual_transfer/bloc/merchant_balance_manual_transfer_event.dart';
import 'package:warunk/app/features/merchant/presentation/manual_transfer/bloc/merchant_balance_manual_transfer_state.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantBalanceManualTransferBloc extends Bloc<
    MerchantBalanceManualTransferEvent, MerchantBalanceManualTransferState> {
  final MerchantMerchantUploadTransferProofUseCase _uploadTransferProofUseCase;
  final MerchantMerchantGetBalanceHistoryDetailUseCase _getBalanceHistoryDetailUseCase;

  MerchantBalanceManualTransferBloc({
    required MerchantMerchantUploadTransferProofUseCase uploadTransferProofUseCase,
    required MerchantMerchantGetBalanceHistoryDetailUseCase getBalanceHistoryDetailUseCase,
  })  : _uploadTransferProofUseCase = uploadTransferProofUseCase,
        _getBalanceHistoryDetailUseCase = getBalanceHistoryDetailUseCase,
        super(const MerchantBalanceManualTransferState()) {
    on<MerchantBalanceManualTransferEventFetchDetail>(_onFetchDetail);
    on<MerchantBalanceManualTransferEventSelectImage>(_onSelectImage);
    on<MerchantBalanceManualTransferEventRemoveImage>(_onRemoveImage);
    on<MerchantBalanceManualTransferEventSubmit>(_onSubmit);
  }

  Future<void> _onFetchDetail(
    MerchantBalanceManualTransferEventFetchDetail event,
    Emitter<MerchantBalanceManualTransferState> emit,
  ) async {
    emit(state.copyWith(isFetchingDetail: true, errorMessage: null));

    final result = await _getBalanceHistoryDetailUseCase.call(event.id);

    if (result is SuccessState && result.data != null) {
      emit(state.copyWith(
        isFetchingDetail: false,
        topUpItem: result.data,
      ));
    } else {
      emit(state.copyWith(
        isFetchingDetail: false,
        errorMessage: result.message.isNotEmpty
            ? result.message
            : 'Gagal memuat detail transaksi transfer manual.',
      ));
    }
  }

  void _onSelectImage(
    MerchantBalanceManualTransferEventSelectImage event,
    Emitter<MerchantBalanceManualTransferState> emit,
  ) {
    emit(state.copyWith(selectedImage: event.image, errorMessage: null));
  }

  void _onRemoveImage(
    MerchantBalanceManualTransferEventRemoveImage event,
    Emitter<MerchantBalanceManualTransferState> emit,
  ) {
    emit(state.copyWith(clearImage: true, errorMessage: null));
  }

  Future<void> _onSubmit(
    MerchantBalanceManualTransferEventSubmit event,
    Emitter<MerchantBalanceManualTransferState> emit,
  ) async {
    if (state.selectedImage == null) {
      emit(state.copyWith(
          errorMessage: 'Silakan pilih bukti transfer terlebih dahulu'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    final result = await _uploadTransferProofUseCase.call(
      event.id,
      state.selectedImage!,
    );

    if (result is SuccessState) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        successMessage: result.message.isNotEmpty
            ? result.message
            : 'Bukti transfer berhasil dikirim. Menunggu verifikasi admin.',
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: result.message.isNotEmpty
            ? result.message
            : 'Gagal mengunggah bukti transfer.',
      ));
    }
  }
}
