import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class MerchantBalanceManualTransferEvent extends Equatable {
  const MerchantBalanceManualTransferEvent();

  @override
  List<Object?> get props => [];
}

class MerchantBalanceManualTransferEventFetchDetail
    extends MerchantBalanceManualTransferEvent {
  final String id;

  const MerchantBalanceManualTransferEventFetchDetail(this.id);

  @override
  List<Object?> get props => [id];
}

class MerchantBalanceManualTransferEventSelectImage
    extends MerchantBalanceManualTransferEvent {
  final File image;

  const MerchantBalanceManualTransferEventSelectImage(this.image);

  @override
  List<Object?> get props => [image];
}

class MerchantBalanceManualTransferEventRemoveImage
    extends MerchantBalanceManualTransferEvent {
  const MerchantBalanceManualTransferEventRemoveImage();
}

class MerchantBalanceManualTransferEventSubmit
    extends MerchantBalanceManualTransferEvent {
  final String id;

  const MerchantBalanceManualTransferEventSubmit(this.id);

  @override
  List<Object?> get props => [id];
}
