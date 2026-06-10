part of 'customer_review_order_bloc.dart';

abstract class CustomerReviewOrderEvent {}

class CustomerReviewOrderInit extends CustomerReviewOrderEvent {
  final List<dynamic> items;
  CustomerReviewOrderInit(this.items);
}

class CustomerReviewOrderRatingChanged extends CustomerReviewOrderEvent {
  final String orderItemId;
  final int rating;
  CustomerReviewOrderRatingChanged({required this.orderItemId, required this.rating});
}

class CustomerReviewOrderTextChanged extends CustomerReviewOrderEvent {
  final String orderItemId;
  final String reviewText;
  CustomerReviewOrderTextChanged({required this.orderItemId, required this.reviewText});
}

class CustomerReviewOrderImageAdded extends CustomerReviewOrderEvent {
  final String orderItemId;
  final File image;
  CustomerReviewOrderImageAdded({required this.orderItemId, required this.image});
}

class CustomerReviewOrderImageRemoved extends CustomerReviewOrderEvent {
  final String orderItemId;
  final int imageIndex;
  CustomerReviewOrderImageRemoved({required this.orderItemId, required this.imageIndex});
}

class CustomerReviewOrderSubmitted extends CustomerReviewOrderEvent {
  final String orderId;
  CustomerReviewOrderSubmitted({required this.orderId});
}
