part of 'customer_checkout_bloc.dart';

class CustomerCheckoutState {
  final int deliveryMethod; // 0=Ambil, 1=Kurir, 2=Pihak Ketiga
  final bool hasVoucher;

  static const int subtotal   = 18000;
  static const int serviceFee = 2000;
  static const int diskon     = 8000;
  static const List<int> ongkirOptions = [0, 8000, 12000];

  int get ongkir => ongkirOptions[deliveryMethod];
  int get total  => subtotal + serviceFee + ongkir - (hasVoucher ? diskon : 0);

  const CustomerCheckoutState({this.deliveryMethod = 1, this.hasVoucher = true});

  CustomerCheckoutState copyWith({int? deliveryMethod, bool? hasVoucher}) => CustomerCheckoutState(
        deliveryMethod: deliveryMethod ?? this.deliveryMethod,
        hasVoucher: hasVoucher ?? this.hasVoucher,
      );
}
