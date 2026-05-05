part of 'customer_payment_bloc.dart';

class CustomerPaymentState {
  final int selectedIndex;

  // Flat list: 0-2=E-Wallet, 3-5=VA, 6=COD
  static const List<String> methodNames = [
    'GoPay', 'OVO', 'DANA',
    'BCA VA', 'BNI VA', 'Mandiri VA',
    'Bayar di tempat',
  ];

  String get selectedName =>
      selectedIndex < methodNames.length ? methodNames[selectedIndex] : '';

  const CustomerPaymentState({this.selectedIndex = 3}); // default BCA VA

  CustomerPaymentState copyWith({int? selectedIndex}) =>
      CustomerPaymentState(selectedIndex: selectedIndex ?? this.selectedIndex);
}
