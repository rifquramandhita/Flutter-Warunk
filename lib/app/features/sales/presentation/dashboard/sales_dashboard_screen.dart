import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/sales/domain/entity/sales_dashboard.dart';
import 'package:warunk/app/features/sales/presentation/dashboard/bloc/sales_dashboard_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:intl/intl.dart';

class SalesDashboardScreen extends StatelessWidget {
  const SalesDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SalesDashboardBloc>()..add(SalesDashboardFetchEvent()),
      child: BlocConsumer<SalesDashboardBloc, SalesDashboardState>(
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
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<SalesDashboardBloc>().state;
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
    final state = context.watch<SalesDashboardBloc>().state;
    if (state.data == null && !state.isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tidak ada data', textAlign: TextAlign.center),
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
    }

    if (state.data == null) return const SizedBox();

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
          _buildTopMerchants(context, data),
          const SizedBox(height: 24),
          _buildBottomMerchants(context, data),
          const SizedBox(height: 24),
          _buildTopSales(context, data),
          const SizedBox(height: 24),
          _buildTopDistricts(context, data),
        ],
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
                Icons.point_of_sale_rounded,
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
    final colorScheme = GlobalHelper.getColorSchema(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
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
          Icon(icon, color: colorScheme.primary, size: 28),
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
    SalesDashboardEntity data,
  ) {
    if (data.topMerchants.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Merchants',
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.TITLE_MEDIUM,
              )?.copyWith(fontWeight: FontWeight.bold),
            ),
            _buildMetricFilter(
              context,
              currentValue: data.filters.merchantMetric,
              onChanged: (value) => _onFilterChanged(context, merchantMetric: value),
              options: {
                'transactions': 'Transaksi',
                'revenue': 'Omzet',
              },
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildListContainer(
          context,
          items: data.topMerchants,
          itemBuilder: (merchant) => _buildMerchantTile(context, merchant),
        ),
      ],
    );
  }

  Widget _buildBottomMerchants(
    BuildContext context,
    SalesDashboardEntity data,
  ) {
    if (data.bottomMerchants.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Bottom Merchants',
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.TITLE_MEDIUM,
              )?.copyWith(fontWeight: FontWeight.bold),
            ),
            _buildMetricFilter(
              context,
              currentValue: data.filters.merchantMetric,
              onChanged: (value) => _onFilterChanged(context, merchantMetric: value),
              options: {
                'transactions': 'Transaksi',
                'revenue': 'Omzet',
              },
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildListContainer(
          context,
          items: data.bottomMerchants,
          itemBuilder: (merchant) => _buildMerchantTile(context, merchant),
        ),
      ],
    );
  }

  Widget _buildTopSales(
    BuildContext context,
    SalesDashboardEntity data,
  ) {
    if (data.topSales.isEmpty) return const SizedBox.shrink();
    final currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    final colorScheme = GlobalHelper.getColorSchema(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Sales',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.TITLE_MEDIUM,
          )?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildMetricFilter(
                context,
                currentValue: data.filters.salesScope,
                onChanged: (value) => _onFilterChanged(context, salesScope: value),
                options: {
                  'national': 'Nasional',
                  'district': 'Kecamatan',
                },
              ),
              const SizedBox(width: 8),
              _buildMetricFilter(
                context,
                currentValue: data.filters.salesMetric,
                onChanged: (value) => _onFilterChanged(context, salesMetric: value),
                options: {
                  'acquired_merchants': 'Akuisisi',
                  'revenue': 'Omzet',
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _buildListContainer(
          context,
          items: data.topSales,
          itemBuilder: (sale) => ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
              child: Text(
                '#${sale.rank}',
                style: TextStyle(
                  color: colorScheme.primary,
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
              sale.metric == 'revenue'
                  ? currencyFormatter.format(sale.metricValue)
                  : '${sale.metricValue}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopDistricts(
    BuildContext context,
    SalesDashboardEntity data,
  ) {
    if (data.topDistricts.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Kecamatan',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.TITLE_MEDIUM,
          )?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: _buildMetricFilter(
            context,
            currentValue: data.filters.districtMetric,
            onChanged: (value) => _onFilterChanged(context, districtMetric: value),
            options: {
              'acquired_merchants': 'Akuisisi',
              'revenue': 'Omzet',
            },
          ),
        ),
        const SizedBox(height: 12),
        _buildListContainer(
          context,
          items: data.topDistricts,
          itemBuilder: (district) => _buildDistrictTile(context, district),
        ),
      ],
    );
  }

  Widget _buildDistrictTile(
    BuildContext context,
    SalesDashboardTopDistrictEntity district,
  ) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    final colorScheme = GlobalHelper.getColorSchema(context);
    final isRevenue = district.metric == 'revenue';
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
        child: Text(
          '#${district.rank}',
          style: TextStyle(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        district.districtName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('${district.regencyName} - ${district.provinceName}'),
      trailing: Text(
        isRevenue
            ? currencyFormatter.format(district.metricValue)
            : '${district.metricValue}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  Widget _buildMetricFilter(
    BuildContext context, {
    required String currentValue,
    required Function(String) onChanged,
    required Map<String, String> options,
  }) {
    final colorScheme = GlobalHelper.getColorSchema(context);
    return SegmentedButton<String>(
      showSelectedIcon: false,
      style: SegmentedButton.styleFrom(
        visualDensity: VisualDensity.compact,
        selectedBackgroundColor: colorScheme.primary,
        selectedForegroundColor: colorScheme.onPrimary,
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      segments: options.entries.map((entry) {
        return ButtonSegment(
          value: entry.key,
          label: Text(entry.value),
        );
      }).toList(),
      selected: {currentValue},
      onSelectionChanged: (newSelection) {
        onChanged(newSelection.first);
      },
    );
  }

  Widget _buildListContainer<T>(
    BuildContext context, {
    required List<T> items,
    required Widget Function(T) itemBuilder,
  }) {
    final colorScheme = GlobalHelper.getColorSchema(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
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
    );
  }

  void _onFilterChanged(
    BuildContext context, {
    String? salesScope,
    int? districtId,
    String? salesMetric,
    String? districtMetric,
    String? merchantMetric,
  }) {
    final state = context.read<SalesDashboardBloc>().state;
    final currentFilters = state.data?.filters;

    context.read<SalesDashboardBloc>().add(
          SalesDashboardFetchEvent(
            salesScope: salesScope ?? currentFilters?.salesScope,
            districtId: districtId ?? currentFilters?.districtId,
            salesMetric: salesMetric ?? currentFilters?.salesMetric,
            districtMetric: districtMetric ?? currentFilters?.districtMetric,
            merchantMetric: merchantMetric ?? currentFilters?.merchantMetric,
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
    final colorScheme = GlobalHelper.getColorSchema(context);
    final isRevenue = merchant.metric == 'revenue';
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
        child: Text(
          '#${merchant.rank}',
          style: TextStyle(
            color: colorScheme.primary,
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
        isRevenue
            ? currencyFormatter.format(merchant.revenue)
            : '${merchant.metricValue}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
