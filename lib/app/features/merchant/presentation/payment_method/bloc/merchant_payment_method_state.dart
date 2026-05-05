part of 'merchant_payment_method_bloc.dart';

class PaymentMethodItem {
  final String id;
  final String name;
  final bool isActive;
  final String iconType; // 'cash', 'bank', 'qris', 'ewallet', 'gateway'

  const PaymentMethodItem({
    required this.id,
    required this.name,
    required this.isActive,
    required this.iconType,
  });

  PaymentMethodItem copyWith({
    String? id,
    String? name,
    bool? isActive,
    String? iconType,
  }) {
    return PaymentMethodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      iconType: iconType ?? this.iconType,
    );
  }
}

class MerchantPaymentMethodState {
  final List<PaymentMethodItem> methods;

  const MerchantPaymentMethodState({
    this.methods = const [
      PaymentMethodItem(
        id: 'cash',
        name: 'Cash di Tempat',
        isActive: true,
        iconType: 'cash',
      ),
      PaymentMethodItem(
        id: 'bank',
        name: 'Transfer Bank',
        isActive: true,
        iconType: 'bank',
      ),
      PaymentMethodItem(
        id: 'qris',
        name: 'QRIS',
        isActive: true,
        iconType: 'qris',
      ),
      PaymentMethodItem(
        id: 'ewallet',
        name: 'E-Wallet (OVO, DANA, GoPay)',
        isActive: true,
        iconType: 'ewallet',
      ),
      PaymentMethodItem(
        id: 'gateway',
        name: 'Payment Gateway',
        isActive: false,
        iconType: 'gateway',
      ),
    ],
  });

  MerchantPaymentMethodState copyWith({
    List<PaymentMethodItem>? methods,
  }) {
    return MerchantPaymentMethodState(
      methods: methods ?? this.methods,
    );
  }
}
