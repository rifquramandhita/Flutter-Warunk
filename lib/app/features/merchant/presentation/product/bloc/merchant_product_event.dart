part of 'merchant_product_bloc.dart';

sealed class MerchantProductEvent {}

class MerchantProductTabChanged extends MerchantProductEvent {
  final int index; // 0=Semua, 1=Minuman, 2=Makanan, 3=Sembako
  MerchantProductTabChanged(this.index);
}

class MerchantProductSearchChanged extends MerchantProductEvent {
  final String query;
  MerchantProductSearchChanged(this.query);
}

class MerchantProductToggled extends MerchantProductEvent {
  final String productId;
  MerchantProductToggled(this.productId);
}

class MerchantProductAddTapped extends MerchantProductEvent {}
