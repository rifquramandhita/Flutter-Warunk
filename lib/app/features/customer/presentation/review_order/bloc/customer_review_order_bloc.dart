import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order_item.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_order_complete_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'customer_review_order_event.dart';
part 'customer_review_order_state.dart';

class CustomerReviewOrderBloc
    extends Bloc<CustomerReviewOrderEvent, CustomerReviewOrderState> {
  final CustomerOrderCompleteUseCase completeUseCase;

  CustomerReviewOrderBloc(this.completeUseCase)
      : super(CustomerReviewOrderState()) {
    on<CustomerReviewOrderInit>(_onInit);
    on<CustomerReviewOrderRatingChanged>(_onRatingChanged);
    on<CustomerReviewOrderTextChanged>(_onTextChanged);
    on<CustomerReviewOrderImageAdded>(_onImageAdded);
    on<CustomerReviewOrderImageRemoved>(_onImageRemoved);
    on<CustomerReviewOrderSubmitted>(_onSubmitted);
  }

  void _onInit(
      CustomerReviewOrderInit event, Emitter<CustomerReviewOrderState> emit) {
    final List<CustomerOrderCompleteReviewParam> initialReviews = [];
    for (var item in event.items) {
      if (item is CustomerOrderItemEntity) {
        final orderItemId = item.id;
        // If the item doesn't have an ID, we can't review it.
        if (orderItemId != null) {
          initialReviews.add(CustomerOrderCompleteReviewParam(
            orderItemId: orderItemId,
            rating: 0,
            review: '',
            images: [],
          ));
        }
      }
    }
    emit(state.copyWith(reviews: initialReviews));
  }

  void _onRatingChanged(CustomerReviewOrderRatingChanged event,
      Emitter<CustomerReviewOrderState> emit) {
    final updatedReviews = state.reviews.map((r) {
      if (r.orderItemId == event.orderItemId) {
        return r.copyWith(rating: event.rating);
      }
      return r;
    }).toList();
    emit(state.copyWith(reviews: updatedReviews));
  }

  void _onTextChanged(CustomerReviewOrderTextChanged event,
      Emitter<CustomerReviewOrderState> emit) {
    final updatedReviews = state.reviews.map((r) {
      if (r.orderItemId == event.orderItemId) {
        return r.copyWith(review: event.reviewText);
      }
      return r;
    }).toList();
    emit(state.copyWith(reviews: updatedReviews));
  }

  void _onImageAdded(CustomerReviewOrderImageAdded event,
      Emitter<CustomerReviewOrderState> emit) {
    final updatedReviews = state.reviews.map((r) {
      if (r.orderItemId == event.orderItemId) {
        if (r.images.length < 3) {
          final newImages = List<File>.from(r.images)..add(event.image);
          return r.copyWith(images: newImages);
        }
      }
      return r;
    }).toList();
    emit(state.copyWith(reviews: updatedReviews));
  }

  void _onImageRemoved(CustomerReviewOrderImageRemoved event,
      Emitter<CustomerReviewOrderState> emit) {
    final updatedReviews = state.reviews.map((r) {
      if (r.orderItemId == event.orderItemId) {
        final newImages = List<File>.from(r.images);
        if (event.imageIndex >= 0 && event.imageIndex < newImages.length) {
          newImages.removeAt(event.imageIndex);
        }
        return r.copyWith(images: newImages);
      }
      return r;
    }).toList();
    emit(state.copyWith(reviews: updatedReviews));
  }

  Future<void> _onSubmitted(CustomerReviewOrderSubmitted event,
      Emitter<CustomerReviewOrderState> emit) async {
    // Validate that all items have at least 1 star rating
    final hasUnrated = state.reviews.any((r) => r.rating < 1);
    if (hasUnrated) {
      emit(state.copyWith(
          status: CustomerReviewOrderStatus.failure,
          errorMessage: 'Harap berikan rating untuk semua produk.'));
      // Reset status to initial to allow re-submission
      emit(state.copyWith(status: CustomerReviewOrderStatus.initial));
      return;
    }

    emit(state.copyWith(status: CustomerReviewOrderStatus.loading));

    final param = CustomerOrderCompleteParam(
      orderId: event.orderId,
      reviews: state.reviews,
    );

    final result = await completeUseCase(params: param);

    if (result is SuccessState) {
      emit(state.copyWith(status: CustomerReviewOrderStatus.success));
    } else if (result is ErrorState) {
      emit(state.copyWith(
          status: CustomerReviewOrderStatus.failure,
          errorMessage: result.message));
      // Reset status to allow retry
      emit(state.copyWith(status: CustomerReviewOrderStatus.initial));
    }
  }
}
