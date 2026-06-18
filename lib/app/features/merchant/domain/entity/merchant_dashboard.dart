import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/core/enum/order_status.dart';

part 'merchant_dashboard.freezed.dart';
part 'merchant_dashboard.g.dart';

@freezed
sealed class MerchantDashboard with _$MerchantDashboard {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantDashboard.entity({
    required MerchantDashboardMetricsEntity metrics,
    required List<MerchantDashboardSalesSeriesEntity> salesSeries,
    required List<MerchantDashboardStatusCountEntity> statusCounts,
    required List<MerchantDashboardBestProductEntity> bestProducts,
    required List<MerchantDashboardRecentOrderEntity> recentOrders,
    required MerchantDashboardMerchantInfoEntity merchantInfo,
  }) = MerchantDashboardEntity;

  factory MerchantDashboard.fromJson(Map<String, dynamic> json) =>
      _$MerchantDashboardFromJson(json);
}

@freezed
sealed class MerchantDashboardMetrics with _$MerchantDashboardMetrics {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantDashboardMetrics.entity({
    required int todayOrders,
    required int yesterdayOrders,
    required int todayRevenue,
    required int yesterdayRevenue,
    required int processingOrders,
    required int activeProducts,
    required int inStockProducts,
  }) = MerchantDashboardMetricsEntity;

  factory MerchantDashboardMetrics.fromJson(Map<String, dynamic> json) =>
      _$MerchantDashboardMetricsFromJson(json);
}

@freezed
sealed class MerchantDashboardSalesSeries with _$MerchantDashboardSalesSeries {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantDashboardSalesSeries.entity({
    required String date,
    required int revenue,
    required int heightPct,
    required bool showLabel,
  }) = MerchantDashboardSalesSeriesEntity;

  factory MerchantDashboardSalesSeries.fromJson(Map<String, dynamic> json) =>
      _$MerchantDashboardSalesSeriesFromJson(json);
}

@freezed
sealed class MerchantDashboardStatusCount with _$MerchantDashboardStatusCount {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantDashboardStatusCount.entity({
    required String key,
    required String label,
    required int count,
  }) = MerchantDashboardStatusCountEntity;

  factory MerchantDashboardStatusCount.fromJson(Map<String, dynamic> json) =>
      _$MerchantDashboardStatusCountFromJson(json);
}

@freezed
sealed class MerchantDashboardBestProduct with _$MerchantDashboardBestProduct {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantDashboardBestProduct.entity({
    required String id,
    required String name,
    required int price,
    required int sold,
    required int revenue,
    required String image,
  }) = MerchantDashboardBestProductEntity;

  factory MerchantDashboardBestProduct.fromJson(Map<String, dynamic> json) =>
      _$MerchantDashboardBestProductFromJson(json);
}

@freezed
sealed class MerchantDashboardRecentOrder with _$MerchantDashboardRecentOrder {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantDashboardRecentOrder.entity({
    required String id,
    required String invoiceNumber,
    required String customerName,
    required String type,
    required String method,
    required OrderStatus? status,
    required String statusLabel,
    required int total,
  }) = MerchantDashboardRecentOrderEntity;

  factory MerchantDashboardRecentOrder.fromJson(Map<String, dynamic> json) =>
      _$MerchantDashboardRecentOrderFromJson(json);
}

@freezed
sealed class MerchantDashboardMerchantInfo
    with _$MerchantDashboardMerchantInfo {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantDashboardMerchantInfo.entity({
    required String id,
    required String name,
    required String photo,
    required String category,
    required String city,
    required String status,
    required bool isOperationallyActive,
    required bool isOpen,
    required bool isOpenAllDay,
    @JsonKey(name: 'is_open_24_hours') required bool isOpen24Hours,
    required String operationalDays,
    required String operationalTime,
    required int balance,
    required int minimumBalance,
    required bool hasSufficientBalance,
    required String joinedAt,
    required int totalOrders,
    required int activeProducts,
    required MerchantDashboardPerformanceEntity performance,
  }) = MerchantDashboardMerchantInfoEntity;

  factory MerchantDashboardMerchantInfo.fromJson(Map<String, dynamic> json) =>
      _$MerchantDashboardMerchantInfoFromJson(json);
}

@freezed
sealed class MerchantDashboardPerformance with _$MerchantDashboardPerformance {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantDashboardPerformance.entity({
    required String key,
    required String label,
    required int rate,
  }) = MerchantDashboardPerformanceEntity;

  factory MerchantDashboardPerformance.fromJson(Map<String, dynamic> json) =>
      _$MerchantDashboardPerformanceFromJson(json);
}
