part of 'merchant_product_bloc.dart';

sealed class MerchantProductEvent {}

class MerchantProductEventGet extends MerchantProductEvent {
  MerchantProductEventGet();
}

class MerchantProductEventTabChanged extends MerchantProductEvent {
  final int index;
  MerchantProductEventTabChanged(this.index);
}

class MerchantProductEventSearchChanged extends MerchantProductEvent {
  final String query;
  MerchantProductEventSearchChanged(this.query);
}

class MerchantProductEventToggled extends MerchantProductEvent {
  final String productId;
  MerchantProductEventToggled(this.productId);
}

class MerchantProductEventAddTapped extends MerchantProductEvent {}

class MerchantProductEventDeleted extends MerchantProductEvent {
  final String productId;
  MerchantProductEventDeleted(this.productId);
}
