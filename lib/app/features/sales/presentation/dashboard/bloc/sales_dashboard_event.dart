part of 'sales_dashboard_bloc.dart';

sealed class SalesDashboardEvent {}

class SalesDashboardFetchEvent extends SalesDashboardEvent {
  final String? salesScope;
  final int? districtId;
  final String? salesMetric;
  final String? districtMetric;
  final String? merchantMetric;

  SalesDashboardFetchEvent({
    this.salesScope,
    this.districtId,
    this.salesMetric,
    this.districtMetric,
    this.merchantMetric,
  });
}
