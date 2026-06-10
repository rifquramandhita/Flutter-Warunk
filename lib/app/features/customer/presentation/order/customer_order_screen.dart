import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/order/bloc/customer_order_bloc.dart';
import 'package:warunk/app/features/customer/presentation/transaction_detail/customer_transaction_detail_screen.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/core/helper/global_helper.dart';

import 'package:warunk/core/dependency/dependency.dart';

class CustomerOrderScreen extends StatelessWidget {
  const CustomerOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CustomerOrderBloc>()..add(CustomerOrderFetchStarted()),
      child: BlocConsumer<CustomerOrderBloc, CustomerOrderState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            // Usually we'd use DialogHelper.showErrorSnackBar but let's just use ScaffoldMessenger for simplicity or if DialogHelper isn't imported
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        builder: (context, state) {
          return Scaffold(appBar: _appBarBuild(), body: _bodyBuild(context));
        },
      ),
    );
  }

  AppBar _appBarBuild() {
    return AppBar(title: Text('Pesanan'));
  }

  Widget _bodyBuild(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          // Loading indicator could be added here if needed
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<CustomerOrderBloc>().state;
    return Column(
      children: [
        _buildFilters(context, state),
        SizedBox(height: 12),

        // ── List ──────────────────────────────────────────────────
        Expanded(child: _buildList(context, state)),
      ],
    );
  }

  Widget _buildFilters(BuildContext context, CustomerOrderState state) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            _filterChip(
              context,
              icon: Icons.calendar_today_outlined,
              label: _formatDateRange(state.dateRangeFilter),
              onTap: () => _showDateFilter(context),
              onClear: state.dateRangeFilter != null
                  ? () {
                      context.read<CustomerOrderBloc>().add(
                        CustomerOrderDateRangeFilterChanged(null),
                      );
                    }
                  : null,
            ),
            SizedBox(width: 10),
            _filterChip(
              context,
              icon: Icons.tune_rounded,
              label: state.statusFilter,
              onTap: () => _showStatusFilter(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterChip(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    VoidCallback? onClear,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: GlobalHelper.getColorSchema(context).outlineVariant,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: GlobalHelper.getColorSchema(context).onSurface,
            ),
            SizedBox(width: 6),
            Text(
              label,
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM,
                  )?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: GlobalHelper.getColorSchema(context).onSurface,
                  ),
            ),
            SizedBox(width: 4),
            GestureDetector(
              onTap: onClear ?? onTap,
              child: Icon(
                onClear != null
                    ? Icons.close
                    : Icons.keyboard_arrow_down_rounded,
                size: 16,
                color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateRange(DateTimeRange? range) {
    if (range == null) return 'Semua Tanggal';
    final start = range.start;
    final end = range.end;
    if (start.year == end.year &&
        start.month == end.month &&
        start.day == end.day) {
      return '${start.day.toString().padLeft(2, '0')}/${start.month.toString().padLeft(2, '0')}/${start.year}';
    }
    return '${start.day.toString().padLeft(2, '0')}/${start.month.toString().padLeft(2, '0')} - ${end.day.toString().padLeft(2, '0')}/${end.month.toString().padLeft(2, '0')}/${end.year}';
  }

  Future<void> _showDateFilter(BuildContext context) async {
    final bloc = context.read<CustomerOrderBloc>();
    final currentRange = bloc.state.dateRangeFilter;

    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: currentRange,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: GlobalHelper.getColorSchema(context).primary,
              onPrimary: Colors.white,
              onSurface: GlobalHelper.getColorSchema(context).onSurface,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      bloc.add(CustomerOrderDateRangeFilterChanged(picked));
    }
  }

  void _showStatusFilter(BuildContext context) {
    final bloc = context.read<CustomerOrderBloc>();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: GlobalHelper.getColorSchema(context).outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                'Pilih Status',
                style: GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                )?.copyWith(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 12),
              ..._statusOptions.map(
                (opt) => ListTile(
                  title: Text(opt),
                  onTap: () {
                    bloc.add(CustomerOrderStatusFilterChanged(opt));
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  static const _statusOptions = [
    'Semua',
    'Menunggu Pembayaran',
    'Menunggu Konfirmasi Pembayaran',
    'Menunggu Pembatalan',
    'Diproses',
    'Dikirim',
    'Diterima',
    'Selesai',
    'Dibatalkan',
  ];

  // ── Transaction list ──────────────────────────────────────────────────────
  Widget _buildList(BuildContext context, CustomerOrderState state) {
    if (state.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (state.errorMessage != null) {
      return Center(
        child: Text(
          state.errorMessage!,
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_MEDIUM,
          )?.copyWith(color: Colors.red),
        ),
      );
    }
    final items = state.filteredTransactions;
    Future<void> handleRefresh() async {
      context.read<CustomerOrderBloc>().add(CustomerOrderFetchStarted());
      await Future.delayed(const Duration(milliseconds: 800));
    }

    if (items.isEmpty) {
      return RefreshIndicator(
        color: GlobalHelper.getColorSchema(context).primary,
        backgroundColor: Colors.white,
        onRefresh: handleRefresh,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Container(
                  height: constraints.maxHeight,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: GlobalHelper.getColorSchema(
                            context,
                          ).primary.withValues(alpha: 0.08),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.receipt_long_outlined,
                          size: 40,
                          color: GlobalHelper.getColorSchema(context).primary,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Belum ada transaksi',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurface,
                            ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Transaksimu akan tampil di sini',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontSize: 13,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    return RefreshIndicator(
      color: GlobalHelper.getColorSchema(context).primary,
      backgroundColor: Colors.white,
      onRefresh: handleRefresh,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (ctx, i) => _transactionCard(ctx, items[i]),
      ),
    );
  }

  // ── Transaction card ──────────────────────────────────────────────────────
  Widget _transactionCard(BuildContext context, CustomerOrderEntity tx) {
    final storeName = tx.merchant?['name'] ?? 'Warunk Nusantara1';
    final storeColor1 = const Color(0xFF1B5E20);
    final storeColor2 = const Color(0xFF4CAF50);
    final itemCount = tx.items?.length ?? 0;
    final total = tx.total ?? 0;
    final dateLabel = tx.createdAt != null
        ? tx.createdAt!.split('T').first
        : '-';
    final orderId = tx.invoiceNumber;
    final status = tx.status ?? '';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top section: image + info
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Store photo
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: _StorePhotoWidget(
                      storeName: storeName,
                      color1: storeColor1,
                      color2: storeColor2,
                      imageUrl: tx.merchant?['photo'] as String?,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: _statusBadge(context, status),
                      ),
                      SizedBox(height: 6),
                      Text(
                        storeName,
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurface,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 14,
                            color: GlobalHelper.getColorSchema(context).primary,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '$itemCount item',
                            style:
                                GlobalHelper.getTextTheme(
                                  context,
                                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                                )?.copyWith(
                                  fontSize: 12,
                                  color: GlobalHelper.getColorSchema(
                                    context,
                                  ).onSurfaceVariant,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Total',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontSize: 11,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurfaceVariant,
                            ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        _fmt(total),
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurface,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom section: date + order id + detail button
          Container(
            padding: EdgeInsets.fromLTRB(14, 10, 14, 12),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: GlobalHelper.getColorSchema(context).outlineVariant,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        dateLabel,
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontSize: 12,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurfaceVariant,
                            ),
                      ),
                      if (orderId != null) ...[
                        SizedBox(width: 6),
                        Text(
                          '•',
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_MEDIUM,
                              )?.copyWith(
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).onSurfaceVariant,
                                fontSize: 12,
                              ),
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            orderId,
                            style:
                                GlobalHelper.getTextTheme(
                                  context,
                                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                                )?.copyWith(
                                  fontSize: 12,
                                  color: GlobalHelper.getColorSchema(
                                    context,
                                  ).onSurfaceVariant,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          CustomerTransactionDetailScreen(transaction: tx),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Lihat Detail',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).primary,
                            ),
                      ),
                      SizedBox(width: 2),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 16,
                        color: GlobalHelper.getColorSchema(context).primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Status badge ──────────────────────────────────────────────────────────
  Widget _statusBadge(BuildContext context, String status) {
    late String label;
    late Color bgColor;
    late Color textColor;
    late bool outlined;

    switch (status) {
      case 'waiting_payment':
        label = 'Menunggu Pembayaran';
        bgColor = const Color(0xFFFFF3E0);
        textColor = const Color(0xFFF59E0B);
        outlined = false;
        break;
      case 'waiting_payment_confirmation':
        label = 'Menunggu Konfirmasi Pembayaran';
        bgColor = const Color(0xFFFFF3E0);
        textColor = const Color(0xFFF59E0B);
        outlined = false;
        break;
      case 'waiting_cancel':
        label = 'Menunggu Pembatalan';
        bgColor = const Color(0xFFFFEBEE);
        textColor = Colors.red;
        outlined = false;
        break;
      case 'processing':
        label = 'Diproses';
        bgColor = GlobalHelper.getColorSchema(context).primary;
        textColor = Colors.white;
        outlined = false;
        break;
      case 'shipped':
        label = 'Dikirim';
        bgColor = const Color(0xFFE3F2FD);
        textColor = const Color(0xFF1976D2);
        outlined = false;
        break;
      case 'received':
        label = 'Diterima';
        bgColor = const Color(0xFFE8F5E9);
        textColor = const Color(0xFF2E7D32);
        outlined = false;
        break;
      case 'completed':
        label = 'Selesai';
        bgColor = Colors.transparent;
        textColor = GlobalHelper.getColorSchema(context).primary;
        outlined = true;
        break;
      case 'cancelled':
        label = 'Dibatalkan';
        bgColor = const Color(0xFFFFEBEE);
        textColor = Colors.red;
        outlined = false;
        break;
      default:
        label = status;
        bgColor = Colors.grey.shade200;
        textColor = Colors.black54;
        outlined = false;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : bgColor,
        borderRadius: BorderRadius.circular(20),
        border: outlined
            ? Border.all(
                color: GlobalHelper.getColorSchema(context).primary,
                width: 1.5,
              )
            : null,
      ),
      child: Text(
        label,
        style:
            GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.BODY_MEDIUM,
            )?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
      ),
    );
  }

  String _fmt(int v) {
    final s = v.toString();
    final buf = StringBuffer('Rp');
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return buf.toString();
  }
}

// ── Store Photo Widget ─────────────────────────────────────────────────────
/// Simulates a store photo using gradient + store sign overlay
class _StorePhotoWidget extends StatelessWidget {
  final String storeName;
  final Color color1;
  final Color color2;
  final String? imageUrl;
  const _StorePhotoWidget({
    required this.storeName,
    required this.color1,
    required this.color2,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final initial = storeName.isNotEmpty ? storeName[0] : 'W';
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    return Stack(
      fit: StackFit.expand,
      children: [
        if (hasImage)
          Image.network(
            imageUrl!,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => CustomPaint(
              painter: _StorePhotoMockPainter(color1: color1, color2: color2),
            ),
          )
        else
          // Background gradient (simulates store interior/exterior)
          CustomPaint(
            painter: _StorePhotoMockPainter(color1: color1, color2: color2),
          ),

        if (!hasImage) ...[
          // Store sign bar at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: color1,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              child: Text(
                storeName.toUpperCase(),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_MEDIUM,
                    )?.copyWith(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.3,
                    ),
              ),
            ),
          ),
          // Initial letter watermark
          Center(
            child: Text(
              initial,
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM,
                  )?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.white.withValues(alpha: 0.25),
                  ),
            ),
          ),
        ],
      ],
    );
  }
}

class _StorePhotoMockPainter extends CustomPainter {
  final Color color1;
  final Color color2;
  _StorePhotoMockPainter({required this.color1, required this.color2});

  @override
  void paint(Canvas canvas, Size size) {
    // Main background gradient
    final bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [color2, color1],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // Shelf-like stripes to simulate store interior
    final shelfPaint = Paint()..color = Colors.black.withValues(alpha: 0.10);
    for (int i = 0; i < 3; i++) {
      final y = size.height * (0.25 + i * 0.22);
      canvas.drawRect(Rect.fromLTWH(0, y, size.width, 5), shelfPaint);
    }

    // Products on shelves (small colored rectangles)
    final rng = math.Random(color1.toARGB32());
    final prodColors = [
      Colors.red,
      Colors.yellow,
      Colors.orange,
      Colors.blue,
      Colors.green,
      Colors.purple,
    ];
    for (int i = 0; i < 3; i++) {
      final y = size.height * (0.25 + i * 0.22) - 12;
      double x = 4;
      while (x < size.width - 8) {
        final w = 6 + rng.nextDouble() * 8;
        final h = 8 + rng.nextDouble() * 10;
        final c = prodColors[rng.nextInt(prodColors.length)];
        canvas.drawRect(
          Rect.fromLTWH(x, y - h + 2, w, h),
          Paint()..color = c.withValues(alpha: 0.75),
        );
        x += w + 2;
      }
    }

    // Overhead light effect
    final lightPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0, -0.5),
        radius: 0.7,
        colors: [Colors.white.withValues(alpha: 0.15), Colors.transparent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), lightPaint);
  }

  @override
  bool shouldRepaint(_StorePhotoMockPainter old) => false;
}
