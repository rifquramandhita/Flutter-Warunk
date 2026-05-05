part of 'merchant_input_promo_bloc.dart';

sealed class MerchantInputPromoEvent {}

class MerchantInputPromoTipeChanged extends MerchantInputPromoEvent {
  final String value;
  MerchantInputPromoTipeChanged(this.value);
}

class MerchantInputPromoNamaChanged extends MerchantInputPromoEvent {
  final String value;
  MerchantInputPromoNamaChanged(this.value);
}

class MerchantInputPromoNilaiChanged extends MerchantInputPromoEvent {
  final String value;
  MerchantInputPromoNilaiChanged(this.value);
}

class MerchantInputPromoMinBeliChanged extends MerchantInputPromoEvent {
  final String value;
  MerchantInputPromoMinBeliChanged(this.value);
}

class MerchantInputPromoMulaiChanged extends MerchantInputPromoEvent {
  final DateTime date;
  MerchantInputPromoMulaiChanged(this.date);
}

class MerchantInputPromoSelesaiChanged extends MerchantInputPromoEvent {
  final DateTime date;
  MerchantInputPromoSelesaiChanged(this.date);
}

class MerchantInputPromoKuotaChanged extends MerchantInputPromoEvent {
  final String value;
  MerchantInputPromoKuotaChanged(this.value);
}

class MerchantInputPromoSaved extends MerchantInputPromoEvent {}
