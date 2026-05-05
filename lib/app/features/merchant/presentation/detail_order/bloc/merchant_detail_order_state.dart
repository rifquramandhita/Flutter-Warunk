part of 'merchant_detail_order_bloc.dart';

class OrderItemDetail {
  final String nama;
  final int qty;
  final int harga;
  final String emoji;

  const OrderItemDetail({
    required this.nama,
    required this.qty,
    required this.harga,
    required this.emoji,
  });
}

class MerchantDetailOrderState {
  final String orderId;
  final String status;
  final String dateTime;
  final String customerName;
  final String customerPhone;
  final String address;
  final List<OrderItemDetail> items;
  final int subtotal;
  final int ongkir;
  final String paymentMethod;
  final String paymentStatus;
  final String catatan;

  const MerchantDetailOrderState({
    this.orderId = '#WRK-240515-0012',
    this.status = 'Diproses',
    this.dateTime = '15 Mei 2024 • 10:32',
    this.customerName = 'Andi Pratama',
    this.customerPhone = '0812 3456 7890',
    this.address = 'Jl. Raya Bekasi No. 45,\nKec. Matraman, Jakarta Timur',
    this.items = const [
      OrderItemDetail(
        nama: 'Nasi Pecel Warunk',
        qty: 1,
        harga: 18000,
        emoji: '🥗',
      ),
      OrderItemDetail(
        nama: 'Es Teh Manis',
        qty: 2,
        harga: 6000, // per item price or total? UI shows 2x Rp6.000? Oh wait, UI shows Rp6.000 for 2x or is it total? Rp18000 + Rp6000 + Rp5000 = Rp29000. So Rp6000 is the total for 2 items. Wait, if it's 2x 6000 it would be 12000. 18+6+5=29. So 6000 is the TOTAL for the row. Okay I will use harga as total for the row.
        emoji: '🧋',
      ),
      OrderItemDetail(
        nama: 'Kerupuk Udang',
        qty: 1,
        harga: 5000,
        emoji: '🍘',
      ),
    ],
    this.subtotal = 29000,
    this.ongkir = 5000,
    this.paymentMethod = 'Transfer Bank',
    this.paymentStatus = 'Sudah Dibayar',
    this.catatan = 'Tolong tingkat kepedasannya dikurangi ya 🙏',
  });

  int get total => subtotal + ongkir;

  MerchantDetailOrderState copyWith({
    String? orderId,
    String? status,
    String? dateTime,
    String? customerName,
    String? customerPhone,
    String? address,
    List<OrderItemDetail>? items,
    int? subtotal,
    int? ongkir,
    String? paymentMethod,
    String? paymentStatus,
    String? catatan,
  }) {
    return MerchantDetailOrderState(
      orderId: orderId ?? this.orderId,
      status: status ?? this.status,
      dateTime: dateTime ?? this.dateTime,
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      address: address ?? this.address,
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      ongkir: ongkir ?? this.ongkir,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      catatan: catatan ?? this.catatan,
    );
  }
}
