// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesDashboardEntity _$SalesDashboardEntityFromJson(
  Map<String, dynamic> json,
) => _SalesDashboardEntity(
  filters: SalesDashboardFiltersEntity.fromJson(
    json['filters'] as Map<String, dynamic>,
  ),
  selectedDistrict: SalesDashboardDistrictEntity.fromJson(
    json['selected_district'] as Map<String, dynamic>,
  ),
  topSales: (json['top_sales'] as List<dynamic>)
      .map(
        (e) => SalesDashboardTopSalesEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  topDistricts: (json['top_districts'] as List<dynamic>)
      .map(
        (e) =>
            SalesDashboardTopDistrictEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  districtSummary: SalesDashboardSummaryEntity.fromJson(
    json['district_summary'] as Map<String, dynamic>,
  ),
  topMerchants: (json['top_merchants'] as List<dynamic>)
      .map(
        (e) => SalesDashboardMerchantEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  bottomMerchants: (json['bottom_merchants'] as List<dynamic>)
      .map(
        (e) => SalesDashboardMerchantEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SalesDashboardEntityToJson(
  _SalesDashboardEntity instance,
) => <String, dynamic>{
  'filters': instance.filters,
  'selected_district': instance.selectedDistrict,
  'top_sales': instance.topSales,
  'top_districts': instance.topDistricts,
  'district_summary': instance.districtSummary,
  'top_merchants': instance.topMerchants,
  'bottom_merchants': instance.bottomMerchants,
};

_SalesDashboardFiltersEntity _$SalesDashboardFiltersEntityFromJson(
  Map<String, dynamic> json,
) => _SalesDashboardFiltersEntity(
  salesScope: json['sales_scope'] as String,
  districtId: (json['district_id'] as num).toInt(),
  salesMetric: json['sales_metric'] as String,
  districtMetric: json['district_metric'] as String,
  merchantMetric: json['merchant_metric'] as String,
);

Map<String, dynamic> _$SalesDashboardFiltersEntityToJson(
  _SalesDashboardFiltersEntity instance,
) => <String, dynamic>{
  'sales_scope': instance.salesScope,
  'district_id': instance.districtId,
  'sales_metric': instance.salesMetric,
  'district_metric': instance.districtMetric,
  'merchant_metric': instance.merchantMetric,
};

_SalesDashboardDistrictEntity _$SalesDashboardDistrictEntityFromJson(
  Map<String, dynamic> json,
) => _SalesDashboardDistrictEntity(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  regencyName: json['regency_name'] as String,
  provinceName: json['province_name'] as String,
);

Map<String, dynamic> _$SalesDashboardDistrictEntityToJson(
  _SalesDashboardDistrictEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'regency_name': instance.regencyName,
  'province_name': instance.provinceName,
};

_SalesDashboardTopSalesEntity _$SalesDashboardTopSalesEntityFromJson(
  Map<String, dynamic> json,
) => _SalesDashboardTopSalesEntity(
  rank: (json['rank'] as num).toInt(),
  salesId: (json['sales_id'] as num).toInt(),
  name: json['name'] as String,
  districtId: (json['district_id'] as num).toInt(),
  districtName: json['district_name'] as String,
  regencyName: json['regency_name'] as String,
  provinceName: json['province_name'] as String,
  acquiredMerchantsCount: (json['acquired_merchants_count'] as num).toInt(),
  transactionsCount: (json['transactions_count'] as num).toInt(),
  revenue: json['revenue'] as num,
  metric: json['metric'] as String,
  metricValue: json['metric_value'] as num,
);

Map<String, dynamic> _$SalesDashboardTopSalesEntityToJson(
  _SalesDashboardTopSalesEntity instance,
) => <String, dynamic>{
  'rank': instance.rank,
  'sales_id': instance.salesId,
  'name': instance.name,
  'district_id': instance.districtId,
  'district_name': instance.districtName,
  'regency_name': instance.regencyName,
  'province_name': instance.provinceName,
  'acquired_merchants_count': instance.acquiredMerchantsCount,
  'transactions_count': instance.transactionsCount,
  'revenue': instance.revenue,
  'metric': instance.metric,
  'metric_value': instance.metricValue,
};

_SalesDashboardTopDistrictEntity _$SalesDashboardTopDistrictEntityFromJson(
  Map<String, dynamic> json,
) => _SalesDashboardTopDistrictEntity(
  rank: (json['rank'] as num).toInt(),
  districtId: (json['district_id'] as num).toInt(),
  districtName: json['district_name'] as String,
  regencyName: json['regency_name'] as String,
  provinceName: json['province_name'] as String,
  registeredMerchantsCount: (json['registered_merchants_count'] as num).toInt(),
  acquiredMerchantsCount: (json['acquired_merchants_count'] as num).toInt(),
  transactionsCount: (json['transactions_count'] as num).toInt(),
  revenue: json['revenue'] as num,
  metric: json['metric'] as String,
  metricValue: json['metric_value'] as num,
);

Map<String, dynamic> _$SalesDashboardTopDistrictEntityToJson(
  _SalesDashboardTopDistrictEntity instance,
) => <String, dynamic>{
  'rank': instance.rank,
  'district_id': instance.districtId,
  'district_name': instance.districtName,
  'regency_name': instance.regencyName,
  'province_name': instance.provinceName,
  'registered_merchants_count': instance.registeredMerchantsCount,
  'acquired_merchants_count': instance.acquiredMerchantsCount,
  'transactions_count': instance.transactionsCount,
  'revenue': instance.revenue,
  'metric': instance.metric,
  'metric_value': instance.metricValue,
};

_SalesDashboardSummaryEntity _$SalesDashboardSummaryEntityFromJson(
  Map<String, dynamic> json,
) => _SalesDashboardSummaryEntity(
  registeredMerchantsCount: (json['registered_merchants_count'] as num).toInt(),
  acquiredMerchantsCount: (json['acquired_merchants_count'] as num).toInt(),
  totalTransactions: (json['total_transactions'] as num).toInt(),
  totalRevenue: json['total_revenue'] as num,
  averageTransactionValue: json['average_transaction_value'] as num,
);

Map<String, dynamic> _$SalesDashboardSummaryEntityToJson(
  _SalesDashboardSummaryEntity instance,
) => <String, dynamic>{
  'registered_merchants_count': instance.registeredMerchantsCount,
  'acquired_merchants_count': instance.acquiredMerchantsCount,
  'total_transactions': instance.totalTransactions,
  'total_revenue': instance.totalRevenue,
  'average_transaction_value': instance.averageTransactionValue,
};

_SalesDashboardMerchantEntity _$SalesDashboardMerchantEntityFromJson(
  Map<String, dynamic> json,
) => _SalesDashboardMerchantEntity(
  rank: (json['rank'] as num).toInt(),
  merchantId: json['merchant_id'] as String,
  name: json['name'] as String,
  salesId: (json['sales_id'] as num?)?.toInt(),
  salesName: json['sales_name'] as String?,
  isAcquired: json['is_acquired'] as bool,
  transactionsCount: (json['transactions_count'] as num).toInt(),
  revenue: json['revenue'] as num,
  metric: json['metric'] as String,
  metricValue: json['metric_value'] as num,
);

Map<String, dynamic> _$SalesDashboardMerchantEntityToJson(
  _SalesDashboardMerchantEntity instance,
) => <String, dynamic>{
  'rank': instance.rank,
  'merchant_id': instance.merchantId,
  'name': instance.name,
  'sales_id': instance.salesId,
  'sales_name': instance.salesName,
  'is_acquired': instance.isAcquired,
  'transactions_count': instance.transactionsCount,
  'revenue': instance.revenue,
  'metric': instance.metric,
  'metric_value': instance.metricValue,
};
