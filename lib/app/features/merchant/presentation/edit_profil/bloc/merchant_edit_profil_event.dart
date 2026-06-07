part of 'merchant_edit_profil_bloc.dart';

sealed class MerchantEditProfilEvent {}

class MerchantEditProfilEventGet extends MerchantEditProfilEvent {}

class MerchantEditProfilEventNameChanged extends MerchantEditProfilEvent {
  final String value;
  MerchantEditProfilEventNameChanged(this.value);
}

class MerchantEditProfilEventWhatsappChanged extends MerchantEditProfilEvent {
  final String value;
  MerchantEditProfilEventWhatsappChanged(this.value);
}

class MerchantEditProfilEventCategoryChanged extends MerchantEditProfilEvent {
  final MerchantCategoryEntity? value;
  MerchantEditProfilEventCategoryChanged(this.value);
}

class MerchantEditProfilEventPhotoPicked extends MerchantEditProfilEvent {}

class MerchantEditProfilEventSubmit extends MerchantEditProfilEvent {}
