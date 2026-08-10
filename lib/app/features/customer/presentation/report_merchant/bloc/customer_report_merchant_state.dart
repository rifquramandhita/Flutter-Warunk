import 'package:equatable/equatable.dart';

class CustomerReportMerchantState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;
  final List<String> categories;
  final String? selectedCategory;
  final String reason;

  const CustomerReportMerchantState({
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
    this.categories = const [],
    this.selectedCategory,
    this.reason = '',
  });

  CustomerReportMerchantState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
    List<String>? categories,
    String? selectedCategory,
    String? reason,
  }) {
    return CustomerReportMerchantState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage, // We don't preserve errors across states usually, unless null is explicitly passed. But here it's simple. Let's just pass it or reset it when not provided. Actually, passing it is fine if not provided. Wait, if it's null we should be able to clear it.
      // To allow clearing, a common pattern is to just pass null. Wait, if we use standard copyWith, passing null means it won't be cleared.
      // Let's use a standard implementation.
      // Wait, in this project, they just use `errorMessage: errorMessage` to clear if not provided? No, `errorMessage: errorMessage ?? this.errorMessage` means it cannot clear if null is passed.
      // In customer_detail_merchant_state.dart they do: `errorMessage: errorMessage,` which means it ALWAYS clears unless explicitly passed! Let's follow that pattern.
      successMessage: successMessage,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      reason: reason ?? this.reason,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        successMessage,
        categories,
        selectedCategory,
        reason,
      ];
}
