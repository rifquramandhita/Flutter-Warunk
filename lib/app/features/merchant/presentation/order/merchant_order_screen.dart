import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/app/features/merchant/presentation/detail_order/merchant_detail_order_screen.dart';
import 'package:warunk/app/features/merchant/presentation/order/bloc/merchant_order_bloc.dart';
import 'package:warunk/theme/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point — provides BLoC
// ─────────────────────────────────────────────────────────────────────────────
class MerchantOrderScreen extends StatelessWidget {
  const MerchantOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantOrderBloc(),
      child: const _MerchantOrderView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main view
// ─────────────────────────────────────────────────────────────────────────────
class _MerchantOrderView extends StatelessWidget {
  const _MerchantOrderView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      body: const Column(
        children: [
          SizedBox(height: 12),
          _TabFilter(),
          SizedBox(height: 8),
          Expanded(child: _OrderList()),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text(
        'Order Masuk',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => context.read<MerchantOrderBloc>().add(
            MerchantOrderFilterTapped(),
          ),
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.filter_alt_outlined,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tab filter — Baru / Diproses / Selesai / Dibatalkan
// ─────────────────────────────────────────────────────────────────────────────
class _TabFilter extends StatelessWidget {
  const _TabFilter();

  static const _tabs = ['Baru', 'Diproses', 'Selesai', 'Dibatalkan'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantOrderBloc, MerchantOrderState>(
      builder: (context, state) {
        return SizedBox(
          height: 38,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _tabs.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final isSelected = state.selectedTab == index;
              return GestureDetector(
                onTap: () => context.read<MerchantOrderBloc>().add(
                  MerchantOrderTabChanged(index),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary.withValues(alpha: 0.13)
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary.withValues(alpha: 0.5)
                          : AppColors.greyBorder,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _tabs[index],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.greyText,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Order list
// ─────────────────────────────────────────────────────────────────────────────
class _OrderList extends StatelessWidget {
  const _OrderList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantOrderBloc, MerchantOrderState>(
      builder: (context, state) {
        final orders = state.filteredOrders;

        if (orders.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt_long_outlined,
                  size: 64,
                  color: AppColors.greyText.withValues(alpha: 0.35),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Belum ada order',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          itemCount: orders.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) => _OrderCard(order: orders[index]),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Order card
// ─────────────────────────────────────────────────────────────────────────────
class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});
  final MerchantOrderItem order;

  static final _currency = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
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
        children: [
          // ── Top section ──────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shopping bag icon
                _ShoppingBagIcon(status: order.status),
                const SizedBox(width: 12),
                // Order info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order ID + status badge
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              order.orderId,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.greyText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          _StatusBadge(status: order.status),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Customer name
                      Text(
                        order.customerName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Date + item count
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              order.dateTime,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.greyText,
                              ),
                            ),
                          ),
                          Text(
                            '${order.itemCount} item',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.greyText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Total price (right aligned)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          _currency.format(order.total),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ── Divider ──────────────────────────────────────────────────────
          const Divider(height: 1, color: AppColors.greyBorder),
          // ── Bottom section ────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
            child: Row(
              children: [
                // Location icon
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.primary,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 8),
                // Pickup info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.pickupType == MerchantPickupType.ambilDiTempat
                            ? 'Ambil di Tempat'
                            : 'Diantar',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                      Text(
                        order.storeName,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.greyText,
                        ),
                      ),
                    ],
                  ),
                ),
                // Lihat Detail button
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const MerchantDetailOrderScreen(),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.6),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Lihat Detail',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Icon(
                          Icons.chevron_right,
                          color: AppColors.primary,
                          size: 16,
                        ),
                      ],
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
}

// ─────────────────────────────────────────────────────────────────────────────
// Shopping bag icon circle
// ─────────────────────────────────────────────────────────────────────────────
class _ShoppingBagIcon extends StatelessWidget {
  const _ShoppingBagIcon({required this.status});
  final MerchantOrderStatus status;

  @override
  Widget build(BuildContext context) {
    final (bg, icon) = switch (status) {
      MerchantOrderStatus.baru => (
        const Color(0xFFFFF3C4),
        const Color(0xFFF59E0B),
      ),
      MerchantOrderStatus.diproses => (
        const Color(0xFFE8F5F1),
        AppColors.primary,
      ),
      MerchantOrderStatus.selesai => (
        const Color(0xFFF0FDF4),
        const Color(0xFF22C55E),
      ),
      MerchantOrderStatus.dibatalkan => (const Color(0xFFFEF2F2), Colors.red),
    };

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Icon(Icons.shopping_bag_outlined, color: icon, size: 22),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Status badge
// ─────────────────────────────────────────────────────────────────────────────
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});
  final MerchantOrderStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, bg, text) = switch (status) {
      MerchantOrderStatus.baru => (
        'BARU',
        const Color(0xFFFFF3C4),
        const Color(0xFFF59E0B),
      ),
      MerchantOrderStatus.diproses => (
        'DIPROSES',
        const Color(0xFFE8F5F1),
        AppColors.primary,
      ),
      MerchantOrderStatus.selesai => (
        'SELESAI',
        const Color(0xFFF0FDF4),
        const Color(0xFF22C55E),
      ),
      MerchantOrderStatus.dibatalkan => (
        'BATAL',
        const Color(0xFFFEF2F2),
        Colors.red,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: text,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
