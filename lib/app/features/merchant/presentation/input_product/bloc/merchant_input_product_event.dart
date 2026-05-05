part of 'merchant_input_product_bloc.dart';

sealed class MerchantInputProductEvent {}

class MerchantInputProductNamaChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductNamaChanged(this.value);
}

class MerchantInputProductKategoriChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductKategoriChanged(this.value);
}

class MerchantInputProductHargaChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductHargaChanged(this.value);
}

class MerchantInputProductStokChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductStokChanged(this.value);
}

class MerchantInputProductSatuanChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductSatuanChanged(this.value);
}

class MerchantInputProductDeskripsiChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductDeskripsiChanged(this.value);
}

class MerchantInputProductTampilkanToggled extends MerchantInputProductEvent {}

class MerchantInputProductFotoTapped extends MerchantInputProductEvent {}

class MerchantInputProductSaved extends MerchantInputProductEvent {}
