part of 'merchant_profil_bloc.dart';

sealed class MerchantProfilEvent {}

class MerchantProfilEditTapped extends MerchantProfilEvent {}

class MerchantProfilLogoutTapped extends MerchantProfilEvent {}
