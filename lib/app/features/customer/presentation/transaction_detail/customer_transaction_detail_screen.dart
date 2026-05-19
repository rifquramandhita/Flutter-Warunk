import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/transaction/bloc/customer_transaction_bloc.dart';
import 'package:warunk/app/features/customer/presentation/transaction_detail/bloc/customer_transaction_detail_bloc.dart';
import 'package:warunk/theme/app_colors.dart';

// ── Item model ─────────────────────────────────────────────────────────────
class _OrderItem {
  final String name;
  final int qty;
  final int price;
  final Color photoColor;
  final IconData photoIcon;
  const _OrderItem(
    this.name,
    this.qty,
    this.price,
    this.photoColor,
    this.photoIcon,
  );
}

// ── Entry point ────────────────────────────────────────────────────────────
class CustomerTransactionDetailScreen extends StatelessWidget {
  final CustomerTransactionEntity transaction;
  const CustomerTransactionDetailScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomerTransactionDetailBloc(transaction),
      child: const _DetailView(),
    );
  }
}

// ── Main view ──────────────────────────────────────────────────────────────
class _DetailView extends StatelessWidget {
  const _DetailView();

  static const _items = [
    _OrderItem(
      'Indomie Goreng',
      1,
      3500,
      Color(0xFFFFF3E0),
      Icons.ramen_dining_rounded,
    ),
    _OrderItem(
      'Teh Botol',
      1,
      4500,
      Color(0xFFFFE0E0),
      Icons.local_drink_rounded,
    ),
    _OrderItem('Telur Ayam', 1, 10500, Color(0xFFFFF8E1), Icons.egg_rounded),
    _OrderItem('Kopi Sachet', 1, 1500, Color(0xFFEFEBE9), Icons.coffee_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      CustomerTransactionDetailBloc,
      CustomerTransactionDetailState
    >(
      builder: (context, state) {
        final tx = state.transaction;
        final steps = _getSteps(tx.status);

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.primary,
              ),
            ),
            title: const Text(
              'Detail Transaksi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 140),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ① Order info + progress tracker
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header row: order ID + status
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  tx.orderId ?? '#WRK-240128-018',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              _statusBadge(tx.status),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Store
                          Row(
                            children: [
                              const Icon(
                                Icons.storefront_outlined,
                                size: 16,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                tx.storeName,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          // Date
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 14,
                                color: AppColors.greyText,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                tx.dateLabel,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.greyText,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          // Progress tracker
                          _ProgressTracker(steps: steps),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ② Delivery address
                    _card(
                      child: Row(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.primary,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Andi Pratama',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '0812-3456-7890',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.greyText,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Jl. Raya Bekasi No. 10, Jakarta Timur',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.greyText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.primary,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ③ Items + subtotal
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Item rows
                          ..._items.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  // Product photo simulation
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      width: 52,
                                      height: 52,
                                      color: item.photoColor,
                                      child: Center(
                                        child: Icon(
                                          item.photoIcon,
                                          size: 28,
                                          color: AppColors.primaryLight,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '×${item.qty}  ',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.greyText,
                                    ),
                                  ),
                                  Text(
                                    _fmt(item.price),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Subtotal row
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Divider(
                              height: 1,
                              color: AppColors.greyBorder,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Subtotal (${_items.length} item)',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.greyText,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                _fmt(
                                  _items.fold(0, (s, i) => s + i.price * i.qty),
                                ),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ④ Price breakdown
                    _card(
                      child: Column(
                        children: [
                          _priceRow(
                            Icons.shopping_bag_outlined,
                            'Subtotal',
                            'Rp18.000',
                            false,
                          ),
                          const SizedBox(height: 12),
                          _priceRow(
                            Icons.delivery_dining_outlined,
                            'Ongkir',
                            'Rp8.000',
                            false,
                          ),
                          const SizedBox(height: 12),
                          _priceRow(
                            Icons.access_time_outlined,
                            'Biaya layanan',
                            'Rp2.000',
                            false,
                          ),
                          const SizedBox(height: 12),
                          _priceRow(
                            Icons.check_circle_outline,
                            'Diskon',
                            '-Rp8.000',
                            true,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Divider(
                              height: 1,
                              color: AppColors.greyBorder,
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.textDark,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Rp20.000',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ⑤ Payment method
                    _card(
                      child: Row(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.credit_card_outlined,
                              color: AppColors.primary,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Metode pembayaran',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.greyText,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'BCA VA',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF005BAC),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'BCA',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: 1,
                                  height: 12,
                                  color: Colors.white.withValues(alpha: 0.4),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.account_balance_rounded,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.primary,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ── Fixed bottom buttons ────────────────────────────────────
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    16,
                    14,
                    16,
                    MediaQuery.of(context).padding.bottom + 14,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 16,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Lacak Pesanan
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () => context
                              .read<CustomerTransactionDetailBloc>()
                              .add(CustomerTransactionDetailTrackOrder()),
                          icon: const Icon(
                            Icons.location_on_outlined,
                            size: 20,
                          ),
                          label: const Text(
                            'Lacak Pesanan',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Hubungi Merchant
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton.icon(
                          onPressed: () => context
                              .read<CustomerTransactionDetailBloc>()
                              .add(CustomerTransactionDetailContactMerchant()),
                          icon: const Icon(
                            Icons.chat_bubble_outline_rounded,
                            size: 20,
                            color: AppColors.primary,
                          ),
                          label: const Text(
                            'Hubungi Merchant',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: AppColors.primary,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: AppColors.primary,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────
  Widget _card({required Widget child}) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: child,
  );

  Widget _priceRow(
    IconData icon,
    String label,
    String value,
    bool isDiscount,
  ) => Row(
    children: [
      Icon(
        icon,
        size: 16,
        color: isDiscount ? AppColors.primary : AppColors.greyText,
      ),
      const SizedBox(width: 8),
      Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: isDiscount ? AppColors.primary : AppColors.greyText,
        ),
      ),
      const Spacer(),
      Text(
        value,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isDiscount ? FontWeight.w700 : FontWeight.normal,
          color: isDiscount ? AppColors.primary : AppColors.textDark,
        ),
      ),
    ],
  );

  Widget _statusBadge(TxStatus status) {
    late String label;
    late Color bg;
    late Color fg;
    late bool outlined;
    switch (status) {
      case TxStatus.diproses:
        label = 'Diproses';
        bg = AppColors.primary;
        fg = Colors.white;
        outlined = false;
        break;
      case TxStatus.menungguBayar:
        label = 'Menunggu Bayar';
        bg = const Color(0xFFFFF3E0);
        fg = const Color(0xFFF59E0B);
        outlined = false;
        break;
      case TxStatus.dikirim:
        label = 'Dikirim';
        bg = const Color(0xFFE3F2FD);
        fg = const Color(0xFF1976D2);
        outlined = false;
        break;
      case TxStatus.selesai:
        label = 'Selesai';
        bg = Colors.transparent;
        fg = AppColors.primary;
        outlined = true;
        break;
      case TxStatus.dibatalkan:
        label = 'Dibatalkan';
        bg = const Color(0xFFFFEBEE);
        fg = Colors.red;
        outlined = false;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: outlined
            ? Border.all(color: AppColors.primary, width: 1.5)
            : null,
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: fg),
      ),
    );
  }

  static List<_StepData> _getSteps(TxStatus status) {
    const labels = ['Pesanan\ndibuat', 'Diproses', 'Dikirim', 'Selesai'];
    int doneCount;
    switch (status) {
      case TxStatus.menungguBayar:
        doneCount = 1;
        break;
      case TxStatus.diproses:
        doneCount = 2;
        break;
      case TxStatus.dikirim:
        doneCount = 3;
        break;
      case TxStatus.selesai:
        doneCount = 4;
        break;
      default:
        doneCount = 1;
        break;
    }
    return List.generate(4, (i) => _StepData(labels[i], i < doneCount));
  }

  static String _fmt(int v) {
    final s = v.toString();
    final buf = StringBuffer('Rp');
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return buf.toString();
  }
}

// ── Step data ──────────────────────────────────────────────────────────────
class _StepData {
  final String label;
  final bool done;
  const _StepData(this.label, this.done);
}

// ── Progress Tracker Widget ────────────────────────────────────────────────
class _ProgressTracker extends StatelessWidget {
  final List<_StepData> steps;
  const _ProgressTracker({required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Circles + connectors row
        Row(
          children: List.generate(steps.length * 2 - 1, (i) {
            if (i.isOdd) {
              // Connector between step[(i-1)/2] and step[(i+1)/2]
              final leftDone = steps[i ~/ 2].done;
              final rightDone = steps[(i ~/ 2) + 1].done;
              final solid = leftDone && rightDone;
              return Expanded(
                child: CustomPaint(
                  size: const Size(double.infinity, 2),
                  painter: _ConnectorPainter(
                    color: leftDone ? AppColors.primary : AppColors.greyBorder,
                    dashed: !solid,
                  ),
                ),
              );
            }
            final idx = i ~/ 2;
            final step = steps[idx];
            return _stepCircle(
              step.done,
              idx == steps.lastIndexWhere((s) => s.done),
            );
          }),
        ),
        const SizedBox(height: 8),
        // Labels row
        Row(
          children: List.generate(steps.length * 2 - 1, (i) {
            if (i.isOdd) return const Expanded(child: SizedBox());
            final idx = i ~/ 2;
            final step = steps[idx];
            return SizedBox(
              width: 52,
              child: Text(
                step.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: step.done ? FontWeight.w700 : FontWeight.w400,
                  color: step.done ? AppColors.primary : AppColors.greyText,
                  height: 1.3,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _stepCircle(bool done, bool isActive) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: done ? AppColors.primary : Colors.white,
        border: Border.all(
          color: done ? AppColors.primary : AppColors.greyBorder,
          width: 2,
        ),
      ),
      child: done
          ? const Icon(Icons.check_rounded, color: Colors.white, size: 18)
          : null,
    );
  }
}

// ── Connector line painter ─────────────────────────────────────────────────
class _ConnectorPainter extends CustomPainter {
  final Color color;
  final bool dashed;
  const _ConnectorPainter({required this.color, required this.dashed});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    if (!dashed) {
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(size.width, size.height / 2),
        paint,
      );
    } else {
      const dashWidth = 6.0;
      const dashSpace = 4.0;
      double x = 0;
      final y = size.height / 2;
      while (x < size.width) {
        canvas.drawLine(
          Offset(x, y),
          Offset(math.min(x + dashWidth, size.width), y),
          paint,
        );
        x += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(_ConnectorPainter old) => false;
}
