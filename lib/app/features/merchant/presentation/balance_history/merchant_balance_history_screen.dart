import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/app/features/merchant/presentation/balance_history/bloc/merchant_balance_history_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/app/features/merchant/presentation/manual_transfer/merchant_balance_manual_transfer_screen.dart';
import 'package:warunk/app/features/merchant/presentation/balance_topup_payment/merchant_balance_topup_payment_screen.dart';
import 'package:warunk/app/features/merchant/presentation/input_topup/merchant_input_topup_screen.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/number_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';

class MerchantBalanceHistoryScreen extends StatelessWidget {
  const MerchantBalanceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MerchantBalanceHistoryBloc>()
            ..add(MerchantBalanceHistoryEventFetch()),
      child:
          BlocConsumer<MerchantBalanceHistoryBloc, MerchantBalanceHistoryState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                DialogHelper.showErrorSnackBar(
                  context: context,
                  text: state.errorMessage!,
                );
              }
            },
            builder: (context, state) {
              final colorSchema = GlobalHelper.getColorSchema(context);
              final titleLarge = GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.TITLE_LARGE,
              );

              return Scaffold(
                backgroundColor: Colors.grey[50],
                appBar: AppBar(
                  title: const Text('Riwayat Saldo UANK'),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  iconTheme: IconThemeData(color: colorSchema.primary),
                  titleTextStyle: titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                body: _bodyBuild(context),
              );
            },
          ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantBalanceHistoryBloc>().state;

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
    final state = context.watch<MerchantBalanceHistoryBloc>().state;

    if (!state.isLoading &&
        state.errorMessage != null &&
        state.histories.isEmpty) {
      return Center(child: Text(state.errorMessage ?? 'Terjadi kesalahan'));
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<MerchantBalanceHistoryBloc>().add(
          MerchantBalanceHistoryEventFetch(),
        );
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          _headerLayout(context),
          _filterLayout(context),
          if (!state.isLoading && state.filteredHistories.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        size: 56,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        state.selectedStatusFilter == 'all'
                            ? 'Belum ada riwayat transaksi'
                            : 'Tidak ada transaksi dengan status ini',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            _listLayout(context),
        ],
      ),
    );
  }

  Widget _filterLayout(BuildContext context) {
    final state = context.watch<MerchantBalanceHistoryBloc>().state;
    final colorSchema = GlobalHelper.getColorSchema(context);

    final filters = [
      {'key': 'all', 'label': 'Semua'},
      {'key': 'success', 'label': 'Berhasil'},
      {'key': 'pending', 'label': 'Menunggu Pembayaran'},
      {'key': 'waiting_proof', 'label': 'Menunggu Bukti Transfer'},
      {'key': 'failed', 'label': 'Gagal'},
    ];

    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        height: 38,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: filters.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final filter = filters[index];
            final isSelected = state.selectedStatusFilter == filter['key'];

            return InkWell(
              onTap: () {
                context.read<MerchantBalanceHistoryBloc>().add(
                      MerchantBalanceHistoryEventChangeFilter(
                        filter['key']!,
                      ),
                    );
              },
              borderRadius: BorderRadius.circular(20),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? colorSchema.primary : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? colorSchema.primary
                        : Colors.grey.shade300,
                  ),
                ),
                child: Center(
                  child: Text(
                    filter['label']!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _headerLayout(BuildContext context) {
    final state = context.watch<MerchantBalanceHistoryBloc>().state;
    final colorSchema = GlobalHelper.getColorSchema(context);
    final titleLarge = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_LARGE,
    );
    final bodyMedium = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_MEDIUM,
    );

    final currentBalance = state.summary?.currentBalance ?? 0;

    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colorSchema.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo UANK anda saat ini',
              style: bodyMedium?.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  NumberHelper.formatIDR(currentBalance),
                  style: titleLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await navigatorKey.currentState?.push(
                      MaterialPageRoute(
                        builder: (context) => const MerchantInputTopupScreen(),
                      ),
                    );
                    if (context.mounted) {
                      context.read<MerchantBalanceHistoryBloc>().add(
                        MerchantBalanceHistoryEventFetch(),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Top Up',
                      style: bodyMedium?.copyWith(
                        color: colorSchema.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _listLayout(BuildContext context) {
    final state = context.watch<MerchantBalanceHistoryBloc>().state;
    final titleMedium = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_MEDIUM,
    );
    final labelSmall = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.LABEL_SMALL,
    );
    final colorSchema = GlobalHelper.getColorSchema(context);

    final filteredList = state.filteredHistories;

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = filteredList[index];
        final isIncoming = item.status == 'incoming';
        final icon = isIncoming ? Icons.arrow_downward : Icons.arrow_upward;
        final iconColor = isIncoming ? Colors.green : Colors.red;

        String formattedDate = '';
        if (item.createdAt != null) {
          try {
            final date = DateTime.parse(item.createdAt!).toLocal();
            formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(date);
          } catch (_) {}
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor),
            ),
            title: Text(
              item.reasonLabel ?? item.reason ?? 'Transaksi',
              style: titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formattedDate,
                    style: labelSmall?.copyWith(color: Colors.grey[600]),
                  ),
                  if (item.paymentStatusLabel != null ||
                      item.paymentStatus != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: item.paymentStatus == 'success'
                              ? Colors.green.withValues(alpha: 0.1)
                              : item.paymentStatus == 'pending'
                              ? Colors.orange.withValues(alpha: 0.1)
                              : Colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          item.paymentStatusLabel ?? item.paymentStatus ?? '',
                          style: labelSmall?.copyWith(
                            color: item.paymentStatus == 'success'
                                ? Colors.green
                                : item.paymentStatus == 'pending'
                                ? Colors.orange
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${isIncoming ? '+' : '-'}${NumberHelper.formatIDR(item.amount ?? 0)}',
                  style: titleMedium?.copyWith(
                    color: iconColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (item.paymentStatus == 'pending' && item.paymentUrl != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: InkWell(
                      onTap: () async {
                        await navigatorKey.currentState?.push(
                          MaterialPageRoute(
                            builder: (context) =>
                                MerchantBalanceTopupPaymentScreen(
                                  paymentUrl: item.paymentUrl!,
                                ),
                          ),
                        );
                        if (context.mounted) {
                          context.read<MerchantBalanceHistoryBloc>().add(
                            MerchantBalanceHistoryEventFetch(),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorSchema.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Bayar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                else if (item.paymentStatus == 'waiting_proof' ||
                    (item.paymentStatus == 'pending' &&
                        item.paymentType == 'manual_transfer'))
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: InkWell(
                      onTap: () async {
                        await navigatorKey.currentState?.push(
                          MaterialPageRoute(
                            builder: (context) =>
                                MerchantBalanceManualTransferScreen(
                                  topUpItem: item,
                                ),
                          ),
                        );
                        if (context.mounted) {
                          context.read<MerchantBalanceHistoryBloc>().add(
                            MerchantBalanceHistoryEventFetch(),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade700,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Unggah Bukti',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }, childCount: filteredList.length),
    );
  }
}
