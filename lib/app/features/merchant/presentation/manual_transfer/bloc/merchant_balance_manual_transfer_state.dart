import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_balance_history.dart';

class MerchantBalanceManualTransferState extends Equatable {
  final bool isLoading;
  final bool isFetchingDetail;
  final bool isSuccess;
  final String? errorMessage;
  final String? successMessage;
  final File? selectedImage;
  final MerchantBalanceHistoryItemEntity? topUpItem;

  const MerchantBalanceManualTransferState({
    this.isLoading = false,
    this.isFetchingDetail = false,
    this.isSuccess = false,
    this.errorMessage,
    this.successMessage,
    this.selectedImage,
    this.topUpItem,
  });

  MerchantBalanceManualTransferState copyWith({
    bool? isLoading,
    bool? isFetchingDetail,
    bool? isSuccess,
    String? errorMessage,
    String? successMessage,
    File? selectedImage,
    bool clearImage = false,
    MerchantBalanceHistoryItemEntity? topUpItem,
  }) {
    return MerchantBalanceManualTransferState(
      isLoading: isLoading ?? this.isLoading,
      isFetchingDetail: isFetchingDetail ?? this.isFetchingDetail,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      successMessage: successMessage,
      selectedImage: clearImage ? null : (selectedImage ?? this.selectedImage),
      topUpItem: topUpItem ?? this.topUpItem,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isFetchingDetail,
        isSuccess,
        errorMessage,
        successMessage,
        selectedImage,
        topUpItem,
      ];
}
