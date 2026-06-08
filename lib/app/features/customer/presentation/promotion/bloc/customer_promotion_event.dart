part of 'customer_promotion_bloc.dart';

abstract class CustomerPromotionEvent extends Equatable {
  const CustomerPromotionEvent();

  @override
  List<Object?> get props => [];
}

class CustomerPromotionEventGet extends CustomerPromotionEvent {
  final CustomerOrderGetPromotionParam param;

  const CustomerPromotionEventGet(this.param);

  @override
  List<Object?> get props => [param];
}

class CustomerPromotionEventApplyCode extends CustomerPromotionEvent {
  final String code;

  const CustomerPromotionEventApplyCode(this.code);

  @override
  List<Object?> get props => [code];
}
