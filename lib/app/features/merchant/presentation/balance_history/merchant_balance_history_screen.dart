import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/app/features/merchant/presentation/balance_history/bloc/merchant_balance_history_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
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
          sl<MerchantBalanceHistoryBloc>()..add(MerchantBalanceHistoryEventFetch()),
      child: BlocConsumer<MerchantBalanceHistoryBloc, MerchantBalanceHistoryState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
                context: context, text: state.errorMessage!);
          }
        },
        builder: (context, state) {
          final colorSchema = GlobalHelper.getColorSchema(context);
          final titleLarge = GlobalHelper.getTextTheme(context,
              appTextStyle: AppTextStyle.TITLE_LARGE);

          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              title: const Text('Riwayat Saldo'),
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: colorSchema.primary),
              titleTextStyle: titleLarge?.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.black87),
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

    if (!state.isLoading && state.errorMessage != null && state.histories.isEmpty) {
      return Center(
        child: Text(state.errorMessage ?? 'Terjadi kesalahan'),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<MerchantBalanceHistoryBloc>()
            .add(MerchantBalanceHistoryEventFetch());
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          _headerLayout(context),
          if (!state.isLoading && state.histories.isEmpty)
            const SliverFillRemaining(
              child: Center(child: Text('Belum ada riwayat transaksi')),
            )
          else
            _listLayout(context),
        ],
      ),
    );
  }

  Widget _headerLayout(BuildContext context) {
    final state = context.watch<MerchantBalanceHistoryBloc>().state;
    final colorSchema = GlobalHelper.getColorSchema(context);
    final titleLarge = GlobalHelper.getTextTheme(context,
        appTextStyle: AppTextStyle.TITLE_LARGE);
    final bodyMedium = GlobalHelper.getTextTheme(context,
        appTextStyle: AppTextStyle.BODY_MEDIUM);

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
              'Saldo Saat Ini',
              style: bodyMedium?.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Text(
              NumberHelper.formatIDR(currentBalance),
              style: titleLarge?.copyWith(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listLayout(BuildContext context) {
    final state = context.watch<MerchantBalanceHistoryBloc>().state;
    final titleMedium = GlobalHelper.getTextTheme(context,
        appTextStyle: AppTextStyle.TITLE_MEDIUM);
    final labelSmall = GlobalHelper.getTextTheme(context,
        appTextStyle: AppTextStyle.LABEL_SMALL);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = state.histories[index];
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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                child: Text(
                  formattedDate,
                  style: labelSmall?.copyWith(color: Colors.grey[600]),
                ),
              ),
              trailing: Text(
                '${isIncoming ? '+' : '-'}${NumberHelper.formatIDR(item.amount ?? 0)}',
                style: titleMedium?.copyWith(
                  color: iconColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        childCount: state.histories.length,
      ),
    );
  }
}
