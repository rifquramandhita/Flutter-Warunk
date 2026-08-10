import 'package:equatable/equatable.dart';

abstract class CustomerReportMerchantEvent extends Equatable {
  const CustomerReportMerchantEvent();

  @override
  List<Object?> get props => [];
}

class CustomerReportMerchantEventGetCategories extends CustomerReportMerchantEvent {}

class CustomerReportMerchantEventSelectCategory extends CustomerReportMerchantEvent {
  final String category;

  const CustomerReportMerchantEventSelectCategory(this.category);

  @override
  List<Object?> get props => [category];
}

class CustomerReportMerchantEventInputReason extends CustomerReportMerchantEvent {
  final String reason;

  const CustomerReportMerchantEventInputReason(this.reason);

  @override
  List<Object?> get props => [reason];
}

class CustomerReportMerchantEventSubmit extends CustomerReportMerchantEvent {
  final String merchantId;

  const CustomerReportMerchantEventSubmit({required this.merchantId});

  @override
  List<Object?> get props => [merchantId];
}
