part of 'merchant_input_account_bloc.dart';

class MerchantInputAccountState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final List<MerchantAccountUpdateParam> accounts;

  const MerchantInputAccountState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.accounts = const [],
  });

  MerchantInputAccountState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    List<MerchantAccountUpdateParam>? accounts,
  }) {
    return MerchantInputAccountState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      accounts: accounts ?? this.accounts,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSuccess,
        errorMessage,
        accounts,
      ];
}
