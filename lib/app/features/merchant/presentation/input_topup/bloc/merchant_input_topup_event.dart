import 'package:equatable/equatable.dart';

abstract class MerchantInputTopupEvent extends Equatable {
  const MerchantInputTopupEvent();

  @override
  List<Object> get props => [];
}

class MerchantInputTopupEventSubmit extends MerchantInputTopupEvent {
  final int amount;

  const MerchantInputTopupEventSubmit({required this.amount});

  @override
  List<Object> get props => [amount];
}
