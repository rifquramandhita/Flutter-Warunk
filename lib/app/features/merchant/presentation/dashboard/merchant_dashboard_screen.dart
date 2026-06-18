import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_dashboard.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order_item.dart';
import 'package:warunk/app/features/merchant/presentation/dashboard/bloc/merchant_dashboard_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/detail_order/merchant_detail_order_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/enum/order_status.dart';
import 'package:warunk/main.dart';

class MerchantDashboardScreen extends StatelessWidget {
  const MerchantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<MerchantDashboardBloc>()..add(MerchantDashboardEventStarted()),
      child: BlocConsumer<MerchantDashboardBloc, MerchantDashboardState>(
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
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantDashboardBloc>().state;
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _dashboardHeader(context),
          const SizedBox(height: 16),
          _statsGrid(context),
          const SizedBox(height: 16),
          _salesChart(context),
          const SizedBox(height: 16),
          _recentOrders(context),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _dashboardHeader(BuildContext context) {
    final state = context.watch<MerchantDashboardBloc>().state;
    final colorSchema = GlobalHelper.getColorSchema(context);

    return Container(
      color: colorSchema.surface,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: colorSchema.primary.withValues(alpha: 0.15),
                  border: Border.all(
                    color: colorSchema.primary.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: state.merchantPhoto.isNotEmpty
                      ? Image.network(
                          state.merchantPhoto,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(
                                Icons.storefront,
                                color: colorSchema.primary,
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            '🏪',
                            style: GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.DISPLAY_SMALL,
                            )?.copyWith(fontSize: 28),
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.merchantName.isEmpty
                          ? 'Warunk Bu Siti'
                          : state.merchantName,
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.TITLE_LARGE,
                          )?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorSchema.onSurface,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: colorSchema.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        state.merchantCategory.isEmpty
                            ? 'Merchant'
                            : state.merchantCategory,
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.LABEL_SMALL,
                            )?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorSchema.primary,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: colorSchema.surface,
                      shape: BoxShape.circle,
                      border: Border.all(color: colorSchema.outlineVariant),
                    ),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: colorSchema.onSurface,
                      size: 20,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: colorSchema.error,
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
              Text(
                state.merchantTime.isEmpty
                    ? 'Toko buka  •  08:00 – 22:00'
                    : state.merchantTime,
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.LABEL_MEDIUM,
                    )?.copyWith(
                      color: colorSchema.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statsGrid(BuildContext context) {
    final state = context.watch<MerchantDashboardBloc>().state;
    final colorSchema = GlobalHelper.getColorSchema(context);
    final fmt = NumberFormat.decimalPattern('id');
    final currency = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _statCard(
                  context,
                  iconBg: const Color(0xFFE8F5F1),
                  icon: Icons.shopping_bag_outlined,
                  iconColor: colorSchema.primary,
                  label: 'Pesanan Baru',
                  value: fmt.format(state.newOrders),
                  valueColor: colorSchema.primary,
                  subtitle: 'Perlu diproses',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _statCard(
                  context,
                  iconBg: const Color(0xFFEEF2FF),
                  icon: Icons.bar_chart_rounded,
                  iconColor: const Color(0xFF4F46E5),
                  label: 'Penjualan Hari Ini',
                  value: currency.format(state.todaySales),
                  valueColor: const Color(0xFF4F46E5),
                  subtitle: '▲ ${state.salesGrowth}% dari kemarin',
                  subtitleColor: const Color(0xFF22C55E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _statCard(
                  context,
                  iconBg: const Color(0xFFFFF7ED),
                  icon: Icons.inventory_2_outlined,
                  iconColor: const Color(0xFFF97316),
                  label: 'Produk Aktif',
                  value: fmt.format(state.activeProducts),
                  valueColor: const Color(0xFFF97316),
                  subtitle: 'Dari ${state.totalProducts} produk',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _statCard(
                  context,
                  iconBg: const Color(0xFFF0FDF4),
                  icon: Icons.account_balance_wallet_outlined,
                  iconColor: colorSchema.primary,
                  label: 'Saldo Masuk',
                  value: currency.format(state.balance),
                  valueColor: colorSchema.primary,
                  subtitle: 'Dapat ditarik',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statCard(
    BuildContext context, {
    required Color iconBg,
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required Color valueColor,
    required String subtitle,
    Color? subtitleColor,
    bool showArrow = false,
  }) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorSchema.surface,
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
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.LABEL_SMALL,
            )?.copyWith(color: colorSchema.onSurfaceVariant),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.TITLE_MEDIUM,
            )?.copyWith(fontWeight: FontWeight.bold, color: valueColor),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  subtitle,
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.LABEL_SMALL,
                      )?.copyWith(
                        fontSize: 10,
                        color: subtitleColor ?? colorSchema.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              if (showArrow)
                Icon(
                  Icons.chevron_right,
                  color: colorSchema.onSurfaceVariant,
                  size: 16,
                ),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Sales Chart
  Widget _salesChart(BuildContext context) {
    final state = context.watch<MerchantDashboardBloc>().state;
    final colorSchema = GlobalHelper.getColorSchema(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorSchema.surface,
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
          Text(
            'Penjualan 7 Hari Terakhir',
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.TITLE_SMALL,
                )?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorSchema.onSurface,
                ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 160,
            child: _lineChart(
              context,
              data: state.salesData,
              labels: state.salesLabels,
            ),
          ),
        ],
      ),
    );
  }

  Widget _lineChart(
    BuildContext context, {
    required List<double> data,
    required List<String> labels,
  }) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    return Column(
      children: [
        Expanded(
          child: CustomPaint(
            painter: _LineChartPainter(
              data: data,
              primaryColor: colorSchema.primary,
              greyTextColor: colorSchema.onSurfaceVariant,
              greyBorderColor: colorSchema.outlineVariant,
              whiteColor: colorSchema.surface,
            ),
            child: const SizedBox.expand(),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: labels.map((label) {
            return Text(
              label,
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.LABEL_SMALL,
              )?.copyWith(fontSize: 10, color: colorSchema.onSurfaceVariant),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _LineChartPainter extends CustomPainter {
  const _LineChartPainter({
    required this.data,
    required this.primaryColor,
    required this.greyTextColor,
    required this.greyBorderColor,
    required this.whiteColor,
  });
  final List<double> data;
  final Color primaryColor;
  final Color greyTextColor;
  final Color greyBorderColor;
  final Color whiteColor;

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
        primaryColor.withValues(alpha: 0.2),
        primaryColor.withValues(alpha: 0.02),
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
        style: TextStyle(color: greyTextColor, fontSize: 9),
      );
      textPainter.layout();
      // skip painting labels (handled outside if needed)
    }

    // Draw line
    final linePaint = Paint()
      ..color = primaryColor
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
      ..color = whiteColor
      ..style = PaintingStyle.fill;
    final dotBorderPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (final p in points) {
      canvas.drawCircle(p, 4, dotPaint);
      canvas.drawCircle(p, 4, dotBorderPaint);
    }
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end) {
    final paint = Paint()
      ..color = greyBorderColor
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

Widget _recentOrders(BuildContext context) {
  final state = context.watch<MerchantDashboardBloc>().state;
  final colorSchema = GlobalHelper.getColorSchema(context);
  final currency = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Terbaru',
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.TITLE_SMALL,
              )?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorSchema.onSurface,
              ),
        ),
        const SizedBox(height: 12),
        ...state.recentOrders.map(
          (order) => _orderItem(context, order: order, currency: currency),
        ),
      ],
    ),
  );
}

Widget _orderItem(
  BuildContext context, {
  required MerchantDashboardRecentOrder order,
  required NumberFormat currency,
}) {
  final colorSchema = GlobalHelper.getColorSchema(context);

  return GestureDetector(
    onTap: () => _onPressItemOrder(context, order.id),
    child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colorSchema.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [_statusBadge(context, status: order.status)],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: colorSchema.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              order.invoiceNumber,
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.LABEL_SMALL,
                  )?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorSchema.primary,
                  ),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.customerName,
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.LABEL_MEDIUM,
                          )?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorSchema.onSurface,
                          ),
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    currency.format(order.total),
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.LABEL_MEDIUM,
                        )?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorSchema.onSurface,
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.chevron_right,
                color: colorSchema.onSurfaceVariant,
                size: 18,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _statusBadge(BuildContext context, {required OrderStatus? status}) {
  if (status == null) return const SizedBox.shrink();

  final colorSchema = GlobalHelper.getColorSchema(context);
  final color = switch (status) {
    OrderStatus.waitingPayment ||
    OrderStatus.waitingPaymentConfirmation => const Color(0xFFFACC15),
    OrderStatus.processing => const Color(0xFFF97316),
    OrderStatus.shipped || OrderStatus.received => colorSchema.primary,
    OrderStatus.completed => const Color(0xFF22C55E),
    OrderStatus.waitingCancel || OrderStatus.cancelled => colorSchema.error,
  };

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      status.label,
      style: GlobalHelper.getTextTheme(
        context,
        appTextStyle: AppTextStyle.LABEL_SMALL,
      )?.copyWith(fontWeight: FontWeight.w600, color: color),
    ),
  );
}

void _onPressItemOrder(BuildContext context, String id) async {
  final bloc = context.read<MerchantDashboardBloc>();
  await navigatorKey.currentState?.push(
    MaterialPageRoute(
      builder: (context) => MerchantDetailOrderScreen(orderId: id),
    ),
  );
  bloc.add(MerchantDashboardEventStarted());
}
