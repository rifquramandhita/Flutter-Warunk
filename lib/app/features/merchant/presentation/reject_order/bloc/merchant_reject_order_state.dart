part of 'merchant_reject_order_bloc.dart';

class MerchantRejectOrderState extends Equatable {
  final String reason;
  final String customerBank;
  final String customerAccountNumber;
  final String customerAccountName;
  final File? refundProof;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final String? whatsAppNumber;
  final bool shouldLaunchWhatsApp;

  const MerchantRejectOrderState({
    this.reason = '',
    this.customerBank = '',
    this.customerAccountNumber = '',
    this.customerAccountName = '',
    this.refundProof,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.whatsAppNumber,
    this.shouldLaunchWhatsApp = false,
  });

  MerchantRejectOrderState copyWith({
    String? reason,
    String? customerBank,
    String? customerAccountNumber,
    String? customerAccountName,
    File? refundProof,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    String? whatsAppNumber,
    bool? shouldLaunchWhatsApp,
  }) {
    return MerchantRejectOrderState(
      reason: reason ?? this.reason,
      customerBank: customerBank ?? this.customerBank,
      customerAccountNumber: customerAccountNumber ?? this.customerAccountNumber,
      customerAccountName: customerAccountName ?? this.customerAccountName,
      refundProof: refundProof ?? this.refundProof,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      whatsAppNumber: whatsAppNumber ?? this.whatsAppNumber,
      shouldLaunchWhatsApp: shouldLaunchWhatsApp ?? this.shouldLaunchWhatsApp,
    );
  }

  @override
  List<Object?> get props => [
        reason,
        customerBank,
        customerAccountNumber,
        customerAccountName,
        refundProof,
        isLoading,
        isSuccess,
        errorMessage,
        whatsAppNumber,
        shouldLaunchWhatsApp,
      ];
}
