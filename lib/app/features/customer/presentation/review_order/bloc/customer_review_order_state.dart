part of 'customer_review_order_bloc.dart';

enum CustomerReviewOrderStatus { initial, loading, success, failure }

class CustomerReviewOrderState {
  final CustomerReviewOrderStatus status;
  final String? errorMessage;
  final List<CustomerOrderCompleteReviewParam> reviews;

  CustomerReviewOrderState({
    this.status = CustomerReviewOrderStatus.initial,
    this.errorMessage,
    this.reviews = const [],
  });

  CustomerReviewOrderState copyWith({
    CustomerReviewOrderStatus? status,
    String? errorMessage,
    List<CustomerOrderCompleteReviewParam>? reviews,
  }) {
    return CustomerReviewOrderState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      reviews: reviews ?? this.reviews,
    );
  }
}
