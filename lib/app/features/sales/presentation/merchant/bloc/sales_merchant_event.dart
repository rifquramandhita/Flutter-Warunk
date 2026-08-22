import 'package:equatable/equatable.dart';

abstract class SalesMerchantEvent extends Equatable {
  const SalesMerchantEvent();

  @override
  List<Object?> get props => [];
}

class SalesMerchantLoadEvent extends SalesMerchantEvent {
  final int? page;
  final String? keyword;

  const SalesMerchantLoadEvent({this.page, this.keyword});

  @override
  List<Object?> get props => [page, keyword];
}

class SalesMerchantClaimEvent extends SalesMerchantEvent {
  final String merchantId;

  const SalesMerchantClaimEvent({required this.merchantId});

  @override
  List<Object?> get props => [merchantId];
}

class SalesMerchantOpenWebviewEvent extends SalesMerchantEvent {
  final String merchantId;

  const SalesMerchantOpenWebviewEvent({required this.merchantId});

  @override
  List<Object?> get props => [merchantId];
}
