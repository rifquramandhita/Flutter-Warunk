part of 'merchant_preview_store_bloc.dart';

sealed class MerchantPreviewStoreEvent {}

class MerchantPreviewStoreTabChanged extends MerchantPreviewStoreEvent {
  final int index;
  MerchantPreviewStoreTabChanged(this.index);
}

class MerchantPreviewStoreEditTapped extends MerchantPreviewStoreEvent {}
