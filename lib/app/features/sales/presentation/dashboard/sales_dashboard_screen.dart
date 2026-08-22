import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/sales/domain/entity/sales_dashboard.dart';
import 'package:warunk/app/features/sales/presentation/dashboard/bloc/sales_dashboard_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:intl/intl.dart';

class SalesDashboardScreen extends StatelessWidget {
  const SalesDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SalesDashboardBloc>()..add(SalesDashboardFetchEvent()),
      child: const _SalesDashboardContent(),
    );
  }
}

class _SalesDashboardContent extends StatelessWidget {
  const _SalesDashboardContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SalesDashboardBloc, SalesDashboardState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage!, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<SalesDashboardBloc>().add(
                      SalesDashboardFetchEvent(),
                    ),
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            );
          } else if (state.data != null) {
            final data = state.data!;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<SalesDashboardBloc>().add(
                  SalesDashboardFetchEvent(),
                );
              },
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildSummarySection(context, data.districtSummary),
                  const SizedBox(height: 24),
                  _buildTopMerchants(context, data.topMerchants),
                  const SizedBox(height: 24),
                  _buildBottomMerchants(context, data.bottomMerchants),
                  const SizedBox(height: 24),
                  _buildTopSales(context, data.topSales),
                ],
              ),
            );
          }
          return const Center(child: Text('Tidak ada data'));
        },
      ),
    );
  }

  Widget _buildSummarySection(
    BuildContext context,
    SalesDashboardSummaryEntity summary,
  ) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ringkasan',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.TITLE_MEDIUM,
          )?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                context,
                'Merchant Terdaftar',
                '${summary.registeredMerchantsCount}',
                Icons.store,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                context,
                'Akuisisi Merchant',
                '${summary.acquiredMerchantsCount}',
                Icons.verified,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                context,
                'Total Transaksi',
                '${summary.totalTransactions}',
                Icons.receipt_long,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                context,
                'Total Pendapatan',
                currencyFormatter.format(summary.totalRevenue),
                Icons.attach_money,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(height: 12),
          Text(
            value,
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.TITLE_MEDIUM,
            )?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.BODY_SMALL,
            )?.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildTopMerchants(
    BuildContext context,
    List<SalesDashboardMerchantEntity> merchants,
  ) {
    if (merchants.isEmpty) return const SizedBox.shrink();
    return _buildListSection(
      context,
      title: 'Top Merchants',
      items: merchants,
      itemBuilder: (merchant) => _buildMerchantTile(context, merchant),
    );
  }

  Widget _buildBottomMerchants(
    BuildContext context,
    List<SalesDashboardMerchantEntity> merchants,
  ) {
    if (merchants.isEmpty) return const SizedBox.shrink();
    return _buildListSection(
      context,
      title: 'Bottom Merchants',
      items: merchants,
      itemBuilder: (merchant) => _buildMerchantTile(context, merchant),
    );
  }

  Widget _buildTopSales(
    BuildContext context,
    List<SalesDashboardTopSalesEntity> sales,
  ) {
    if (sales.isEmpty) return const SizedBox.shrink();
    return _buildListSection(
      context,
      title: 'Top Sales',
      items: sales,
      itemBuilder: (sale) => ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          child: Text(
            '#${sale.rank}',
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          sale.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${sale.districtName} - ${sale.regencyName}'),
        trailing: Text(
          '${sale.metricValue}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildMerchantTile(
    BuildContext context,
    SalesDashboardMerchantEntity merchant,
  ) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
        child: Text(
          '#${merchant.rank}',
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        merchant.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('${merchant.transactionsCount} Transaksi'),
      trailing: Text(
        currencyFormatter.format(merchant.revenue),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  Widget _buildListSection<T>(
    BuildContext context, {
    required String title,
    required List<T> items,
    required Widget Function(T) itemBuilder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.TITLE_MEDIUM,
          )?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: items.map((item) {
              final isLast = items.last == item;
              return Column(
                children: [
                  itemBuilder(item),
                  if (!isLast) Divider(height: 1, color: Colors.grey.shade200),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
