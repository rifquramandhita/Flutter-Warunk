import 'package:equatable/equatable.dart';

abstract class CustomerPaymentProofState extends Equatable {
  const CustomerPaymentProofState();

  @override
  List<Object> get props => [];
}

class CustomerPaymentProofInitial extends CustomerPaymentProofState {}

class CustomerPaymentProofLoading extends CustomerPaymentProofState {}

class CustomerPaymentProofSuccess extends CustomerPaymentProofState {}

class CustomerPaymentProofFailure extends CustomerPaymentProofState {
  final String message;

  const CustomerPaymentProofFailure(this.message);

  @override
  List<Object> get props => [message];
}
