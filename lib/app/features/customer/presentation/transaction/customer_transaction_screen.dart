import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/notification/customer_notification_screen.dart';
import 'package:warunk/app/features/customer/presentation/transaction/bloc/customer_transaction_bloc.dart';
import 'package:warunk/app/features/customer/presentation/transaction_detail/customer_transaction_detail_screen.dart';
import 'package:warunk/theme/app_colors.dart';

class CustomerTransactionScreen extends StatelessWidget {
  const CustomerTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomerTransactionBloc(),
      child: const _TransactionView(),
    );
  }
}

class _TransactionView extends StatelessWidget {
  const _TransactionView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<CustomerTransactionBloc, CustomerTransactionState>(
          builder: (context, state) {
            return Column(
              children: [
                // ── Header ────────────────────────────────────────────────
                _buildHeader(context),

                // ── Tabs ──────────────────────────────────────────────────
                _buildTabs(context, state),
                const SizedBox(height: 12),

                // ── Filters ───────────────────────────────────────────────
                _buildFilters(context, state),
                const SizedBox(height: 12),

                // ── List ──────────────────────────────────────────────────
                Expanded(child: _buildList(context, state)),
              ],
            );
          },
        ),
      ),
    );
  }

  // ── Header ────────────────────────────────────────────────────────────────
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Row(
        children: [
          const Text(
            'Transaksi',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const CustomerNotificationScreen(),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.greyBorder),
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: AppColors.textDark,
                    size: 22,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Tab bar ───────────────────────────────────────────────────────────────
  Widget _buildTabs(BuildContext context, CustomerTransactionState state) {
    final tabs = ['Berlangsung', 'Selesai', 'Dibatalkan'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.greyBorder),
        ),
        child: Row(
          children: List.generate(tabs.length, (i) {
            final active = state.selectedTab == i;
            return Expanded(
              child: GestureDetector(
                onTap: () => context.read<CustomerTransactionBloc>().add(
                  CustomerTransactionTabChanged(i),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  decoration: BoxDecoration(
                    color: active ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Center(
                    child: Text(
                      tabs[i],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: active ? Colors.white : AppColors.greyText,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  // ── Filter row ────────────────────────────────────────────────────────────
  Widget _buildFilters(BuildContext context, CustomerTransactionState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _filterChip(
            icon: Icons.calendar_today_outlined,
            label: state.dateFilter,
            onTap: () => _showDateFilter(context),
          ),
          const SizedBox(width: 10),
          _filterChip(
            icon: Icons.tune_rounded,
            label: state.statusFilter,
            onTap: () => _showStatusFilter(context),
          ),
        ],
      ),
    );
  }

  Widget _filterChip({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.greyBorder),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.textDark),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16,
              color: AppColors.greyText,
            ),
          ],
        ),
      ),
    );
  }

  void _showDateFilter(BuildContext context) {
    final bloc = context.read<CustomerTransactionBloc>();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.greyBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Text(
            'Pilih Tanggal',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          ..._dateOptions.map(
            (opt) => ListTile(
              title: Text(opt),
              onTap: () {
                bloc.add(CustomerTransactionDateFilterChanged(opt));
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showStatusFilter(BuildContext context) {
    final bloc = context.read<CustomerTransactionBloc>();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.greyBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Text(
            'Pilih Status',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          ..._statusOptions.map(
            (opt) => ListTile(
              title: Text(opt),
              onTap: () {
                bloc.add(CustomerTransactionStatusFilterChanged(opt));
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  static const _dateOptions = [
    'Semua Tanggal',
    'Hari ini',
    'Minggu ini',
    'Bulan ini',
  ];
  static const _statusOptions = [
    'Semua Status',
    'Diproses',
    'Menunggu Bayar',
    'Dikirim',
    'Selesai',
    'Dibatalkan',
  ];

  // ── Transaction list ──────────────────────────────────────────────────────
  Widget _buildList(BuildContext context, CustomerTransactionState state) {
    final items = state.filteredTransactions;
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.receipt_long_outlined,
                size: 40,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Belum ada transaksi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Transaksimu akan tampil di sini',
              style: TextStyle(fontSize: 13, color: AppColors.greyText),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (ctx, i) => _transactionCard(ctx, items[i]),
    );
  }

  // ── Transaction card ──────────────────────────────────────────────────────
  Widget _transactionCard(BuildContext context, CustomerTransactionEntity tx) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Store photo (gradient simulation)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: _StorePhotoWidget(
                      storeName: tx.storeName,
                      color1: tx.storeColor1,
                      color2: tx.storeColor2,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              tx.storeName,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textDark,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          _statusBadge(tx.status),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            size: 14,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${tx.itemCount} item',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.greyText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.greyText,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        _fmt(tx.total),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textDark,
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
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.greyBorder)),
            ),
            child: Row(
              children: [
                Text(
                  tx.dateLabel,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.greyText,
                  ),
                ),
                if (tx.orderId != null) ...[
                  const SizedBox(width: 6),
                  const Text(
                    '•',
                    style: TextStyle(color: AppColors.greyText, fontSize: 12),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    tx.orderId!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
                const Spacer(),
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
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 2),
                      const Icon(
                        Icons.chevron_right_rounded,
                        size: 16,
                        color: AppColors.primary,
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
  Widget _statusBadge(TxStatus status) {
    late String label;
    late Color bgColor;
    late Color textColor;
    late bool outlined;

    switch (status) {
      case TxStatus.diproses:
        label = 'Diproses';
        bgColor = AppColors.primary;
        textColor = Colors.white;
        outlined = false;
        break;
      case TxStatus.menungguBayar:
        label = 'Menunggu Bayar';
        bgColor = const Color(0xFFFFF3E0);
        textColor = const Color(0xFFF59E0B);
        outlined = false;
        break;
      case TxStatus.dikirim:
        label = 'Dikirim';
        bgColor = const Color(0xFFE3F2FD);
        textColor = const Color(0xFF1976D2);
        outlined = false;
        break;
      case TxStatus.selesai:
        label = 'Selesai';
        bgColor = Colors.transparent;
        textColor = AppColors.primary;
        outlined = true;
        break;
      case TxStatus.dibatalkan:
        label = 'Dibatalkan';
        bgColor = const Color(0xFFFFEBEE);
        textColor = Colors.red;
        outlined = false;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : bgColor,
        borderRadius: BorderRadius.circular(20),
        border: outlined
            ? Border.all(color: AppColors.primary, width: 1.5)
            : null,
      ),
      child: Text(
        label,
        style: TextStyle(
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
  const _StorePhotoWidget({
    required this.storeName,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    final initial = storeName.isNotEmpty ? storeName[0] : 'W';
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background gradient (simulates store interior/exterior)
        CustomPaint(
          painter: _StorePhotoMockPainter(color1: color1, color2: color2),
        ),
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
              style: const TextStyle(
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
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white.withValues(alpha: 0.25),
            ),
          ),
        ),
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
