import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/app/features/merchant/presentation/dashboard/bloc/merchant_dashboard_bloc.dart';
import 'package:warunk/theme/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point — provides BLoC
// ─────────────────────────────────────────────────────────────────────────────
class MerchantDashboardScreen extends StatelessWidget {
  const MerchantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantDashboardBloc(),
      child: const _MerchantDashboardView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main view
// ─────────────────────────────────────────────────────────────────────────────
class _MerchantDashboardView extends StatelessWidget {
  const _MerchantDashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<MerchantDashboardBloc, MerchantDashboardState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _DashboardHeader(state: state),
                  const SizedBox(height: 16),
                  _StatsGrid(state: state),
                  const SizedBox(height: 16),
                  _SalesChart(state: state),
                  const SizedBox(height: 16),
                  _RecentOrders(state: state),
                  const SizedBox(height: 16),
                  _QuickActions(),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Header
// ─────────────────────────────────────────────────────────────────────────────
class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({required this.state});
  final MerchantDashboardState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Avatar warung
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.primary.withValues(alpha: 0.15),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: const Center(
                    child: Text('🏪', style: TextStyle(fontSize: 28)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Info nama toko
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Warunk Bu Siti',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Merchant',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Bell notifikasi
              Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.greyBorder),
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.textDark,
                      size: 20,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF22C55E),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'Toko buka  •  08:00 – 22:00',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.greyText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Stats Grid (2×2)
// ─────────────────────────────────────────────────────────────────────────────
class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.state});
  final MerchantDashboardState state;

  static final _fmt = NumberFormat.decimalPattern('id');
  static final _currency = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  iconBg: const Color(0xFFE8F5F1),
                  icon: Icons.shopping_bag_outlined,
                  iconColor: AppColors.primary,
                  label: 'Pesanan Baru',
                  value: _fmt.format(state.newOrders),
                  valueColor: AppColors.primary,
                  subtitle: 'Perlu diproses',
                  showArrow: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  iconBg: const Color(0xFFEEF2FF),
                  icon: Icons.bar_chart_rounded,
                  iconColor: const Color(0xFF4F46E5),
                  label: 'Penjualan Hari Ini',
                  value: _currency.format(state.todaySales),
                  valueColor: const Color(0xFF4F46E5),
                  subtitle: '▲ ${state.salesGrowth}% dari kemarin',
                  subtitleColor: const Color(0xFF22C55E),
                  showArrow: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  iconBg: const Color(0xFFFFF7ED),
                  icon: Icons.inventory_2_outlined,
                  iconColor: const Color(0xFFF97316),
                  label: 'Produk Aktif',
                  value: _fmt.format(state.activeProducts),
                  valueColor: const Color(0xFFF97316),
                  subtitle: 'Dari ${state.totalProducts} produk',
                  showArrow: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  iconBg: const Color(0xFFF0FDF4),
                  icon: Icons.account_balance_wallet_outlined,
                  iconColor: AppColors.primary,
                  label: 'Saldo Masuk',
                  value: _currency.format(state.balance),
                  valueColor: AppColors.primary,
                  subtitle: 'Dapat ditarik',
                  showArrow: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.iconBg,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.valueColor,
    required this.subtitle,
    this.subtitleColor,
    this.showArrow = false,
  });

  final Color iconBg;
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final Color valueColor;
  final String subtitle;
  final Color? subtitleColor;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: AppColors.greyText),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    color: subtitleColor ?? AppColors.greyText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (showArrow)
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.greyText,
                  size: 16,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sales Chart
// ─────────────────────────────────────────────────────────────────────────────
class _SalesChart extends StatelessWidget {
  const _SalesChart({required this.state});
  final MerchantDashboardState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Penjualan 7 Hari Terakhir',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ),
              // Period dropdown
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.greyBorder),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.selectedPeriod,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: AppColors.textDark,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 160,
            child: _LineChart(data: state.salesData, labels: state.salesLabels),
          ),
        ],
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({required this.data, required this.labels});
  final List<double> data;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomPaint(
            painter: _LineChartPainter(data: data),
            child: const SizedBox.expand(),
          ),
        ),
        const SizedBox(height: 8),
        // X-axis labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: labels.map((label) {
            return Text(
              label,
              style: const TextStyle(fontSize: 10, color: AppColors.greyText),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _LineChartPainter extends CustomPainter {
  const _LineChartPainter({required this.data});
  final List<double> data;

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final maxVal = data.reduce(math.max);
    final minVal = data.reduce(math.min) * 0.8;
    final range = maxVal - minVal;

    double xStep = size.width / (data.length - 1);

    List<Offset> points = List.generate(data.length, (i) {
      final x = i * xStep;
      final y = size.height - ((data[i] - minVal) / range * size.height);
      return Offset(x, y.clamp(0, size.height));
    });

    // Draw filled area under line
    final areaPath = Path()..moveTo(points.first.dx, size.height);
    for (var p in points) {
      areaPath.lineTo(p.dx, p.dy);
    }
    areaPath.lineTo(points.last.dx, size.height);
    areaPath.close();

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.primary.withValues(alpha: 0.2),
        AppColors.primary.withValues(alpha: 0.02),
      ],
    );

    canvas.drawPath(
      areaPath,
      Paint()
        ..shader = gradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        )
        ..style = PaintingStyle.fill,
    );

    // Draw Y-axis label references (500rb, 1jt, 1.5jt)
    final textPainter = TextPainter(textDirection: ui.TextDirection.ltr);
    for (var label in ['1.5 jt', '1 jt', '500 rb', '0']) {
      double val;
      switch (label) {
        case '1.5 jt':
          val = 1500000;
          break;
        case '1 jt':
          val = 1000000;
          break;
        case '500 rb':
          val = 500000;
          break;
        default:
          val = 0;
      }
      final y = size.height - ((val - minVal) / range * size.height);
      if (y < 0 || y > size.height) continue;
      // dashed grid line
      _drawDashedLine(
        canvas,
        Offset(0, y.clamp(0, size.height)),
        Offset(size.width, y.clamp(0, size.height)),
      );
      textPainter.text = TextSpan(
        text: label,
        style: const TextStyle(color: AppColors.greyText, fontSize: 9),
      );
      textPainter.layout();
      // skip painting labels (handled outside if needed)
    }

    // Draw line
    final linePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final linePath = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      final cp1 = Offset(
        (points[i - 1].dx + points[i].dx) / 2,
        points[i - 1].dy,
      );
      final cp2 = Offset((points[i - 1].dx + points[i].dx) / 2, points[i].dy);
      linePath.cubicTo(
        cp1.dx,
        cp1.dy,
        cp2.dx,
        cp2.dy,
        points[i].dx,
        points[i].dy,
      );
    }
    canvas.drawPath(linePath, linePaint);

    // Draw dots on each point
    final dotPaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;
    final dotBorderPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (final p in points) {
      canvas.drawCircle(p, 4, dotPaint);
      canvas.drawCircle(p, 4, dotBorderPaint);
    }
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end) {
    final paint = Paint()
      ..color = AppColors.greyBorder
      ..strokeWidth = 0.8;
    const dashLength = 4.0;
    const gapLength = 4.0;
    final dx = end.dx - start.dx;
    final dy = end.dy - start.dy;
    final length = math.sqrt(dx * dx + dy * dy);
    final steps = (length / (dashLength + gapLength)).floor();
    final unitX = dx / length;
    final unitY = dy / length;
    for (int i = 0; i < steps; i++) {
      final startX = start.dx + (i * (dashLength + gapLength)) * unitX;
      final startY = start.dy + (i * (dashLength + gapLength)) * unitY;
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX + dashLength * unitX, startY + dashLength * unitY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_LineChartPainter old) => old.data != data;
}

// ─────────────────────────────────────────────────────────────────────────────
// Recent Orders
// ─────────────────────────────────────────────────────────────────────────────
class _RecentOrders extends StatelessWidget {
  const _RecentOrders({required this.state});
  final MerchantDashboardState state;

  static final _currency = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Order Terbaru',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Lihat semua',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...state.recentOrders.map(
            (order) => _OrderItem(order: order, currency: _currency),
          ),
        ],
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  const _OrderItem({required this.order, required this.currency});
  final MerchantOrderItem order;
  final NumberFormat currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Order ID chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              order.orderId,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Name & date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.customerName,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  order.dateTime,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
          ),
          // Status badge + amount
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _StatusBadge(status: order.status),
              const SizedBox(height: 4),
              Text(
                currency.format(order.total),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, color: AppColors.greyText, size: 18),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});
  final MerchantOrderStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      MerchantOrderStatus.diproses => ('Diproses', const Color(0xFFF97316)),
      MerchantOrderStatus.siapDiantar => ('Siap Diantar', AppColors.primary),
      MerchantOrderStatus.selesai => ('Selesai', const Color(0xFF22C55E)),
      MerchantOrderStatus.dibatalkan => ('Dibatalkan', Colors.red),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Quick Actions
// ─────────────────────────────────────────────────────────────────────────────
class _QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Action',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.inventory_2_outlined,
                  label: 'Tambah Produk',
                  bgColor: const Color(0xFFE8F5F1),
                  iconColor: AppColors.primary,
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.receipt_long_outlined,
                  label: 'Lihat Order',
                  bgColor: const Color(0xFFEEF2FF),
                  iconColor: const Color(0xFF4F46E5),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.local_offer_outlined,
                  label: 'Buat Promo',
                  bgColor: const Color(0xFFFFF7ED),
                  iconColor: const Color(0xFFF97316),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.bgColor,
    required this.iconColor,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color bgColor;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
