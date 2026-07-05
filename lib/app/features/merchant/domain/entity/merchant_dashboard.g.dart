// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantDashboardEntity _$MerchantDashboardEntityFromJson(
  Map<String, dynamic> json,
) => MerchantDashboardEntity(
  metrics: MerchantDashboardMetricsEntity.fromJson(
    json['metrics'] as Map<String, dynamic>,
  ),
  salesSeries: (json['sales_series'] as List<dynamic>)
      .map(
        (e) => MerchantDashboardSalesSeriesEntity.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  statusCounts: (json['status_counts'] as List<dynamic>)
      .map(
        (e) => MerchantDashboardStatusCountEntity.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  bestProducts: (json['best_products'] as List<dynamic>)
      .map(
        (e) => MerchantDashboardBestProductEntity.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  recentOrders: (json['recent_orders'] as List<dynamic>)
      .map(
        (e) => MerchantDashboardRecentOrderEntity.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  merchantInfo: MerchantDashboardMerchantInfoEntity.fromJson(
    json['merchant_info'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$MerchantDashboardEntityToJson(
  MerchantDashboardEntity instance,
) => <String, dynamic>{
  'metrics': instance.metrics,
  'sales_series': instance.salesSeries,
  'status_counts': instance.statusCounts,
  'best_products': instance.bestProducts,
  'recent_orders': instance.recentOrders,
  'merchant_info': instance.merchantInfo,
};

MerchantDashboardMetricsEntity _$MerchantDashboardMetricsEntityFromJson(
  Map<String, dynamic> json,
) => MerchantDashboardMetricsEntity(
  todayOrders: (json['today_orders'] as num).toInt(),
  yesterdayOrders: (json['yesterday_orders'] as num).toInt(),
  todayRevenue: (json['today_revenue'] as num).toInt(),
  yesterdayRevenue: (json['yesterday_revenue'] as num).toInt(),
  processingOrders: (json['processing_orders'] as num).toInt(),
  activeProducts: (json['active_products'] as num).toInt(),
  inStockProducts: (json['in_stock_products'] as num).toInt(),
);

Map<String, dynamic> _$MerchantDashboardMetricsEntityToJson(
  MerchantDashboardMetricsEntity instance,
) => <String, dynamic>{
  'today_orders': instance.todayOrders,
  'yesterday_orders': instance.yesterdayOrders,
  'today_revenue': instance.todayRevenue,
  'yesterday_revenue': instance.yesterdayRevenue,
  'processing_orders': instance.processingOrders,
  'active_products': instance.activeProducts,
  'in_stock_products': instance.inStockProducts,
};

MerchantDashboardSalesSeriesEntity _$MerchantDashboardSalesSeriesEntityFromJson(
  Map<String, dynamic> json,
) => MerchantDashboardSalesSeriesEntity(
  date: json['date'] as String,
  revenue: (json['revenue'] as num).toInt(),
  heightPct: (json['height_pct'] as num).toInt(),
  showLabel: json['show_label'] as bool,
);

Map<String, dynamic> _$MerchantDashboardSalesSeriesEntityToJson(
  MerchantDashboardSalesSeriesEntity instance,
) => <String, dynamic>{
  'date': instance.date,
  'revenue': instance.revenue,
  'height_pct': instance.heightPct,
  'show_label': instance.showLabel,
};

MerchantDashboardStatusCountEntity _$MerchantDashboardStatusCountEntityFromJson(
  Map<String, dynamic> json,
) => MerchantDashboardStatusCountEntity(
  key: json['key'] as String,
  label: json['label'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$MerchantDashboardStatusCountEntityToJson(
  MerchantDashboardStatusCountEntity instance,
) => <String, dynamic>{
  'key': instance.key,
  'label': instance.label,
  'count': instance.count,
};

MerchantDashboardBestProductEntity _$MerchantDashboardBestProductEntityFromJson(
  Map<String, dynamic> json,
) => MerchantDashboardBestProductEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  price: (json['price'] as num).toInt(),
  sold: (json['sold'] as num).toInt(),
  revenue: (json['revenue'] as num).toInt(),
  image: json['image'] as String,
);

Map<String, dynamic> _$MerchantDashboardBestProductEntityToJson(
  MerchantDashboardBestProductEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'sold': instance.sold,
  'revenue': instance.revenue,
  'image': instance.image,
};

MerchantDashboardRecentOrderEntity _$MerchantDashboardRecentOrderEntityFromJson(
  Map<String, dynamic> json,
) => MerchantDashboardRecentOrderEntity(
  id: json['id'] as String,
  invoiceNumber: json['invoice_number'] as String,
  customerName: json['customer_name'] as String,
  type: json['type'] as String,
  method: json['method'] as String,
  status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
  statusLabel: json['status_label'] as String,
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$MerchantDashboardRecentOrderEntityToJson(
  MerchantDashboardRecentOrderEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'invoice_number': instance.invoiceNumber,
  'customer_name': instance.customerName,
  'type': instance.type,
  'method': instance.method,
  'status': ?_$OrderStatusEnumMap[instance.status],
  'status_label': instance.statusLabel,
  'total': instance.total,
};

const _$OrderStatusEnumMap = {
  OrderStatus.waitingMerchantConfirmation: 'waiting_merchant_confirmation',
  OrderStatus.waitingPayment: 'waiting_payment',
  OrderStatus.waitingPaymentConfirmation: 'waiting_payment_confirmation',
  OrderStatus.waitingCancel: 'waiting_cancel',
  OrderStatus.processing: 'processing',
  OrderStatus.shipped: 'shipped',
  OrderStatus.received: 'received',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.rejected: 'rejected',
};

MerchantDashboardMerchantInfoEntity
_$MerchantDashboardMerchantInfoEntityFromJson(Map<String, dynamic> json) =>
    MerchantDashboardMerchantInfoEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String?,
      category: json['category'] as String?,
      isOperationallyActive: json['is_operationally_active'] as bool,
      isOpen: json['is_open'] as bool,
      isOpenAllDay: json['is_open_all_day'] as bool,
      isOpen24Hours: json['is_open_24_hours'] as bool,
      operationalDays: json['operational_days'] as String,
      operationalTime: json['operational_time'] as String,
      balance: (json['balance'] as num).toInt(),
      minimumBalance: (json['minimum_balance'] as num).toInt(),
      hasSufficientBalance: json['has_sufficient_balance'] as bool,
      joinedAt: json['joined_at'] as String,
      totalOrders: (json['total_orders'] as num).toInt(),
      activeProducts: (json['active_products'] as num).toInt(),
      performance: MerchantDashboardPerformanceEntity.fromJson(
        json['performance'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$MerchantDashboardMerchantInfoEntityToJson(
  MerchantDashboardMerchantInfoEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'photo': ?instance.photo,
  'category': ?instance.category,
  'is_operationally_active': instance.isOperationallyActive,
  'is_open': instance.isOpen,
  'is_open_all_day': instance.isOpenAllDay,
  'is_open_24_hours': instance.isOpen24Hours,
  'operational_days': instance.operationalDays,
  'operational_time': instance.operationalTime,
  'balance': instance.balance,
  'minimum_balance': instance.minimumBalance,
  'has_sufficient_balance': instance.hasSufficientBalance,
  'joined_at': instance.joinedAt,
  'total_orders': instance.totalOrders,
  'active_products': instance.activeProducts,
  'performance': instance.performance,
};

MerchantDashboardPerformanceEntity _$MerchantDashboardPerformanceEntityFromJson(
  Map<String, dynamic> json,
) => MerchantDashboardPerformanceEntity(
  key: json['key'] as String,
  label: json['label'] as String,
  rate: (json['rate'] as num?)?.toInt(),
);

Map<String, dynamic> _$MerchantDashboardPerformanceEntityToJson(
  MerchantDashboardPerformanceEntity instance,
) => <String, dynamic>{
  'key': instance.key,
  'label': instance.label,
  'rate': ?instance.rate,
};
