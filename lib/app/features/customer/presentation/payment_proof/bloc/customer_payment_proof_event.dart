import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class CustomerPaymentProofEvent extends Equatable {
  const CustomerPaymentProofEvent();

  @override
  List<Object> get props => [];
}

class CustomerPaymentProofSubmitted extends CustomerPaymentProofEvent {
  final String orderId;
  final File file;

  const CustomerPaymentProofSubmitted({
    required this.orderId,
    required this.file,
  });

  @override
  List<Object> get props => [orderId, file];
}
