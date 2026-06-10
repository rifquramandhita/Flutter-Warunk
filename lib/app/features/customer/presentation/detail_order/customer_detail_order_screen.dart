import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/order/bloc/customer_order_bloc.dart';
import 'package:warunk/app/features/customer/presentation/detail_order/bloc/customer_detail_order_bloc.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/enum/delivery_method.dart';
import 'package:warunk/app/features/customer/presentation/review_order/customer_review_order_screen.dart';

// ── Entry point ────────────────────────────────────────────────────────────
class CustomerDetailOrderScreen extends StatelessWidget {
  final CustomerOrderEntity transaction;
  const CustomerDetailOrderScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerDetailOrderBloc>()
            ..add(CustomerDetailOrderFetchStarted(transaction)),
      child: BlocConsumer<CustomerDetailOrderBloc, CustomerDetailOrderState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(title: const Text('Detail Pesanan')),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerDetailOrderBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<CustomerDetailOrderBloc>().state;
    final tx = state.transaction;
    if (tx == null) {
      return const SizedBox();
    }
    final steps = _getSteps(tx.status);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ① Order info + progress tracker
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [_statusBadge(tx.status ?? '')],
                      ),
                      Text(
                        tx.invoiceNumber ?? '-',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textDark,
                        ),
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
                            tx.merchant?['name'] ?? 'Toko',
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
                            tx.createdAt != null
                                ? tx.createdAt!.split('T').first
                                : '-',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.greyText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.local_shipping_outlined,
                            size: 14,
                            color: AppColors.greyText,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _getDeliveryMethodLabel(tx),
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.customerAddress?['recipient_name']
                                      ?.toString() ??
                                  tx.customer?['name']?.toString() ??
                                  'Penerima',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              tx.customerAddress?['phone']?.toString() ??
                                  tx.customer?['phone']?.toString() ??
                                  '-',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.greyText,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              tx.customerAddress?['address']?.toString() ?? '-',
                              style: const TextStyle(
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
                      ...(tx.items ?? []).map((item) {
                        final name =
                            item.productName ?? item.product?.name ?? '-';
                        final qty = item.quantity ?? 1;
                        final price = item.price ?? 0;
                        final variantSnapshot = item.productVariantSnapshot;
                        Map<String, dynamic>? variantCombination;
                        if (variantSnapshot is Map<String, dynamic>) {
                          variantCombination =
                              variantSnapshot['variant_combination']
                                  as Map<String, dynamic>?;
                        } else if (item.productVariantLabel != null) {
                          // Fallback if variant snapshot is not available but label is
                          variantCombination = {
                            'name': item.productVariantLabel,
                          };
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: GlobalHelper.getColorSchema(
                                    context,
                                  ).primary.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text(
                                    '📦',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    if (variantCombination != null &&
                                        variantCombination.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          variantCombination.entries
                                              .map(
                                                (e) => '${e.key}: ${e.value}',
                                              )
                                              .join(', '),
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: AppColors.greyText,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Text(
                                '×$qty  ',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.greyText,
                                ),
                              ),
                              Text(
                                _fmt(price.toInt()),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      // Subtotal row
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Divider(height: 1, color: AppColors.greyBorder),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Subtotal (${(tx.items ?? []).length} item)',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.greyText,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            _fmt(
                              (tx.items ?? []).fold<int>(0, (s, i) {
                                final price = i.price ?? 0;
                                final qty = i.quantity ?? 1;
                                return s + (price * qty);
                              }),
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
                        _fmt(tx.subtotal ?? 0),
                        false,
                      ),
                      const SizedBox(height: 12),
                      _priceRow(
                        Icons.delivery_dining_outlined,
                        'Ongkir',
                        _fmt(tx.shippingCost ?? 0),
                        false,
                      ),
                      const SizedBox(height: 12),
                      _priceRow(
                        Icons.access_time_outlined,
                        'Biaya layanan',
                        _fmt(tx.serviceFee ?? 0),
                        false,
                      ),
                      if ((tx.promotionDiscount ?? 0) > 0) ...[
                        const SizedBox(height: 12),
                        _priceRow(
                          Icons.check_circle_outline,
                          'Diskon',
                          '-${_fmt(tx.promotionDiscount ?? 0)}',
                          true,
                        ),
                      ],
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Divider(height: 1, color: AppColors.greyBorder),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: AppColors.textDark,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            _fmt(tx.total ?? 0),
                            style: const TextStyle(
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Metode pembayaran',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.greyText,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              tx.customerBank != null
                                  ? '${tx.customerBank?.toUpperCase()} VA'
                                  : 'Transfer',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (tx.customerBank != null)
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
                              Text(
                                tx.customerBank?.toUpperCase() ?? '',
                                style: const TextStyle(
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
        ),

        // ── Fixed bottom buttons ────────────────────────────────────
        Container(
          padding: EdgeInsets.all(16),
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
              if (tx.status == 'received') ...[
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CustomerReviewOrderScreen(order: tx),
                        ),
                      );
                      if (result == true) {
                        context.read<CustomerDetailOrderBloc>().add(
                          CustomerDetailOrderFetchStarted(tx),
                        );
                      }
                    },
                    icon: const Icon(Icons.star_outline, size: 20),
                    label: const Text(
                      'Selesaikan Pesanan & Review',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              // Lacak Pesanan
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () => context.read<CustomerDetailOrderBloc>().add(
                    CustomerDetailOrderTrackOrder(),
                  ),
                  icon: const Icon(Icons.location_on_outlined, size: 20),
                  label: const Text(
                    'Lacak Pesanan',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
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
            ],
          ),
        ),
      ],
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

  String _getDeliveryMethodLabel(CustomerOrderEntity order) {
    String? typeString;

    typeString = order.shipping?.type;
    if (typeString == DeliveryMethodEnum.biteship.value) {
      typeString = order.shipping?.courier;
    }
    final deliveryMethod = DeliveryMethodEnum.fromString(typeString);
    return deliveryMethod?.label ?? typeString ?? '-';
  }

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

  Widget _statusBadge(String status) {
    late String label;
    late Color bg;
    late Color fg;
    late bool outlined;
    switch (status) {
      case 'waiting_payment':
        label = 'Menunggu Pembayaran';
        bg = const Color(0xFFFFF3E0);
        fg = const Color(0xFFF59E0B);
        outlined = false;
        break;
      case 'waiting_payment_confirmation':
        label = 'Menunggu Konfirmasi Pembayaran';
        bg = const Color(0xFFFFF3E0);
        fg = const Color(0xFFF59E0B);
        outlined = false;
        break;
      case 'waiting_cancel':
        label = 'Menunggu Pembatalan';
        bg = const Color(0xFFFFEBEE);
        fg = Colors.red;
        outlined = false;
        break;
      case 'processing':
        label = 'Diproses';
        bg = AppColors.primary;
        fg = Colors.white;
        outlined = false;
        break;
      case 'shipped':
        label = 'Dikirim';
        bg = const Color(0xFFE3F2FD);
        fg = const Color(0xFF1976D2);
        outlined = false;
        break;
      case 'received':
        label = 'Diterima';
        bg = const Color(0xFFE8F5E9);
        fg = const Color(0xFF2E7D32);
        outlined = false;
        break;
      case 'completed':
        label = 'Selesai';
        bg = Colors.transparent;
        fg = AppColors.primary;
        outlined = true;
        break;
      case 'cancelled':
        label = 'Dibatalkan';
        bg = const Color(0xFFFFEBEE);
        fg = Colors.red;
        outlined = false;
        break;
      default:
        label = status;
        bg = Colors.grey.shade200;
        fg = Colors.black54;
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

  static List<_StepData> _getSteps(String? status) {
    const labels = ['Pesanan\ndibuat', 'Diproses', 'Dikirim', 'Selesai'];
    int doneCount;
    switch (status) {
      case 'waiting_payment':
      case 'waiting_payment_confirmation':
      case 'waiting_cancel':
      case 'pending':
        doneCount = 1;
        break;
      case 'processing':
        doneCount = 2;
        break;
      case 'shipped':
      case 'received':
        doneCount = 3;
        break;
      case 'completed':
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
