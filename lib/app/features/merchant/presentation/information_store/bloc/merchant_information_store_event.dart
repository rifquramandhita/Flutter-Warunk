part of 'merchant_information_store_bloc.dart';

sealed class MerchantInformationStoreEvent {}

class MerchantInformationStoreLogoTapped extends MerchantInformationStoreEvent {}
class MerchantInformationStoreBannerTapped extends MerchantInformationStoreEvent {}

class MerchantInformationStoreNamaChanged extends MerchantInformationStoreEvent {
  final String value;
  MerchantInformationStoreNamaChanged(this.value);
}

class MerchantInformationStoreKategoriChanged extends MerchantInformationStoreEvent {
  final String value;
  MerchantInformationStoreKategoriChanged(this.value);
}

class MerchantInformationStorePicChanged extends MerchantInformationStoreEvent {
  final String value;
  MerchantInformationStorePicChanged(this.value);
}

class MerchantInformationStoreWhatsappChanged extends MerchantInformationStoreEvent {
  final String value;
  MerchantInformationStoreWhatsappChanged(this.value);
}

class MerchantInformationStoreKotaChanged extends MerchantInformationStoreEvent {
  final String value;
  MerchantInformationStoreKotaChanged(this.value);
}

class MerchantInformationStoreAlamatChanged extends MerchantInformationStoreEvent {
  final String value;
  MerchantInformationStoreAlamatChanged(this.value);
}

class MerchantInformationStoreLokasiTapped extends MerchantInformationStoreEvent {}

class MerchantInformationStorePreviewTapped extends MerchantInformationStoreEvent {}

class MerchantInformationStoreSaved extends MerchantInformationStoreEvent {}
