import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/presentation/detail_order/merchant_detail_order_screen.dart';
import 'package:warunk/app/features/merchant/presentation/order/bloc/merchant_order_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/number_helper.dart';

class MerchantOrderScreen extends StatelessWidget {
  const MerchantOrderScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MerchantOrderBloc>()..add(MerchantOrderEventGet()),
      child: BlocConsumer<MerchantOrderBloc, MerchantOrderState>(
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
            appBar: _buildAppBar(context),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantOrderBloc>().state;

    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          (state.isLoading) ? const LoadingAppWidget() : const SizedBox(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    return Column(
      children: [
        _tabFilter(context),
        const SizedBox(height: 8),
        Expanded(child: _orderList(context)),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(title: const Text('Order Masuk'));
  }

  Widget _tabFilter(BuildContext context) {
    final state = context.watch<MerchantOrderBloc>().state;
    final tabs = state.availableTabs;

    if (tabs.isEmpty) return const SizedBox();

    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: tabs.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final tabStatus = tabs[index];
          final isSelected = state.selectedTab == tabStatus;

          final orderForLabel = state.allOrders.firstWhere(
            (o) => o.status?.value == tabStatus,
            orElse: () => const MerchantOrderEntity(id: ''),
          );
          final tabLabel = tabStatus.isEmpty
              ? 'Semua'
              : (orderForLabel.statusLabel ?? tabStatus);

          return GestureDetector(
            onTap: () => context.read<MerchantOrderBloc>().add(
              MerchantOrderEventTabChanged(tabStatus),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: isSelected
                    ? GlobalHelper.getColorSchema(
                        context,
                      ).primary.withValues(alpha: 0.13)
                    : GlobalHelper.getColorSchema(context).surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? GlobalHelper.getColorSchema(
                          context,
                        ).primary.withValues(alpha: 0.5)
                      : GlobalHelper.getColorSchema(context).outlineVariant,
                ),
              ),
              child: Center(
                child: Text(
                  tabLabel,
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_SMALL,
                      )?.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: isSelected
                            ? GlobalHelper.getColorSchema(context).primary
                            : GlobalHelper.getColorSchema(
                                context,
                              ).onSurfaceVariant,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _orderList(BuildContext context) {
    final state = context.watch<MerchantOrderBloc>().state;
    final orders = state.filteredOrders;

    if (orders.isEmpty) {
      if (state.isLoading) {
        return const SizedBox();
      }
      return RefreshIndicator(
        onRefresh: () async {
          context.read<MerchantOrderBloc>().add(MerchantOrderEventGet());
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt_long_outlined,
                      size: 64,
                      color: GlobalHelper.getColorSchema(
                        context,
                      ).onSurfaceVariant.withValues(alpha: 0.35),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Belum ada order',
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_LARGE,
                      )?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<MerchantOrderBloc>().add(MerchantOrderEventGet());
        await Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        itemCount: orders.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) => _orderCard(
          context,
          orders[index],
          orders[index].status?.value ?? '',
          orders[index].statusLabel,
        ),
      ),
    );
  }

  Widget _orderCard(
    BuildContext context,
    MerchantOrderEntity order,
    String tabStatus,
    String? statusLabel,
  ) {
    String formattedDate = '';
    if (order.createdAt != null) {
      try {
        final date = DateTime.parse(order.createdAt!).toLocal();
        formattedDate = DateFormat('dd MMM yyyy • HH:mm', 'id_ID').format(date);
      } catch (_) {
        formattedDate = order.createdAt!;
      }
    }

    final isPickup =
        order.shipping?.type?.toLowerCase() != 'biteship' &&
        order.shipping?.isInstant ==
            false; // Usually pick up is different, assuming Biteship implies delivery
    final pickupLabel = isPickup ? 'Ambil di Tempat' : 'Diantar';

    return GestureDetector(
      onTap: () => _onPressItem(context, order),
      child: Container(
        decoration: BoxDecoration(
          color: GlobalHelper.getColorSchema(context).surface,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Shopping bag icon
                  _shoppingBagIcon(context, tabStatus),
                  const SizedBox(width: 12),
                  // Order info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _statusBadge(context, tabStatus, statusLabel),
                          ],
                        ),
                        Text(
                          order.invoiceNumber ?? order.id,
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_SMALL,
                              )?.copyWith(
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).onSurfaceVariant,
                                fontWeight: FontWeight.w500,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Customer name
                        Text(
                          order.customer?.name ??
                              order.customerAddress?.recipientName ??
                              'Pelanggan',
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.TITLE_MEDIUM,
                              )?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).onSurface,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        // Date + item count
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                formattedDate,
                                style:
                                    GlobalHelper.getTextTheme(
                                      context,
                                      appTextStyle: AppTextStyle.BODY_SMALL,
                                    )?.copyWith(
                                      color: GlobalHelper.getColorSchema(
                                        context,
                                      ).onSurfaceVariant,
                                    ),
                              ),
                            ),
                            Text(
                              '${order.items.length} item',
                              style:
                                  GlobalHelper.getTextTheme(
                                    context,
                                    appTextStyle: AppTextStyle.BODY_SMALL,
                                  )?.copyWith(
                                    color: GlobalHelper.getColorSchema(
                                      context,
                                    ).onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Total price (right aligned)
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            NumberHelper.formatIDR((order.total ?? 0).toInt()),
                            style:
                                GlobalHelper.getTextTheme(
                                  context,
                                  appTextStyle: AppTextStyle.TITLE_SMALL,
                                )?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: GlobalHelper.getColorSchema(
                                    context,
                                  ).primary,
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
            Divider(
              height: 1,
              color: GlobalHelper.getColorSchema(context).outlineVariant,
            ),
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
                      color: GlobalHelper.getColorSchema(
                        context,
                      ).primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: GlobalHelper.getColorSchema(context).primary,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Pickup info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pickupLabel,
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_SMALL,
                            )?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurface,
                            ),
                      ),
                      Text(
                        order.shipping?.originAddress?.name ?? 'Toko Anda',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.LABEL_SMALL,
                            )?.copyWith(
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurfaceVariant,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shoppingBagIcon(BuildContext context, String status) {
    Color bg;
    Color icon;

    if (status == 'completed' || status == 'delivered') {
      bg = const Color(0xFFF0FDF4);
      icon = const Color(0xFF22C55E);
    } else if (status == 'cancelled' || status == 'rejected') {
      bg = const Color(0xFFFEF2F2);
      icon = Colors.red;
    } else if (status == 'processing' || status == 'on_delivery') {
      bg = const Color(0xFFE8F5F1);
      icon = GlobalHelper.getColorSchema(context).primary;
    } else {
      bg = const Color(0xFFFFF3C4);
      icon = const Color(0xFFF59E0B);
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Icon(Icons.shopping_bag_outlined, color: icon, size: 22),
    );
  }

  Widget _statusBadge(BuildContext context, String status, String? label) {
    Color bg;
    Color text;

    if (status == 'completed' || status == 'delivered') {
      bg = const Color(0xFFF0FDF4);
      text = const Color(0xFF22C55E);
    } else if (status == 'cancelled' || status == 'rejected') {
      bg = const Color(0xFFFEF2F2);
      text = Colors.red;
    } else if (status == 'processing' || status == 'on_delivery') {
      bg = const Color(0xFFE8F5F1);
      text = GlobalHelper.getColorSchema(context).primary;
    } else {
      bg = const Color(0xFFFFF3C4);
      text = const Color(0xFFF59E0B);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        (label ?? status).toUpperCase(),
        style:
            GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.LABEL_SMALL,
            )?.copyWith(
              fontWeight: FontWeight.w700,
              color: text,
              letterSpacing: 0.3,
            ),
      ),
    );
  }

  void _onPressItem(BuildContext context, MerchantOrderEntity order) async {
    await navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => MerchantDetailOrderScreen(orderId: order.id),
      ),
    );
    context.read<MerchantOrderBloc>().add(MerchantOrderEventGet());
  }
}
