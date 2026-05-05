part of 'merchant_edit_profil_bloc.dart';

sealed class MerchantEditProfilEvent {}

class MerchantEditNamaToko extends MerchantEditProfilEvent {
  final String value;
  MerchantEditNamaToko(this.value);
}

class MerchantEditKategoriToko extends MerchantEditProfilEvent {
  final String value;
  MerchantEditKategoriToko(this.value);
}

class MerchantEditWhatsApp extends MerchantEditProfilEvent {
  final String value;
  MerchantEditWhatsApp(this.value);
}

class MerchantEditEmail extends MerchantEditProfilEvent {
  final String value;
  MerchantEditEmail(this.value);
}

class MerchantEditProfilSaved extends MerchantEditProfilEvent {}

class MerchantEditFotoTapped extends MerchantEditProfilEvent {}
