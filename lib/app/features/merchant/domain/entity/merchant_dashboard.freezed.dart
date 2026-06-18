// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantDashboard _$MerchantDashboardFromJson(
  Map<String, dynamic> json
) {
    return MerchantDashboardEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantDashboard {

 MerchantDashboardMetricsEntity get metrics; List<MerchantDashboardSalesSeriesEntity> get salesSeries; List<MerchantDashboardStatusCountEntity> get statusCounts; List<MerchantDashboardBestProductEntity> get bestProducts; List<MerchantDashboardRecentOrderEntity> get recentOrders; MerchantDashboardMerchantInfoEntity get merchantInfo;
/// Create a copy of MerchantDashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardCopyWith<MerchantDashboard> get copyWith => _$MerchantDashboardCopyWithImpl<MerchantDashboard>(this as MerchantDashboard, _$identity);

  /// Serializes this MerchantDashboard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboard&&const DeepCollectionEquality().equals(other.metrics, metrics)&&const DeepCollectionEquality().equals(other.salesSeries, salesSeries)&&const DeepCollectionEquality().equals(other.statusCounts, statusCounts)&&const DeepCollectionEquality().equals(other.bestProducts, bestProducts)&&const DeepCollectionEquality().equals(other.recentOrders, recentOrders)&&const DeepCollectionEquality().equals(other.merchantInfo, merchantInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(metrics),const DeepCollectionEquality().hash(salesSeries),const DeepCollectionEquality().hash(statusCounts),const DeepCollectionEquality().hash(bestProducts),const DeepCollectionEquality().hash(recentOrders),const DeepCollectionEquality().hash(merchantInfo));

@override
String toString() {
  return 'MerchantDashboard(metrics: $metrics, salesSeries: $salesSeries, statusCounts: $statusCounts, bestProducts: $bestProducts, recentOrders: $recentOrders, merchantInfo: $merchantInfo)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardCopyWith<$Res>  {
  factory $MerchantDashboardCopyWith(MerchantDashboard value, $Res Function(MerchantDashboard) _then) = _$MerchantDashboardCopyWithImpl;
@useResult
$Res call({
 MerchantDashboardMetricsEntity metrics, List<MerchantDashboardSalesSeriesEntity> salesSeries, List<MerchantDashboardStatusCountEntity> statusCounts, List<MerchantDashboardBestProductEntity> bestProducts, List<MerchantDashboardRecentOrderEntity> recentOrders, MerchantDashboardMerchantInfoEntity merchantInfo
});




}
/// @nodoc
class _$MerchantDashboardCopyWithImpl<$Res>
    implements $MerchantDashboardCopyWith<$Res> {
  _$MerchantDashboardCopyWithImpl(this._self, this._then);

  final MerchantDashboard _self;
  final $Res Function(MerchantDashboard) _then;

/// Create a copy of MerchantDashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metrics = freezed,Object? salesSeries = null,Object? statusCounts = null,Object? bestProducts = null,Object? recentOrders = null,Object? merchantInfo = freezed,}) {
  return _then(_self.copyWith(
metrics: freezed == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as MerchantDashboardMetricsEntity,salesSeries: null == salesSeries ? _self.salesSeries : salesSeries // ignore: cast_nullable_to_non_nullable
as List<MerchantDashboardSalesSeriesEntity>,statusCounts: null == statusCounts ? _self.statusCounts : statusCounts // ignore: cast_nullable_to_non_nullable
as List<MerchantDashboardStatusCountEntity>,bestProducts: null == bestProducts ? _self.bestProducts : bestProducts // ignore: cast_nullable_to_non_nullable
as List<MerchantDashboardBestProductEntity>,recentOrders: null == recentOrders ? _self.recentOrders : recentOrders // ignore: cast_nullable_to_non_nullable
as List<MerchantDashboardRecentOrderEntity>,merchantInfo: freezed == merchantInfo ? _self.merchantInfo : merchantInfo // ignore: cast_nullable_to_non_nullable
as MerchantDashboardMerchantInfoEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantDashboard].
extension MerchantDashboardPatterns on MerchantDashboard {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantDashboardEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantDashboardEntity() when entity != null:
return entity(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantDashboardEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardEntity():
return entity(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantDashboardEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardEntity() when entity != null:
return entity(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( MerchantDashboardMetricsEntity metrics,  List<MerchantDashboardSalesSeriesEntity> salesSeries,  List<MerchantDashboardStatusCountEntity> statusCounts,  List<MerchantDashboardBestProductEntity> bestProducts,  List<MerchantDashboardRecentOrderEntity> recentOrders,  MerchantDashboardMerchantInfoEntity merchantInfo)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantDashboardEntity() when entity != null:
return entity(_that.metrics,_that.salesSeries,_that.statusCounts,_that.bestProducts,_that.recentOrders,_that.merchantInfo);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( MerchantDashboardMetricsEntity metrics,  List<MerchantDashboardSalesSeriesEntity> salesSeries,  List<MerchantDashboardStatusCountEntity> statusCounts,  List<MerchantDashboardBestProductEntity> bestProducts,  List<MerchantDashboardRecentOrderEntity> recentOrders,  MerchantDashboardMerchantInfoEntity merchantInfo)  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardEntity():
return entity(_that.metrics,_that.salesSeries,_that.statusCounts,_that.bestProducts,_that.recentOrders,_that.merchantInfo);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( MerchantDashboardMetricsEntity metrics,  List<MerchantDashboardSalesSeriesEntity> salesSeries,  List<MerchantDashboardStatusCountEntity> statusCounts,  List<MerchantDashboardBestProductEntity> bestProducts,  List<MerchantDashboardRecentOrderEntity> recentOrders,  MerchantDashboardMerchantInfoEntity merchantInfo)?  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardEntity() when entity != null:
return entity(_that.metrics,_that.salesSeries,_that.statusCounts,_that.bestProducts,_that.recentOrders,_that.merchantInfo);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantDashboardEntity implements MerchantDashboard {
  const MerchantDashboardEntity({required this.metrics, required final  List<MerchantDashboardSalesSeriesEntity> salesSeries, required final  List<MerchantDashboardStatusCountEntity> statusCounts, required final  List<MerchantDashboardBestProductEntity> bestProducts, required final  List<MerchantDashboardRecentOrderEntity> recentOrders, required this.merchantInfo}): _salesSeries = salesSeries,_statusCounts = statusCounts,_bestProducts = bestProducts,_recentOrders = recentOrders;
  factory MerchantDashboardEntity.fromJson(Map<String, dynamic> json) => _$MerchantDashboardEntityFromJson(json);

@override final  MerchantDashboardMetricsEntity metrics;
 final  List<MerchantDashboardSalesSeriesEntity> _salesSeries;
@override List<MerchantDashboardSalesSeriesEntity> get salesSeries {
  if (_salesSeries is EqualUnmodifiableListView) return _salesSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_salesSeries);
}

 final  List<MerchantDashboardStatusCountEntity> _statusCounts;
@override List<MerchantDashboardStatusCountEntity> get statusCounts {
  if (_statusCounts is EqualUnmodifiableListView) return _statusCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_statusCounts);
}

 final  List<MerchantDashboardBestProductEntity> _bestProducts;
@override List<MerchantDashboardBestProductEntity> get bestProducts {
  if (_bestProducts is EqualUnmodifiableListView) return _bestProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bestProducts);
}

 final  List<MerchantDashboardRecentOrderEntity> _recentOrders;
@override List<MerchantDashboardRecentOrderEntity> get recentOrders {
  if (_recentOrders is EqualUnmodifiableListView) return _recentOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentOrders);
}

@override final  MerchantDashboardMerchantInfoEntity merchantInfo;

/// Create a copy of MerchantDashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardEntityCopyWith<MerchantDashboardEntity> get copyWith => _$MerchantDashboardEntityCopyWithImpl<MerchantDashboardEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantDashboardEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardEntity&&const DeepCollectionEquality().equals(other.metrics, metrics)&&const DeepCollectionEquality().equals(other._salesSeries, _salesSeries)&&const DeepCollectionEquality().equals(other._statusCounts, _statusCounts)&&const DeepCollectionEquality().equals(other._bestProducts, _bestProducts)&&const DeepCollectionEquality().equals(other._recentOrders, _recentOrders)&&const DeepCollectionEquality().equals(other.merchantInfo, merchantInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(metrics),const DeepCollectionEquality().hash(_salesSeries),const DeepCollectionEquality().hash(_statusCounts),const DeepCollectionEquality().hash(_bestProducts),const DeepCollectionEquality().hash(_recentOrders),const DeepCollectionEquality().hash(merchantInfo));

@override
String toString() {
  return 'MerchantDashboard.entity(metrics: $metrics, salesSeries: $salesSeries, statusCounts: $statusCounts, bestProducts: $bestProducts, recentOrders: $recentOrders, merchantInfo: $merchantInfo)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardEntityCopyWith<$Res> implements $MerchantDashboardCopyWith<$Res> {
  factory $MerchantDashboardEntityCopyWith(MerchantDashboardEntity value, $Res Function(MerchantDashboardEntity) _then) = _$MerchantDashboardEntityCopyWithImpl;
@override @useResult
$Res call({
 MerchantDashboardMetricsEntity metrics, List<MerchantDashboardSalesSeriesEntity> salesSeries, List<MerchantDashboardStatusCountEntity> statusCounts, List<MerchantDashboardBestProductEntity> bestProducts, List<MerchantDashboardRecentOrderEntity> recentOrders, MerchantDashboardMerchantInfoEntity merchantInfo
});




}
/// @nodoc
class _$MerchantDashboardEntityCopyWithImpl<$Res>
    implements $MerchantDashboardEntityCopyWith<$Res> {
  _$MerchantDashboardEntityCopyWithImpl(this._self, this._then);

  final MerchantDashboardEntity _self;
  final $Res Function(MerchantDashboardEntity) _then;

/// Create a copy of MerchantDashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metrics = freezed,Object? salesSeries = null,Object? statusCounts = null,Object? bestProducts = null,Object? recentOrders = null,Object? merchantInfo = freezed,}) {
  return _then(MerchantDashboardEntity(
metrics: freezed == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as MerchantDashboardMetricsEntity,salesSeries: null == salesSeries ? _self._salesSeries : salesSeries // ignore: cast_nullable_to_non_nullable
as List<MerchantDashboardSalesSeriesEntity>,statusCounts: null == statusCounts ? _self._statusCounts : statusCounts // ignore: cast_nullable_to_non_nullable
as List<MerchantDashboardStatusCountEntity>,bestProducts: null == bestProducts ? _self._bestProducts : bestProducts // ignore: cast_nullable_to_non_nullable
as List<MerchantDashboardBestProductEntity>,recentOrders: null == recentOrders ? _self._recentOrders : recentOrders // ignore: cast_nullable_to_non_nullable
as List<MerchantDashboardRecentOrderEntity>,merchantInfo: freezed == merchantInfo ? _self.merchantInfo : merchantInfo // ignore: cast_nullable_to_non_nullable
as MerchantDashboardMerchantInfoEntity,
  ));
}


}

MerchantDashboardMetrics _$MerchantDashboardMetricsFromJson(
  Map<String, dynamic> json
) {
    return MerchantDashboardMetricsEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantDashboardMetrics {

 int get todayOrders; int get yesterdayOrders; int get todayRevenue; int get yesterdayRevenue; int get processingOrders; int get activeProducts; int get inStockProducts;
/// Create a copy of MerchantDashboardMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardMetricsCopyWith<MerchantDashboardMetrics> get copyWith => _$MerchantDashboardMetricsCopyWithImpl<MerchantDashboardMetrics>(this as MerchantDashboardMetrics, _$identity);

  /// Serializes this MerchantDashboardMetrics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardMetrics&&(identical(other.todayOrders, todayOrders) || other.todayOrders == todayOrders)&&(identical(other.yesterdayOrders, yesterdayOrders) || other.yesterdayOrders == yesterdayOrders)&&(identical(other.todayRevenue, todayRevenue) || other.todayRevenue == todayRevenue)&&(identical(other.yesterdayRevenue, yesterdayRevenue) || other.yesterdayRevenue == yesterdayRevenue)&&(identical(other.processingOrders, processingOrders) || other.processingOrders == processingOrders)&&(identical(other.activeProducts, activeProducts) || other.activeProducts == activeProducts)&&(identical(other.inStockProducts, inStockProducts) || other.inStockProducts == inStockProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,todayOrders,yesterdayOrders,todayRevenue,yesterdayRevenue,processingOrders,activeProducts,inStockProducts);

@override
String toString() {
  return 'MerchantDashboardMetrics(todayOrders: $todayOrders, yesterdayOrders: $yesterdayOrders, todayRevenue: $todayRevenue, yesterdayRevenue: $yesterdayRevenue, processingOrders: $processingOrders, activeProducts: $activeProducts, inStockProducts: $inStockProducts)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardMetricsCopyWith<$Res>  {
  factory $MerchantDashboardMetricsCopyWith(MerchantDashboardMetrics value, $Res Function(MerchantDashboardMetrics) _then) = _$MerchantDashboardMetricsCopyWithImpl;
@useResult
$Res call({
 int todayOrders, int yesterdayOrders, int todayRevenue, int yesterdayRevenue, int processingOrders, int activeProducts, int inStockProducts
});




}
/// @nodoc
class _$MerchantDashboardMetricsCopyWithImpl<$Res>
    implements $MerchantDashboardMetricsCopyWith<$Res> {
  _$MerchantDashboardMetricsCopyWithImpl(this._self, this._then);

  final MerchantDashboardMetrics _self;
  final $Res Function(MerchantDashboardMetrics) _then;

/// Create a copy of MerchantDashboardMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todayOrders = null,Object? yesterdayOrders = null,Object? todayRevenue = null,Object? yesterdayRevenue = null,Object? processingOrders = null,Object? activeProducts = null,Object? inStockProducts = null,}) {
  return _then(_self.copyWith(
todayOrders: null == todayOrders ? _self.todayOrders : todayOrders // ignore: cast_nullable_to_non_nullable
as int,yesterdayOrders: null == yesterdayOrders ? _self.yesterdayOrders : yesterdayOrders // ignore: cast_nullable_to_non_nullable
as int,todayRevenue: null == todayRevenue ? _self.todayRevenue : todayRevenue // ignore: cast_nullable_to_non_nullable
as int,yesterdayRevenue: null == yesterdayRevenue ? _self.yesterdayRevenue : yesterdayRevenue // ignore: cast_nullable_to_non_nullable
as int,processingOrders: null == processingOrders ? _self.processingOrders : processingOrders // ignore: cast_nullable_to_non_nullable
as int,activeProducts: null == activeProducts ? _self.activeProducts : activeProducts // ignore: cast_nullable_to_non_nullable
as int,inStockProducts: null == inStockProducts ? _self.inStockProducts : inStockProducts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantDashboardMetrics].
extension MerchantDashboardMetricsPatterns on MerchantDashboardMetrics {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantDashboardMetricsEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantDashboardMetricsEntity() when entity != null:
return entity(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantDashboardMetricsEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardMetricsEntity():
return entity(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantDashboardMetricsEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardMetricsEntity() when entity != null:
return entity(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int todayOrders,  int yesterdayOrders,  int todayRevenue,  int yesterdayRevenue,  int processingOrders,  int activeProducts,  int inStockProducts)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantDashboardMetricsEntity() when entity != null:
return entity(_that.todayOrders,_that.yesterdayOrders,_that.todayRevenue,_that.yesterdayRevenue,_that.processingOrders,_that.activeProducts,_that.inStockProducts);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int todayOrders,  int yesterdayOrders,  int todayRevenue,  int yesterdayRevenue,  int processingOrders,  int activeProducts,  int inStockProducts)  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardMetricsEntity():
return entity(_that.todayOrders,_that.yesterdayOrders,_that.todayRevenue,_that.yesterdayRevenue,_that.processingOrders,_that.activeProducts,_that.inStockProducts);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int todayOrders,  int yesterdayOrders,  int todayRevenue,  int yesterdayRevenue,  int processingOrders,  int activeProducts,  int inStockProducts)?  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardMetricsEntity() when entity != null:
return entity(_that.todayOrders,_that.yesterdayOrders,_that.todayRevenue,_that.yesterdayRevenue,_that.processingOrders,_that.activeProducts,_that.inStockProducts);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantDashboardMetricsEntity implements MerchantDashboardMetrics {
  const MerchantDashboardMetricsEntity({required this.todayOrders, required this.yesterdayOrders, required this.todayRevenue, required this.yesterdayRevenue, required this.processingOrders, required this.activeProducts, required this.inStockProducts});
  factory MerchantDashboardMetricsEntity.fromJson(Map<String, dynamic> json) => _$MerchantDashboardMetricsEntityFromJson(json);

@override final  int todayOrders;
@override final  int yesterdayOrders;
@override final  int todayRevenue;
@override final  int yesterdayRevenue;
@override final  int processingOrders;
@override final  int activeProducts;
@override final  int inStockProducts;

/// Create a copy of MerchantDashboardMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardMetricsEntityCopyWith<MerchantDashboardMetricsEntity> get copyWith => _$MerchantDashboardMetricsEntityCopyWithImpl<MerchantDashboardMetricsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantDashboardMetricsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardMetricsEntity&&(identical(other.todayOrders, todayOrders) || other.todayOrders == todayOrders)&&(identical(other.yesterdayOrders, yesterdayOrders) || other.yesterdayOrders == yesterdayOrders)&&(identical(other.todayRevenue, todayRevenue) || other.todayRevenue == todayRevenue)&&(identical(other.yesterdayRevenue, yesterdayRevenue) || other.yesterdayRevenue == yesterdayRevenue)&&(identical(other.processingOrders, processingOrders) || other.processingOrders == processingOrders)&&(identical(other.activeProducts, activeProducts) || other.activeProducts == activeProducts)&&(identical(other.inStockProducts, inStockProducts) || other.inStockProducts == inStockProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,todayOrders,yesterdayOrders,todayRevenue,yesterdayRevenue,processingOrders,activeProducts,inStockProducts);

@override
String toString() {
  return 'MerchantDashboardMetrics.entity(todayOrders: $todayOrders, yesterdayOrders: $yesterdayOrders, todayRevenue: $todayRevenue, yesterdayRevenue: $yesterdayRevenue, processingOrders: $processingOrders, activeProducts: $activeProducts, inStockProducts: $inStockProducts)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardMetricsEntityCopyWith<$Res> implements $MerchantDashboardMetricsCopyWith<$Res> {
  factory $MerchantDashboardMetricsEntityCopyWith(MerchantDashboardMetricsEntity value, $Res Function(MerchantDashboardMetricsEntity) _then) = _$MerchantDashboardMetricsEntityCopyWithImpl;
@override @useResult
$Res call({
 int todayOrders, int yesterdayOrders, int todayRevenue, int yesterdayRevenue, int processingOrders, int activeProducts, int inStockProducts
});




}
/// @nodoc
class _$MerchantDashboardMetricsEntityCopyWithImpl<$Res>
    implements $MerchantDashboardMetricsEntityCopyWith<$Res> {
  _$MerchantDashboardMetricsEntityCopyWithImpl(this._self, this._then);

  final MerchantDashboardMetricsEntity _self;
  final $Res Function(MerchantDashboardMetricsEntity) _then;

/// Create a copy of MerchantDashboardMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todayOrders = null,Object? yesterdayOrders = null,Object? todayRevenue = null,Object? yesterdayRevenue = null,Object? processingOrders = null,Object? activeProducts = null,Object? inStockProducts = null,}) {
  return _then(MerchantDashboardMetricsEntity(
todayOrders: null == todayOrders ? _self.todayOrders : todayOrders // ignore: cast_nullable_to_non_nullable
as int,yesterdayOrders: null == yesterdayOrders ? _self.yesterdayOrders : yesterdayOrders // ignore: cast_nullable_to_non_nullable
as int,todayRevenue: null == todayRevenue ? _self.todayRevenue : todayRevenue // ignore: cast_nullable_to_non_nullable
as int,yesterdayRevenue: null == yesterdayRevenue ? _self.yesterdayRevenue : yesterdayRevenue // ignore: cast_nullable_to_non_nullable
as int,processingOrders: null == processingOrders ? _self.processingOrders : processingOrders // ignore: cast_nullable_to_non_nullable
as int,activeProducts: null == activeProducts ? _self.activeProducts : activeProducts // ignore: cast_nullable_to_non_nullable
as int,inStockProducts: null == inStockProducts ? _self.inStockProducts : inStockProducts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

MerchantDashboardSalesSeries _$MerchantDashboardSalesSeriesFromJson(
  Map<String, dynamic> json
) {
    return MerchantDashboardSalesSeriesEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantDashboardSalesSeries {

 String get date; int get revenue; int get heightPct; bool get showLabel;
/// Create a copy of MerchantDashboardSalesSeries
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardSalesSeriesCopyWith<MerchantDashboardSalesSeries> get copyWith => _$MerchantDashboardSalesSeriesCopyWithImpl<MerchantDashboardSalesSeries>(this as MerchantDashboardSalesSeries, _$identity);

  /// Serializes this MerchantDashboardSalesSeries to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardSalesSeries&&(identical(other.date, date) || other.date == date)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.heightPct, heightPct) || other.heightPct == heightPct)&&(identical(other.showLabel, showLabel) || other.showLabel == showLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,revenue,heightPct,showLabel);

@override
String toString() {
  return 'MerchantDashboardSalesSeries(date: $date, revenue: $revenue, heightPct: $heightPct, showLabel: $showLabel)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardSalesSeriesCopyWith<$Res>  {
  factory $MerchantDashboardSalesSeriesCopyWith(MerchantDashboardSalesSeries value, $Res Function(MerchantDashboardSalesSeries) _then) = _$MerchantDashboardSalesSeriesCopyWithImpl;
@useResult
$Res call({
 String date, int revenue, int heightPct, bool showLabel
});




}
/// @nodoc
class _$MerchantDashboardSalesSeriesCopyWithImpl<$Res>
    implements $MerchantDashboardSalesSeriesCopyWith<$Res> {
  _$MerchantDashboardSalesSeriesCopyWithImpl(this._self, this._then);

  final MerchantDashboardSalesSeries _self;
  final $Res Function(MerchantDashboardSalesSeries) _then;

/// Create a copy of MerchantDashboardSalesSeries
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? revenue = null,Object? heightPct = null,Object? showLabel = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,heightPct: null == heightPct ? _self.heightPct : heightPct // ignore: cast_nullable_to_non_nullable
as int,showLabel: null == showLabel ? _self.showLabel : showLabel // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantDashboardSalesSeries].
extension MerchantDashboardSalesSeriesPatterns on MerchantDashboardSalesSeries {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantDashboardSalesSeriesEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantDashboardSalesSeriesEntity() when entity != null:
return entity(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantDashboardSalesSeriesEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardSalesSeriesEntity():
return entity(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantDashboardSalesSeriesEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardSalesSeriesEntity() when entity != null:
return entity(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String date,  int revenue,  int heightPct,  bool showLabel)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantDashboardSalesSeriesEntity() when entity != null:
return entity(_that.date,_that.revenue,_that.heightPct,_that.showLabel);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String date,  int revenue,  int heightPct,  bool showLabel)  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardSalesSeriesEntity():
return entity(_that.date,_that.revenue,_that.heightPct,_that.showLabel);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String date,  int revenue,  int heightPct,  bool showLabel)?  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardSalesSeriesEntity() when entity != null:
return entity(_that.date,_that.revenue,_that.heightPct,_that.showLabel);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantDashboardSalesSeriesEntity implements MerchantDashboardSalesSeries {
  const MerchantDashboardSalesSeriesEntity({required this.date, required this.revenue, required this.heightPct, required this.showLabel});
  factory MerchantDashboardSalesSeriesEntity.fromJson(Map<String, dynamic> json) => _$MerchantDashboardSalesSeriesEntityFromJson(json);

@override final  String date;
@override final  int revenue;
@override final  int heightPct;
@override final  bool showLabel;

/// Create a copy of MerchantDashboardSalesSeries
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardSalesSeriesEntityCopyWith<MerchantDashboardSalesSeriesEntity> get copyWith => _$MerchantDashboardSalesSeriesEntityCopyWithImpl<MerchantDashboardSalesSeriesEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantDashboardSalesSeriesEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardSalesSeriesEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.heightPct, heightPct) || other.heightPct == heightPct)&&(identical(other.showLabel, showLabel) || other.showLabel == showLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,revenue,heightPct,showLabel);

@override
String toString() {
  return 'MerchantDashboardSalesSeries.entity(date: $date, revenue: $revenue, heightPct: $heightPct, showLabel: $showLabel)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardSalesSeriesEntityCopyWith<$Res> implements $MerchantDashboardSalesSeriesCopyWith<$Res> {
  factory $MerchantDashboardSalesSeriesEntityCopyWith(MerchantDashboardSalesSeriesEntity value, $Res Function(MerchantDashboardSalesSeriesEntity) _then) = _$MerchantDashboardSalesSeriesEntityCopyWithImpl;
@override @useResult
$Res call({
 String date, int revenue, int heightPct, bool showLabel
});




}
/// @nodoc
class _$MerchantDashboardSalesSeriesEntityCopyWithImpl<$Res>
    implements $MerchantDashboardSalesSeriesEntityCopyWith<$Res> {
  _$MerchantDashboardSalesSeriesEntityCopyWithImpl(this._self, this._then);

  final MerchantDashboardSalesSeriesEntity _self;
  final $Res Function(MerchantDashboardSalesSeriesEntity) _then;

/// Create a copy of MerchantDashboardSalesSeries
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? revenue = null,Object? heightPct = null,Object? showLabel = null,}) {
  return _then(MerchantDashboardSalesSeriesEntity(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,heightPct: null == heightPct ? _self.heightPct : heightPct // ignore: cast_nullable_to_non_nullable
as int,showLabel: null == showLabel ? _self.showLabel : showLabel // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

MerchantDashboardStatusCount _$MerchantDashboardStatusCountFromJson(
  Map<String, dynamic> json
) {
    return MerchantDashboardStatusCountEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantDashboardStatusCount {

 String get key; String get label; int get count;
/// Create a copy of MerchantDashboardStatusCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardStatusCountCopyWith<MerchantDashboardStatusCount> get copyWith => _$MerchantDashboardStatusCountCopyWithImpl<MerchantDashboardStatusCount>(this as MerchantDashboardStatusCount, _$identity);

  /// Serializes this MerchantDashboardStatusCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardStatusCount&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,count);

@override
String toString() {
  return 'MerchantDashboardStatusCount(key: $key, label: $label, count: $count)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardStatusCountCopyWith<$Res>  {
  factory $MerchantDashboardStatusCountCopyWith(MerchantDashboardStatusCount value, $Res Function(MerchantDashboardStatusCount) _then) = _$MerchantDashboardStatusCountCopyWithImpl;
@useResult
$Res call({
 String key, String label, int count
});




}
/// @nodoc
class _$MerchantDashboardStatusCountCopyWithImpl<$Res>
    implements $MerchantDashboardStatusCountCopyWith<$Res> {
  _$MerchantDashboardStatusCountCopyWithImpl(this._self, this._then);

  final MerchantDashboardStatusCount _self;
  final $Res Function(MerchantDashboardStatusCount) _then;

/// Create a copy of MerchantDashboardStatusCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? label = null,Object? count = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantDashboardStatusCount].
extension MerchantDashboardStatusCountPatterns on MerchantDashboardStatusCount {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantDashboardStatusCountEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantDashboardStatusCountEntity() when entity != null:
return entity(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantDashboardStatusCountEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardStatusCountEntity():
return entity(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantDashboardStatusCountEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardStatusCountEntity() when entity != null:
return entity(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String key,  String label,  int count)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantDashboardStatusCountEntity() when entity != null:
return entity(_that.key,_that.label,_that.count);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String key,  String label,  int count)  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardStatusCountEntity():
return entity(_that.key,_that.label,_that.count);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String key,  String label,  int count)?  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardStatusCountEntity() when entity != null:
return entity(_that.key,_that.label,_that.count);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantDashboardStatusCountEntity implements MerchantDashboardStatusCount {
  const MerchantDashboardStatusCountEntity({required this.key, required this.label, required this.count});
  factory MerchantDashboardStatusCountEntity.fromJson(Map<String, dynamic> json) => _$MerchantDashboardStatusCountEntityFromJson(json);

@override final  String key;
@override final  String label;
@override final  int count;

/// Create a copy of MerchantDashboardStatusCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardStatusCountEntityCopyWith<MerchantDashboardStatusCountEntity> get copyWith => _$MerchantDashboardStatusCountEntityCopyWithImpl<MerchantDashboardStatusCountEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantDashboardStatusCountEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardStatusCountEntity&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,count);

@override
String toString() {
  return 'MerchantDashboardStatusCount.entity(key: $key, label: $label, count: $count)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardStatusCountEntityCopyWith<$Res> implements $MerchantDashboardStatusCountCopyWith<$Res> {
  factory $MerchantDashboardStatusCountEntityCopyWith(MerchantDashboardStatusCountEntity value, $Res Function(MerchantDashboardStatusCountEntity) _then) = _$MerchantDashboardStatusCountEntityCopyWithImpl;
@override @useResult
$Res call({
 String key, String label, int count
});




}
/// @nodoc
class _$MerchantDashboardStatusCountEntityCopyWithImpl<$Res>
    implements $MerchantDashboardStatusCountEntityCopyWith<$Res> {
  _$MerchantDashboardStatusCountEntityCopyWithImpl(this._self, this._then);

  final MerchantDashboardStatusCountEntity _self;
  final $Res Function(MerchantDashboardStatusCountEntity) _then;

/// Create a copy of MerchantDashboardStatusCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? label = null,Object? count = null,}) {
  return _then(MerchantDashboardStatusCountEntity(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

MerchantDashboardBestProduct _$MerchantDashboardBestProductFromJson(
  Map<String, dynamic> json
) {
    return MerchantDashboardBestProductEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantDashboardBestProduct {

 String get id; String get name; int get price; int get sold; int get revenue; String get image;
/// Create a copy of MerchantDashboardBestProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardBestProductCopyWith<MerchantDashboardBestProduct> get copyWith => _$MerchantDashboardBestProductCopyWithImpl<MerchantDashboardBestProduct>(this as MerchantDashboardBestProduct, _$identity);

  /// Serializes this MerchantDashboardBestProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardBestProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.sold, sold) || other.sold == sold)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,sold,revenue,image);

@override
String toString() {
  return 'MerchantDashboardBestProduct(id: $id, name: $name, price: $price, sold: $sold, revenue: $revenue, image: $image)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardBestProductCopyWith<$Res>  {
  factory $MerchantDashboardBestProductCopyWith(MerchantDashboardBestProduct value, $Res Function(MerchantDashboardBestProduct) _then) = _$MerchantDashboardBestProductCopyWithImpl;
@useResult
$Res call({
 String id, String name, int price, int sold, int revenue, String image
});




}
/// @nodoc
class _$MerchantDashboardBestProductCopyWithImpl<$Res>
    implements $MerchantDashboardBestProductCopyWith<$Res> {
  _$MerchantDashboardBestProductCopyWithImpl(this._self, this._then);

  final MerchantDashboardBestProduct _self;
  final $Res Function(MerchantDashboardBestProduct) _then;

/// Create a copy of MerchantDashboardBestProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? sold = null,Object? revenue = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantDashboardBestProduct].
extension MerchantDashboardBestProductPatterns on MerchantDashboardBestProduct {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantDashboardBestProductEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantDashboardBestProductEntity() when entity != null:
return entity(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantDashboardBestProductEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardBestProductEntity():
return entity(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantDashboardBestProductEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardBestProductEntity() when entity != null:
return entity(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  int price,  int sold,  int revenue,  String image)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantDashboardBestProductEntity() when entity != null:
return entity(_that.id,_that.name,_that.price,_that.sold,_that.revenue,_that.image);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  int price,  int sold,  int revenue,  String image)  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardBestProductEntity():
return entity(_that.id,_that.name,_that.price,_that.sold,_that.revenue,_that.image);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  int price,  int sold,  int revenue,  String image)?  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardBestProductEntity() when entity != null:
return entity(_that.id,_that.name,_that.price,_that.sold,_that.revenue,_that.image);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantDashboardBestProductEntity implements MerchantDashboardBestProduct {
  const MerchantDashboardBestProductEntity({required this.id, required this.name, required this.price, required this.sold, required this.revenue, required this.image});
  factory MerchantDashboardBestProductEntity.fromJson(Map<String, dynamic> json) => _$MerchantDashboardBestProductEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  int price;
@override final  int sold;
@override final  int revenue;
@override final  String image;

/// Create a copy of MerchantDashboardBestProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardBestProductEntityCopyWith<MerchantDashboardBestProductEntity> get copyWith => _$MerchantDashboardBestProductEntityCopyWithImpl<MerchantDashboardBestProductEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantDashboardBestProductEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardBestProductEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.sold, sold) || other.sold == sold)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,sold,revenue,image);

@override
String toString() {
  return 'MerchantDashboardBestProduct.entity(id: $id, name: $name, price: $price, sold: $sold, revenue: $revenue, image: $image)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardBestProductEntityCopyWith<$Res> implements $MerchantDashboardBestProductCopyWith<$Res> {
  factory $MerchantDashboardBestProductEntityCopyWith(MerchantDashboardBestProductEntity value, $Res Function(MerchantDashboardBestProductEntity) _then) = _$MerchantDashboardBestProductEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int price, int sold, int revenue, String image
});




}
/// @nodoc
class _$MerchantDashboardBestProductEntityCopyWithImpl<$Res>
    implements $MerchantDashboardBestProductEntityCopyWith<$Res> {
  _$MerchantDashboardBestProductEntityCopyWithImpl(this._self, this._then);

  final MerchantDashboardBestProductEntity _self;
  final $Res Function(MerchantDashboardBestProductEntity) _then;

/// Create a copy of MerchantDashboardBestProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? sold = null,Object? revenue = null,Object? image = null,}) {
  return _then(MerchantDashboardBestProductEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

MerchantDashboardRecentOrder _$MerchantDashboardRecentOrderFromJson(
  Map<String, dynamic> json
) {
    return MerchantDashboardRecentOrderEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantDashboardRecentOrder {

 String get id; String get invoiceNumber; String get customerName; String get type; String get method; OrderStatus? get status; String get statusLabel; int get total;
/// Create a copy of MerchantDashboardRecentOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardRecentOrderCopyWith<MerchantDashboardRecentOrder> get copyWith => _$MerchantDashboardRecentOrderCopyWithImpl<MerchantDashboardRecentOrder>(this as MerchantDashboardRecentOrder, _$identity);

  /// Serializes this MerchantDashboardRecentOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardRecentOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.type, type) || other.type == type)&&(identical(other.method, method) || other.method == method)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerName,type,method,status,statusLabel,total);

@override
String toString() {
  return 'MerchantDashboardRecentOrder(id: $id, invoiceNumber: $invoiceNumber, customerName: $customerName, type: $type, method: $method, status: $status, statusLabel: $statusLabel, total: $total)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardRecentOrderCopyWith<$Res>  {
  factory $MerchantDashboardRecentOrderCopyWith(MerchantDashboardRecentOrder value, $Res Function(MerchantDashboardRecentOrder) _then) = _$MerchantDashboardRecentOrderCopyWithImpl;
@useResult
$Res call({
 String id, String invoiceNumber, String customerName, String type, String method, OrderStatus? status, String statusLabel, int total
});




}
/// @nodoc
class _$MerchantDashboardRecentOrderCopyWithImpl<$Res>
    implements $MerchantDashboardRecentOrderCopyWith<$Res> {
  _$MerchantDashboardRecentOrderCopyWithImpl(this._self, this._then);

  final MerchantDashboardRecentOrder _self;
  final $Res Function(MerchantDashboardRecentOrder) _then;

/// Create a copy of MerchantDashboardRecentOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerName = null,Object? type = null,Object? method = null,Object? status = freezed,Object? statusLabel = null,Object? total = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus?,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantDashboardRecentOrder].
extension MerchantDashboardRecentOrderPatterns on MerchantDashboardRecentOrder {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantDashboardRecentOrderEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantDashboardRecentOrderEntity() when entity != null:
return entity(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantDashboardRecentOrderEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardRecentOrderEntity():
return entity(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantDashboardRecentOrderEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardRecentOrderEntity() when entity != null:
return entity(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String invoiceNumber,  String customerName,  String type,  String method,  OrderStatus? status,  String statusLabel,  int total)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantDashboardRecentOrderEntity() when entity != null:
return entity(_that.id,_that.invoiceNumber,_that.customerName,_that.type,_that.method,_that.status,_that.statusLabel,_that.total);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String invoiceNumber,  String customerName,  String type,  String method,  OrderStatus? status,  String statusLabel,  int total)  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardRecentOrderEntity():
return entity(_that.id,_that.invoiceNumber,_that.customerName,_that.type,_that.method,_that.status,_that.statusLabel,_that.total);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String invoiceNumber,  String customerName,  String type,  String method,  OrderStatus? status,  String statusLabel,  int total)?  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardRecentOrderEntity() when entity != null:
return entity(_that.id,_that.invoiceNumber,_that.customerName,_that.type,_that.method,_that.status,_that.statusLabel,_that.total);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantDashboardRecentOrderEntity implements MerchantDashboardRecentOrder {
  const MerchantDashboardRecentOrderEntity({required this.id, required this.invoiceNumber, required this.customerName, required this.type, required this.method, required this.status, required this.statusLabel, required this.total});
  factory MerchantDashboardRecentOrderEntity.fromJson(Map<String, dynamic> json) => _$MerchantDashboardRecentOrderEntityFromJson(json);

@override final  String id;
@override final  String invoiceNumber;
@override final  String customerName;
@override final  String type;
@override final  String method;
@override final  OrderStatus? status;
@override final  String statusLabel;
@override final  int total;

/// Create a copy of MerchantDashboardRecentOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardRecentOrderEntityCopyWith<MerchantDashboardRecentOrderEntity> get copyWith => _$MerchantDashboardRecentOrderEntityCopyWithImpl<MerchantDashboardRecentOrderEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantDashboardRecentOrderEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardRecentOrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.type, type) || other.type == type)&&(identical(other.method, method) || other.method == method)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerName,type,method,status,statusLabel,total);

@override
String toString() {
  return 'MerchantDashboardRecentOrder.entity(id: $id, invoiceNumber: $invoiceNumber, customerName: $customerName, type: $type, method: $method, status: $status, statusLabel: $statusLabel, total: $total)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardRecentOrderEntityCopyWith<$Res> implements $MerchantDashboardRecentOrderCopyWith<$Res> {
  factory $MerchantDashboardRecentOrderEntityCopyWith(MerchantDashboardRecentOrderEntity value, $Res Function(MerchantDashboardRecentOrderEntity) _then) = _$MerchantDashboardRecentOrderEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String invoiceNumber, String customerName, String type, String method, OrderStatus? status, String statusLabel, int total
});




}
/// @nodoc
class _$MerchantDashboardRecentOrderEntityCopyWithImpl<$Res>
    implements $MerchantDashboardRecentOrderEntityCopyWith<$Res> {
  _$MerchantDashboardRecentOrderEntityCopyWithImpl(this._self, this._then);

  final MerchantDashboardRecentOrderEntity _self;
  final $Res Function(MerchantDashboardRecentOrderEntity) _then;

/// Create a copy of MerchantDashboardRecentOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerName = null,Object? type = null,Object? method = null,Object? status = freezed,Object? statusLabel = null,Object? total = null,}) {
  return _then(MerchantDashboardRecentOrderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus?,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

MerchantDashboardMerchantInfo _$MerchantDashboardMerchantInfoFromJson(
  Map<String, dynamic> json
) {
    return MerchantDashboardMerchantInfoEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantDashboardMerchantInfo {

 String get id; String get name; String get photo; String get category; String get city; String get status; bool get isOperationallyActive; bool get isOpen; bool get isOpenAllDay;@JsonKey(name: 'is_open_24_hours') bool get isOpen24Hours; String get operationalDays; String get operationalTime; int get balance; int get minimumBalance; bool get hasSufficientBalance; String get joinedAt; int get totalOrders; int get activeProducts; MerchantDashboardPerformanceEntity get performance;
/// Create a copy of MerchantDashboardMerchantInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardMerchantInfoCopyWith<MerchantDashboardMerchantInfo> get copyWith => _$MerchantDashboardMerchantInfoCopyWithImpl<MerchantDashboardMerchantInfo>(this as MerchantDashboardMerchantInfo, _$identity);

  /// Serializes this MerchantDashboardMerchantInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardMerchantInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.category, category) || other.category == category)&&(identical(other.city, city) || other.city == city)&&(identical(other.status, status) || other.status == status)&&(identical(other.isOperationallyActive, isOperationallyActive) || other.isOperationallyActive == isOperationallyActive)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.isOpenAllDay, isOpenAllDay) || other.isOpenAllDay == isOpenAllDay)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.operationalDays, operationalDays) || other.operationalDays == operationalDays)&&(identical(other.operationalTime, operationalTime) || other.operationalTime == operationalTime)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.minimumBalance, minimumBalance) || other.minimumBalance == minimumBalance)&&(identical(other.hasSufficientBalance, hasSufficientBalance) || other.hasSufficientBalance == hasSufficientBalance)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.activeProducts, activeProducts) || other.activeProducts == activeProducts)&&const DeepCollectionEquality().equals(other.performance, performance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,photo,category,city,status,isOperationallyActive,isOpen,isOpenAllDay,isOpen24Hours,operationalDays,operationalTime,balance,minimumBalance,hasSufficientBalance,joinedAt,totalOrders,activeProducts,const DeepCollectionEquality().hash(performance)]);

@override
String toString() {
  return 'MerchantDashboardMerchantInfo(id: $id, name: $name, photo: $photo, category: $category, city: $city, status: $status, isOperationallyActive: $isOperationallyActive, isOpen: $isOpen, isOpenAllDay: $isOpenAllDay, isOpen24Hours: $isOpen24Hours, operationalDays: $operationalDays, operationalTime: $operationalTime, balance: $balance, minimumBalance: $minimumBalance, hasSufficientBalance: $hasSufficientBalance, joinedAt: $joinedAt, totalOrders: $totalOrders, activeProducts: $activeProducts, performance: $performance)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardMerchantInfoCopyWith<$Res>  {
  factory $MerchantDashboardMerchantInfoCopyWith(MerchantDashboardMerchantInfo value, $Res Function(MerchantDashboardMerchantInfo) _then) = _$MerchantDashboardMerchantInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String photo, String category, String city, String status, bool isOperationallyActive, bool isOpen, bool isOpenAllDay,@JsonKey(name: 'is_open_24_hours') bool isOpen24Hours, String operationalDays, String operationalTime, int balance, int minimumBalance, bool hasSufficientBalance, String joinedAt, int totalOrders, int activeProducts, MerchantDashboardPerformanceEntity performance
});




}
/// @nodoc
class _$MerchantDashboardMerchantInfoCopyWithImpl<$Res>
    implements $MerchantDashboardMerchantInfoCopyWith<$Res> {
  _$MerchantDashboardMerchantInfoCopyWithImpl(this._self, this._then);

  final MerchantDashboardMerchantInfo _self;
  final $Res Function(MerchantDashboardMerchantInfo) _then;

/// Create a copy of MerchantDashboardMerchantInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? photo = null,Object? category = null,Object? city = null,Object? status = null,Object? isOperationallyActive = null,Object? isOpen = null,Object? isOpenAllDay = null,Object? isOpen24Hours = null,Object? operationalDays = null,Object? operationalTime = null,Object? balance = null,Object? minimumBalance = null,Object? hasSufficientBalance = null,Object? joinedAt = null,Object? totalOrders = null,Object? activeProducts = null,Object? performance = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isOperationallyActive: null == isOperationallyActive ? _self.isOperationallyActive : isOperationallyActive // ignore: cast_nullable_to_non_nullable
as bool,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,isOpenAllDay: null == isOpenAllDay ? _self.isOpenAllDay : isOpenAllDay // ignore: cast_nullable_to_non_nullable
as bool,isOpen24Hours: null == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool,operationalDays: null == operationalDays ? _self.operationalDays : operationalDays // ignore: cast_nullable_to_non_nullable
as String,operationalTime: null == operationalTime ? _self.operationalTime : operationalTime // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,minimumBalance: null == minimumBalance ? _self.minimumBalance : minimumBalance // ignore: cast_nullable_to_non_nullable
as int,hasSufficientBalance: null == hasSufficientBalance ? _self.hasSufficientBalance : hasSufficientBalance // ignore: cast_nullable_to_non_nullable
as bool,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,activeProducts: null == activeProducts ? _self.activeProducts : activeProducts // ignore: cast_nullable_to_non_nullable
as int,performance: freezed == performance ? _self.performance : performance // ignore: cast_nullable_to_non_nullable
as MerchantDashboardPerformanceEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantDashboardMerchantInfo].
extension MerchantDashboardMerchantInfoPatterns on MerchantDashboardMerchantInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantDashboardMerchantInfoEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantDashboardMerchantInfoEntity() when entity != null:
return entity(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantDashboardMerchantInfoEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardMerchantInfoEntity():
return entity(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantDashboardMerchantInfoEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardMerchantInfoEntity() when entity != null:
return entity(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String photo,  String category,  String city,  String status,  bool isOperationallyActive,  bool isOpen,  bool isOpenAllDay, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String operationalDays,  String operationalTime,  int balance,  int minimumBalance,  bool hasSufficientBalance,  String joinedAt,  int totalOrders,  int activeProducts,  MerchantDashboardPerformanceEntity performance)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantDashboardMerchantInfoEntity() when entity != null:
return entity(_that.id,_that.name,_that.photo,_that.category,_that.city,_that.status,_that.isOperationallyActive,_that.isOpen,_that.isOpenAllDay,_that.isOpen24Hours,_that.operationalDays,_that.operationalTime,_that.balance,_that.minimumBalance,_that.hasSufficientBalance,_that.joinedAt,_that.totalOrders,_that.activeProducts,_that.performance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String photo,  String category,  String city,  String status,  bool isOperationallyActive,  bool isOpen,  bool isOpenAllDay, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String operationalDays,  String operationalTime,  int balance,  int minimumBalance,  bool hasSufficientBalance,  String joinedAt,  int totalOrders,  int activeProducts,  MerchantDashboardPerformanceEntity performance)  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardMerchantInfoEntity():
return entity(_that.id,_that.name,_that.photo,_that.category,_that.city,_that.status,_that.isOperationallyActive,_that.isOpen,_that.isOpenAllDay,_that.isOpen24Hours,_that.operationalDays,_that.operationalTime,_that.balance,_that.minimumBalance,_that.hasSufficientBalance,_that.joinedAt,_that.totalOrders,_that.activeProducts,_that.performance);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String photo,  String category,  String city,  String status,  bool isOperationallyActive,  bool isOpen,  bool isOpenAllDay, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String operationalDays,  String operationalTime,  int balance,  int minimumBalance,  bool hasSufficientBalance,  String joinedAt,  int totalOrders,  int activeProducts,  MerchantDashboardPerformanceEntity performance)?  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardMerchantInfoEntity() when entity != null:
return entity(_that.id,_that.name,_that.photo,_that.category,_that.city,_that.status,_that.isOperationallyActive,_that.isOpen,_that.isOpenAllDay,_that.isOpen24Hours,_that.operationalDays,_that.operationalTime,_that.balance,_that.minimumBalance,_that.hasSufficientBalance,_that.joinedAt,_that.totalOrders,_that.activeProducts,_that.performance);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantDashboardMerchantInfoEntity implements MerchantDashboardMerchantInfo {
  const MerchantDashboardMerchantInfoEntity({required this.id, required this.name, required this.photo, required this.category, required this.city, required this.status, required this.isOperationallyActive, required this.isOpen, required this.isOpenAllDay, @JsonKey(name: 'is_open_24_hours') required this.isOpen24Hours, required this.operationalDays, required this.operationalTime, required this.balance, required this.minimumBalance, required this.hasSufficientBalance, required this.joinedAt, required this.totalOrders, required this.activeProducts, required this.performance});
  factory MerchantDashboardMerchantInfoEntity.fromJson(Map<String, dynamic> json) => _$MerchantDashboardMerchantInfoEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String photo;
@override final  String category;
@override final  String city;
@override final  String status;
@override final  bool isOperationallyActive;
@override final  bool isOpen;
@override final  bool isOpenAllDay;
@override@JsonKey(name: 'is_open_24_hours') final  bool isOpen24Hours;
@override final  String operationalDays;
@override final  String operationalTime;
@override final  int balance;
@override final  int minimumBalance;
@override final  bool hasSufficientBalance;
@override final  String joinedAt;
@override final  int totalOrders;
@override final  int activeProducts;
@override final  MerchantDashboardPerformanceEntity performance;

/// Create a copy of MerchantDashboardMerchantInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardMerchantInfoEntityCopyWith<MerchantDashboardMerchantInfoEntity> get copyWith => _$MerchantDashboardMerchantInfoEntityCopyWithImpl<MerchantDashboardMerchantInfoEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantDashboardMerchantInfoEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardMerchantInfoEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.category, category) || other.category == category)&&(identical(other.city, city) || other.city == city)&&(identical(other.status, status) || other.status == status)&&(identical(other.isOperationallyActive, isOperationallyActive) || other.isOperationallyActive == isOperationallyActive)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.isOpenAllDay, isOpenAllDay) || other.isOpenAllDay == isOpenAllDay)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.operationalDays, operationalDays) || other.operationalDays == operationalDays)&&(identical(other.operationalTime, operationalTime) || other.operationalTime == operationalTime)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.minimumBalance, minimumBalance) || other.minimumBalance == minimumBalance)&&(identical(other.hasSufficientBalance, hasSufficientBalance) || other.hasSufficientBalance == hasSufficientBalance)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.activeProducts, activeProducts) || other.activeProducts == activeProducts)&&const DeepCollectionEquality().equals(other.performance, performance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,photo,category,city,status,isOperationallyActive,isOpen,isOpenAllDay,isOpen24Hours,operationalDays,operationalTime,balance,minimumBalance,hasSufficientBalance,joinedAt,totalOrders,activeProducts,const DeepCollectionEquality().hash(performance)]);

@override
String toString() {
  return 'MerchantDashboardMerchantInfo.entity(id: $id, name: $name, photo: $photo, category: $category, city: $city, status: $status, isOperationallyActive: $isOperationallyActive, isOpen: $isOpen, isOpenAllDay: $isOpenAllDay, isOpen24Hours: $isOpen24Hours, operationalDays: $operationalDays, operationalTime: $operationalTime, balance: $balance, minimumBalance: $minimumBalance, hasSufficientBalance: $hasSufficientBalance, joinedAt: $joinedAt, totalOrders: $totalOrders, activeProducts: $activeProducts, performance: $performance)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardMerchantInfoEntityCopyWith<$Res> implements $MerchantDashboardMerchantInfoCopyWith<$Res> {
  factory $MerchantDashboardMerchantInfoEntityCopyWith(MerchantDashboardMerchantInfoEntity value, $Res Function(MerchantDashboardMerchantInfoEntity) _then) = _$MerchantDashboardMerchantInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String photo, String category, String city, String status, bool isOperationallyActive, bool isOpen, bool isOpenAllDay,@JsonKey(name: 'is_open_24_hours') bool isOpen24Hours, String operationalDays, String operationalTime, int balance, int minimumBalance, bool hasSufficientBalance, String joinedAt, int totalOrders, int activeProducts, MerchantDashboardPerformanceEntity performance
});




}
/// @nodoc
class _$MerchantDashboardMerchantInfoEntityCopyWithImpl<$Res>
    implements $MerchantDashboardMerchantInfoEntityCopyWith<$Res> {
  _$MerchantDashboardMerchantInfoEntityCopyWithImpl(this._self, this._then);

  final MerchantDashboardMerchantInfoEntity _self;
  final $Res Function(MerchantDashboardMerchantInfoEntity) _then;

/// Create a copy of MerchantDashboardMerchantInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? photo = null,Object? category = null,Object? city = null,Object? status = null,Object? isOperationallyActive = null,Object? isOpen = null,Object? isOpenAllDay = null,Object? isOpen24Hours = null,Object? operationalDays = null,Object? operationalTime = null,Object? balance = null,Object? minimumBalance = null,Object? hasSufficientBalance = null,Object? joinedAt = null,Object? totalOrders = null,Object? activeProducts = null,Object? performance = freezed,}) {
  return _then(MerchantDashboardMerchantInfoEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isOperationallyActive: null == isOperationallyActive ? _self.isOperationallyActive : isOperationallyActive // ignore: cast_nullable_to_non_nullable
as bool,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,isOpenAllDay: null == isOpenAllDay ? _self.isOpenAllDay : isOpenAllDay // ignore: cast_nullable_to_non_nullable
as bool,isOpen24Hours: null == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool,operationalDays: null == operationalDays ? _self.operationalDays : operationalDays // ignore: cast_nullable_to_non_nullable
as String,operationalTime: null == operationalTime ? _self.operationalTime : operationalTime // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,minimumBalance: null == minimumBalance ? _self.minimumBalance : minimumBalance // ignore: cast_nullable_to_non_nullable
as int,hasSufficientBalance: null == hasSufficientBalance ? _self.hasSufficientBalance : hasSufficientBalance // ignore: cast_nullable_to_non_nullable
as bool,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,activeProducts: null == activeProducts ? _self.activeProducts : activeProducts // ignore: cast_nullable_to_non_nullable
as int,performance: freezed == performance ? _self.performance : performance // ignore: cast_nullable_to_non_nullable
as MerchantDashboardPerformanceEntity,
  ));
}


}

MerchantDashboardPerformance _$MerchantDashboardPerformanceFromJson(
  Map<String, dynamic> json
) {
    return MerchantDashboardPerformanceEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantDashboardPerformance {

 String get key; String get label; int get rate;
/// Create a copy of MerchantDashboardPerformance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardPerformanceCopyWith<MerchantDashboardPerformance> get copyWith => _$MerchantDashboardPerformanceCopyWithImpl<MerchantDashboardPerformance>(this as MerchantDashboardPerformance, _$identity);

  /// Serializes this MerchantDashboardPerformance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardPerformance&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.rate, rate) || other.rate == rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,rate);

@override
String toString() {
  return 'MerchantDashboardPerformance(key: $key, label: $label, rate: $rate)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardPerformanceCopyWith<$Res>  {
  factory $MerchantDashboardPerformanceCopyWith(MerchantDashboardPerformance value, $Res Function(MerchantDashboardPerformance) _then) = _$MerchantDashboardPerformanceCopyWithImpl;
@useResult
$Res call({
 String key, String label, int rate
});




}
/// @nodoc
class _$MerchantDashboardPerformanceCopyWithImpl<$Res>
    implements $MerchantDashboardPerformanceCopyWith<$Res> {
  _$MerchantDashboardPerformanceCopyWithImpl(this._self, this._then);

  final MerchantDashboardPerformance _self;
  final $Res Function(MerchantDashboardPerformance) _then;

/// Create a copy of MerchantDashboardPerformance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? label = null,Object? rate = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantDashboardPerformance].
extension MerchantDashboardPerformancePatterns on MerchantDashboardPerformance {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantDashboardPerformanceEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantDashboardPerformanceEntity() when entity != null:
return entity(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantDashboardPerformanceEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardPerformanceEntity():
return entity(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantDashboardPerformanceEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantDashboardPerformanceEntity() when entity != null:
return entity(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String key,  String label,  int rate)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantDashboardPerformanceEntity() when entity != null:
return entity(_that.key,_that.label,_that.rate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String key,  String label,  int rate)  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardPerformanceEntity():
return entity(_that.key,_that.label,_that.rate);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String key,  String label,  int rate)?  entity,}) {final _that = this;
switch (_that) {
case MerchantDashboardPerformanceEntity() when entity != null:
return entity(_that.key,_that.label,_that.rate);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantDashboardPerformanceEntity implements MerchantDashboardPerformance {
  const MerchantDashboardPerformanceEntity({required this.key, required this.label, required this.rate});
  factory MerchantDashboardPerformanceEntity.fromJson(Map<String, dynamic> json) => _$MerchantDashboardPerformanceEntityFromJson(json);

@override final  String key;
@override final  String label;
@override final  int rate;

/// Create a copy of MerchantDashboardPerformance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDashboardPerformanceEntityCopyWith<MerchantDashboardPerformanceEntity> get copyWith => _$MerchantDashboardPerformanceEntityCopyWithImpl<MerchantDashboardPerformanceEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantDashboardPerformanceEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDashboardPerformanceEntity&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.rate, rate) || other.rate == rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,rate);

@override
String toString() {
  return 'MerchantDashboardPerformance.entity(key: $key, label: $label, rate: $rate)';
}


}

/// @nodoc
abstract mixin class $MerchantDashboardPerformanceEntityCopyWith<$Res> implements $MerchantDashboardPerformanceCopyWith<$Res> {
  factory $MerchantDashboardPerformanceEntityCopyWith(MerchantDashboardPerformanceEntity value, $Res Function(MerchantDashboardPerformanceEntity) _then) = _$MerchantDashboardPerformanceEntityCopyWithImpl;
@override @useResult
$Res call({
 String key, String label, int rate
});




}
/// @nodoc
class _$MerchantDashboardPerformanceEntityCopyWithImpl<$Res>
    implements $MerchantDashboardPerformanceEntityCopyWith<$Res> {
  _$MerchantDashboardPerformanceEntityCopyWithImpl(this._self, this._then);

  final MerchantDashboardPerformanceEntity _self;
  final $Res Function(MerchantDashboardPerformanceEntity) _then;

/// Create a copy of MerchantDashboardPerformance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? label = null,Object? rate = null,}) {
  return _then(MerchantDashboardPerformanceEntity(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
