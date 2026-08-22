import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_dashboard.freezed.dart';
part 'sales_dashboard.g.dart';

@freezed
abstract class SalesDashboardEntity with _$SalesDashboardEntity {
  const factory SalesDashboardEntity({
    required SalesDashboardFiltersEntity filters,
    @JsonKey(name: 'selected_district') required SalesDashboardDistrictEntity selectedDistrict,
    @JsonKey(name: 'top_sales') required List<SalesDashboardTopSalesEntity> topSales,
    @JsonKey(name: 'top_districts') required List<SalesDashboardTopDistrictEntity> topDistricts,
    @JsonKey(name: 'district_summary') required SalesDashboardSummaryEntity districtSummary,
    @JsonKey(name: 'top_merchants') required List<SalesDashboardMerchantEntity> topMerchants,
    @JsonKey(name: 'bottom_merchants') required List<SalesDashboardMerchantEntity> bottomMerchants,
  }) = _SalesDashboardEntity;

  factory SalesDashboardEntity.fromJson(Map<String, dynamic> json) =>
      _$SalesDashboardEntityFromJson(json);
}

@freezed
abstract class SalesDashboardFiltersEntity with _$SalesDashboardFiltersEntity {
  const factory SalesDashboardFiltersEntity({
    @JsonKey(name: 'sales_scope') required String salesScope,
    @JsonKey(name: 'district_id') required int districtId,
    @JsonKey(name: 'sales_metric') required String salesMetric,
    @JsonKey(name: 'district_metric') required String districtMetric,
    @JsonKey(name: 'merchant_metric') required String merchantMetric,
  }) = _SalesDashboardFiltersEntity;

  factory SalesDashboardFiltersEntity.fromJson(Map<String, dynamic> json) =>
      _$SalesDashboardFiltersEntityFromJson(json);
}

@freezed
abstract class SalesDashboardDistrictEntity with _$SalesDashboardDistrictEntity {
  const factory SalesDashboardDistrictEntity({
    required int id,
    required String name,
    @JsonKey(name: 'regency_name') required String regencyName,
    @JsonKey(name: 'province_name') required String provinceName,
  }) = _SalesDashboardDistrictEntity;

  factory SalesDashboardDistrictEntity.fromJson(Map<String, dynamic> json) =>
      _$SalesDashboardDistrictEntityFromJson(json);
}

@freezed
abstract class SalesDashboardTopSalesEntity with _$SalesDashboardTopSalesEntity {
  const factory SalesDashboardTopSalesEntity({
    required int rank,
    @JsonKey(name: 'sales_id') required int salesId,
    required String name,
    @JsonKey(name: 'district_id') required int districtId,
    @JsonKey(name: 'district_name') required String districtName,
    @JsonKey(name: 'regency_name') required String regencyName,
    @JsonKey(name: 'province_name') required String provinceName,
    @JsonKey(name: 'acquired_merchants_count') required int acquiredMerchantsCount,
    @JsonKey(name: 'transactions_count') required int transactionsCount,
    required num revenue,
    required String metric,
    @JsonKey(name: 'metric_value') required num metricValue,
  }) = _SalesDashboardTopSalesEntity;

  factory SalesDashboardTopSalesEntity.fromJson(Map<String, dynamic> json) =>
      _$SalesDashboardTopSalesEntityFromJson(json);
}

@freezed
abstract class SalesDashboardTopDistrictEntity with _$SalesDashboardTopDistrictEntity {
  const factory SalesDashboardTopDistrictEntity({
    required int rank,
    @JsonKey(name: 'district_id') required int districtId,
    @JsonKey(name: 'district_name') required String districtName,
    @JsonKey(name: 'regency_name') required String regencyName,
    @JsonKey(name: 'province_name') required String provinceName,
    @JsonKey(name: 'registered_merchants_count') required int registeredMerchantsCount,
    @JsonKey(name: 'acquired_merchants_count') required int acquiredMerchantsCount,
    @JsonKey(name: 'transactions_count') required int transactionsCount,
    required num revenue,
    required String metric,
    @JsonKey(name: 'metric_value') required num metricValue,
  }) = _SalesDashboardTopDistrictEntity;

  factory SalesDashboardTopDistrictEntity.fromJson(Map<String, dynamic> json) =>
      _$SalesDashboardTopDistrictEntityFromJson(json);
}

@freezed
abstract class SalesDashboardSummaryEntity with _$SalesDashboardSummaryEntity {
  const factory SalesDashboardSummaryEntity({
    @JsonKey(name: 'registered_merchants_count') required int registeredMerchantsCount,
    @JsonKey(name: 'acquired_merchants_count') required int acquiredMerchantsCount,
    @JsonKey(name: 'total_transactions') required int totalTransactions,
    @JsonKey(name: 'total_revenue') required num totalRevenue,
    @JsonKey(name: 'average_transaction_value') required num averageTransactionValue,
  }) = _SalesDashboardSummaryEntity;

  factory SalesDashboardSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$SalesDashboardSummaryEntityFromJson(json);
}

@freezed
abstract class SalesDashboardMerchantEntity with _$SalesDashboardMerchantEntity {
  const factory SalesDashboardMerchantEntity({
    required int rank,
    @JsonKey(name: 'merchant_id') required String merchantId,
    required String name,
    @JsonKey(name: 'sales_id') int? salesId,
    @JsonKey(name: 'sales_name') String? salesName,
    @JsonKey(name: 'is_acquired') required bool isAcquired,
    @JsonKey(name: 'transactions_count') required int transactionsCount,
    required num revenue,
    required String metric,
    @JsonKey(name: 'metric_value') required num metricValue,
  }) = _SalesDashboardMerchantEntity;

  factory SalesDashboardMerchantEntity.fromJson(Map<String, dynamic> json) =>
      _$SalesDashboardMerchantEntityFromJson(json);
}
