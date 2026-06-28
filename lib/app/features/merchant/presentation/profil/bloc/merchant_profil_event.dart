part of 'merchant_profil_bloc.dart';

sealed class MerchantProfilEvent {}

class MerchantProfilEventGet extends MerchantProfilEvent {}

class MerchantProfilEventEditTapped extends MerchantProfilEvent {}

class MerchantProfilEventLogoutTapped extends MerchantProfilEvent {}

class MerchantLaunchUrlEvent extends MerchantProfilEvent {
  final String url;

  MerchantLaunchUrlEvent(this.url);
}
