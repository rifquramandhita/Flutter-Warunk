part of 'customer_promotion_bloc.dart';

class CustomerPromotionState extends Equatable {
  final List<CustomerPromotionEntity> promotions;
  final bool isLoading;
  final String? errorMessage;
  final String? appliedCode;

  const CustomerPromotionState({
    this.promotions = const [],
    this.isLoading = false,
    this.errorMessage,
    this.appliedCode,
  });

  CustomerPromotionState copyWith({
    List<CustomerPromotionEntity>? promotions,
    bool? isLoading,
    String? errorMessage,
    String? appliedCode,
  }) {
    return CustomerPromotionState(
      promotions: promotions ?? this.promotions,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      appliedCode: appliedCode ?? this.appliedCode,
    );
  }

  @override
  List<Object?> get props => [
        promotions,
        isLoading,
        errorMessage,
        appliedCode,
      ];
}
