// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesDashboardEntity {

 SalesDashboardFiltersEntity get filters;@JsonKey(name: 'selected_district') SalesDashboardDistrictEntity get selectedDistrict;@JsonKey(name: 'top_sales') List<SalesDashboardTopSalesEntity> get topSales;@JsonKey(name: 'top_districts') List<SalesDashboardTopDistrictEntity> get topDistricts;@JsonKey(name: 'district_summary') SalesDashboardSummaryEntity get districtSummary;@JsonKey(name: 'top_merchants') List<SalesDashboardMerchantEntity> get topMerchants;@JsonKey(name: 'bottom_merchants') List<SalesDashboardMerchantEntity> get bottomMerchants;
/// Create a copy of SalesDashboardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesDashboardEntityCopyWith<SalesDashboardEntity> get copyWith => _$SalesDashboardEntityCopyWithImpl<SalesDashboardEntity>(this as SalesDashboardEntity, _$identity);

  /// Serializes this SalesDashboardEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesDashboardEntity&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&const DeepCollectionEquality().equals(other.topSales, topSales)&&const DeepCollectionEquality().equals(other.topDistricts, topDistricts)&&(identical(other.districtSummary, districtSummary) || other.districtSummary == districtSummary)&&const DeepCollectionEquality().equals(other.topMerchants, topMerchants)&&const DeepCollectionEquality().equals(other.bottomMerchants, bottomMerchants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filters,selectedDistrict,const DeepCollectionEquality().hash(topSales),const DeepCollectionEquality().hash(topDistricts),districtSummary,const DeepCollectionEquality().hash(topMerchants),const DeepCollectionEquality().hash(bottomMerchants));

@override
String toString() {
  return 'SalesDashboardEntity(filters: $filters, selectedDistrict: $selectedDistrict, topSales: $topSales, topDistricts: $topDistricts, districtSummary: $districtSummary, topMerchants: $topMerchants, bottomMerchants: $bottomMerchants)';
}


}

/// @nodoc
abstract mixin class $SalesDashboardEntityCopyWith<$Res>  {
  factory $SalesDashboardEntityCopyWith(SalesDashboardEntity value, $Res Function(SalesDashboardEntity) _then) = _$SalesDashboardEntityCopyWithImpl;
@useResult
$Res call({
 SalesDashboardFiltersEntity filters,@JsonKey(name: 'selected_district') SalesDashboardDistrictEntity selectedDistrict,@JsonKey(name: 'top_sales') List<SalesDashboardTopSalesEntity> topSales,@JsonKey(name: 'top_districts') List<SalesDashboardTopDistrictEntity> topDistricts,@JsonKey(name: 'district_summary') SalesDashboardSummaryEntity districtSummary,@JsonKey(name: 'top_merchants') List<SalesDashboardMerchantEntity> topMerchants,@JsonKey(name: 'bottom_merchants') List<SalesDashboardMerchantEntity> bottomMerchants
});


$SalesDashboardFiltersEntityCopyWith<$Res> get filters;$SalesDashboardDistrictEntityCopyWith<$Res> get selectedDistrict;$SalesDashboardSummaryEntityCopyWith<$Res> get districtSummary;

}
/// @nodoc
class _$SalesDashboardEntityCopyWithImpl<$Res>
    implements $SalesDashboardEntityCopyWith<$Res> {
  _$SalesDashboardEntityCopyWithImpl(this._self, this._then);

  final SalesDashboardEntity _self;
  final $Res Function(SalesDashboardEntity) _then;

/// Create a copy of SalesDashboardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filters = null,Object? selectedDistrict = null,Object? topSales = null,Object? topDistricts = null,Object? districtSummary = null,Object? topMerchants = null,Object? bottomMerchants = null,}) {
  return _then(_self.copyWith(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as SalesDashboardFiltersEntity,selectedDistrict: null == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as SalesDashboardDistrictEntity,topSales: null == topSales ? _self.topSales : topSales // ignore: cast_nullable_to_non_nullable
as List<SalesDashboardTopSalesEntity>,topDistricts: null == topDistricts ? _self.topDistricts : topDistricts // ignore: cast_nullable_to_non_nullable
as List<SalesDashboardTopDistrictEntity>,districtSummary: null == districtSummary ? _self.districtSummary : districtSummary // ignore: cast_nullable_to_non_nullable
as SalesDashboardSummaryEntity,topMerchants: null == topMerchants ? _self.topMerchants : topMerchants // ignore: cast_nullable_to_non_nullable
as List<SalesDashboardMerchantEntity>,bottomMerchants: null == bottomMerchants ? _self.bottomMerchants : bottomMerchants // ignore: cast_nullable_to_non_nullable
as List<SalesDashboardMerchantEntity>,
  ));
}
/// Create a copy of SalesDashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesDashboardFiltersEntityCopyWith<$Res> get filters {
  
  return $SalesDashboardFiltersEntityCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}/// Create a copy of SalesDashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesDashboardDistrictEntityCopyWith<$Res> get selectedDistrict {
  
  return $SalesDashboardDistrictEntityCopyWith<$Res>(_self.selectedDistrict, (value) {
    return _then(_self.copyWith(selectedDistrict: value));
  });
}/// Create a copy of SalesDashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesDashboardSummaryEntityCopyWith<$Res> get districtSummary {
  
  return $SalesDashboardSummaryEntityCopyWith<$Res>(_self.districtSummary, (value) {
    return _then(_self.copyWith(districtSummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [SalesDashboardEntity].
extension SalesDashboardEntityPatterns on SalesDashboardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesDashboardEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesDashboardEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesDashboardEntity value)  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesDashboardEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SalesDashboardFiltersEntity filters, @JsonKey(name: 'selected_district')  SalesDashboardDistrictEntity selectedDistrict, @JsonKey(name: 'top_sales')  List<SalesDashboardTopSalesEntity> topSales, @JsonKey(name: 'top_districts')  List<SalesDashboardTopDistrictEntity> topDistricts, @JsonKey(name: 'district_summary')  SalesDashboardSummaryEntity districtSummary, @JsonKey(name: 'top_merchants')  List<SalesDashboardMerchantEntity> topMerchants, @JsonKey(name: 'bottom_merchants')  List<SalesDashboardMerchantEntity> bottomMerchants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesDashboardEntity() when $default != null:
return $default(_that.filters,_that.selectedDistrict,_that.topSales,_that.topDistricts,_that.districtSummary,_that.topMerchants,_that.bottomMerchants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SalesDashboardFiltersEntity filters, @JsonKey(name: 'selected_district')  SalesDashboardDistrictEntity selectedDistrict, @JsonKey(name: 'top_sales')  List<SalesDashboardTopSalesEntity> topSales, @JsonKey(name: 'top_districts')  List<SalesDashboardTopDistrictEntity> topDistricts, @JsonKey(name: 'district_summary')  SalesDashboardSummaryEntity districtSummary, @JsonKey(name: 'top_merchants')  List<SalesDashboardMerchantEntity> topMerchants, @JsonKey(name: 'bottom_merchants')  List<SalesDashboardMerchantEntity> bottomMerchants)  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardEntity():
return $default(_that.filters,_that.selectedDistrict,_that.topSales,_that.topDistricts,_that.districtSummary,_that.topMerchants,_that.bottomMerchants);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SalesDashboardFiltersEntity filters, @JsonKey(name: 'selected_district')  SalesDashboardDistrictEntity selectedDistrict, @JsonKey(name: 'top_sales')  List<SalesDashboardTopSalesEntity> topSales, @JsonKey(name: 'top_districts')  List<SalesDashboardTopDistrictEntity> topDistricts, @JsonKey(name: 'district_summary')  SalesDashboardSummaryEntity districtSummary, @JsonKey(name: 'top_merchants')  List<SalesDashboardMerchantEntity> topMerchants, @JsonKey(name: 'bottom_merchants')  List<SalesDashboardMerchantEntity> bottomMerchants)?  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardEntity() when $default != null:
return $default(_that.filters,_that.selectedDistrict,_that.topSales,_that.topDistricts,_that.districtSummary,_that.topMerchants,_that.bottomMerchants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesDashboardEntity implements SalesDashboardEntity {
  const _SalesDashboardEntity({required this.filters, @JsonKey(name: 'selected_district') required this.selectedDistrict, @JsonKey(name: 'top_sales') required final  List<SalesDashboardTopSalesEntity> topSales, @JsonKey(name: 'top_districts') required final  List<SalesDashboardTopDistrictEntity> topDistricts, @JsonKey(name: 'district_summary') required this.districtSummary, @JsonKey(name: 'top_merchants') required final  List<SalesDashboardMerchantEntity> topMerchants, @JsonKey(name: 'bottom_merchants') required final  List<SalesDashboardMerchantEntity> bottomMerchants}): _topSales = topSales,_topDistricts = topDistricts,_topMerchants = topMerchants,_bottomMerchants = bottomMerchants;
  factory _SalesDashboardEntity.fromJson(Map<String, dynamic> json) => _$SalesDashboardEntityFromJson(json);

@override final  SalesDashboardFiltersEntity filters;
@override@JsonKey(name: 'selected_district') final  SalesDashboardDistrictEntity selectedDistrict;
 final  List<SalesDashboardTopSalesEntity> _topSales;
@override@JsonKey(name: 'top_sales') List<SalesDashboardTopSalesEntity> get topSales {
  if (_topSales is EqualUnmodifiableListView) return _topSales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSales);
}

 final  List<SalesDashboardTopDistrictEntity> _topDistricts;
@override@JsonKey(name: 'top_districts') List<SalesDashboardTopDistrictEntity> get topDistricts {
  if (_topDistricts is EqualUnmodifiableListView) return _topDistricts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topDistricts);
}

@override@JsonKey(name: 'district_summary') final  SalesDashboardSummaryEntity districtSummary;
 final  List<SalesDashboardMerchantEntity> _topMerchants;
@override@JsonKey(name: 'top_merchants') List<SalesDashboardMerchantEntity> get topMerchants {
  if (_topMerchants is EqualUnmodifiableListView) return _topMerchants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topMerchants);
}

 final  List<SalesDashboardMerchantEntity> _bottomMerchants;
@override@JsonKey(name: 'bottom_merchants') List<SalesDashboardMerchantEntity> get bottomMerchants {
  if (_bottomMerchants is EqualUnmodifiableListView) return _bottomMerchants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bottomMerchants);
}


/// Create a copy of SalesDashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesDashboardEntityCopyWith<_SalesDashboardEntity> get copyWith => __$SalesDashboardEntityCopyWithImpl<_SalesDashboardEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesDashboardEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesDashboardEntity&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&const DeepCollectionEquality().equals(other._topSales, _topSales)&&const DeepCollectionEquality().equals(other._topDistricts, _topDistricts)&&(identical(other.districtSummary, districtSummary) || other.districtSummary == districtSummary)&&const DeepCollectionEquality().equals(other._topMerchants, _topMerchants)&&const DeepCollectionEquality().equals(other._bottomMerchants, _bottomMerchants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filters,selectedDistrict,const DeepCollectionEquality().hash(_topSales),const DeepCollectionEquality().hash(_topDistricts),districtSummary,const DeepCollectionEquality().hash(_topMerchants),const DeepCollectionEquality().hash(_bottomMerchants));

@override
String toString() {
  return 'SalesDashboardEntity(filters: $filters, selectedDistrict: $selectedDistrict, topSales: $topSales, topDistricts: $topDistricts, districtSummary: $districtSummary, topMerchants: $topMerchants, bottomMerchants: $bottomMerchants)';
}


}

/// @nodoc
abstract mixin class _$SalesDashboardEntityCopyWith<$Res> implements $SalesDashboardEntityCopyWith<$Res> {
  factory _$SalesDashboardEntityCopyWith(_SalesDashboardEntity value, $Res Function(_SalesDashboardEntity) _then) = __$SalesDashboardEntityCopyWithImpl;
@override @useResult
$Res call({
 SalesDashboardFiltersEntity filters,@JsonKey(name: 'selected_district') SalesDashboardDistrictEntity selectedDistrict,@JsonKey(name: 'top_sales') List<SalesDashboardTopSalesEntity> topSales,@JsonKey(name: 'top_districts') List<SalesDashboardTopDistrictEntity> topDistricts,@JsonKey(name: 'district_summary') SalesDashboardSummaryEntity districtSummary,@JsonKey(name: 'top_merchants') List<SalesDashboardMerchantEntity> topMerchants,@JsonKey(name: 'bottom_merchants') List<SalesDashboardMerchantEntity> bottomMerchants
});


@override $SalesDashboardFiltersEntityCopyWith<$Res> get filters;@override $SalesDashboardDistrictEntityCopyWith<$Res> get selectedDistrict;@override $SalesDashboardSummaryEntityCopyWith<$Res> get districtSummary;

}
/// @nodoc
class __$SalesDashboardEntityCopyWithImpl<$Res>
    implements _$SalesDashboardEntityCopyWith<$Res> {
  __$SalesDashboardEntityCopyWithImpl(this._self, this._then);

  final _SalesDashboardEntity _self;
  final $Res Function(_SalesDashboardEntity) _then;

/// Create a copy of SalesDashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filters = null,Object? selectedDistrict = null,Object? topSales = null,Object? topDistricts = null,Object? districtSummary = null,Object? topMerchants = null,Object? bottomMerchants = null,}) {
  return _then(_SalesDashboardEntity(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as SalesDashboardFiltersEntity,selectedDistrict: null == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as SalesDashboardDistrictEntity,topSales: null == topSales ? _self._topSales : topSales // ignore: cast_nullable_to_non_nullable
as List<SalesDashboardTopSalesEntity>,topDistricts: null == topDistricts ? _self._topDistricts : topDistricts // ignore: cast_nullable_to_non_nullable
as List<SalesDashboardTopDistrictEntity>,districtSummary: null == districtSummary ? _self.districtSummary : districtSummary // ignore: cast_nullable_to_non_nullable
as SalesDashboardSummaryEntity,topMerchants: null == topMerchants ? _self._topMerchants : topMerchants // ignore: cast_nullable_to_non_nullable
as List<SalesDashboardMerchantEntity>,bottomMerchants: null == bottomMerchants ? _self._bottomMerchants : bottomMerchants // ignore: cast_nullable_to_non_nullable
as List<SalesDashboardMerchantEntity>,
  ));
}

/// Create a copy of SalesDashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesDashboardFiltersEntityCopyWith<$Res> get filters {
  
  return $SalesDashboardFiltersEntityCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}/// Create a copy of SalesDashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesDashboardDistrictEntityCopyWith<$Res> get selectedDistrict {
  
  return $SalesDashboardDistrictEntityCopyWith<$Res>(_self.selectedDistrict, (value) {
    return _then(_self.copyWith(selectedDistrict: value));
  });
}/// Create a copy of SalesDashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesDashboardSummaryEntityCopyWith<$Res> get districtSummary {
  
  return $SalesDashboardSummaryEntityCopyWith<$Res>(_self.districtSummary, (value) {
    return _then(_self.copyWith(districtSummary: value));
  });
}
}


/// @nodoc
mixin _$SalesDashboardFiltersEntity {

@JsonKey(name: 'sales_scope') String get salesScope;@JsonKey(name: 'district_id') int get districtId;@JsonKey(name: 'sales_metric') String get salesMetric;@JsonKey(name: 'district_metric') String get districtMetric;@JsonKey(name: 'merchant_metric') String get merchantMetric;
/// Create a copy of SalesDashboardFiltersEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesDashboardFiltersEntityCopyWith<SalesDashboardFiltersEntity> get copyWith => _$SalesDashboardFiltersEntityCopyWithImpl<SalesDashboardFiltersEntity>(this as SalesDashboardFiltersEntity, _$identity);

  /// Serializes this SalesDashboardFiltersEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesDashboardFiltersEntity&&(identical(other.salesScope, salesScope) || other.salesScope == salesScope)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.salesMetric, salesMetric) || other.salesMetric == salesMetric)&&(identical(other.districtMetric, districtMetric) || other.districtMetric == districtMetric)&&(identical(other.merchantMetric, merchantMetric) || other.merchantMetric == merchantMetric));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,salesScope,districtId,salesMetric,districtMetric,merchantMetric);

@override
String toString() {
  return 'SalesDashboardFiltersEntity(salesScope: $salesScope, districtId: $districtId, salesMetric: $salesMetric, districtMetric: $districtMetric, merchantMetric: $merchantMetric)';
}


}

/// @nodoc
abstract mixin class $SalesDashboardFiltersEntityCopyWith<$Res>  {
  factory $SalesDashboardFiltersEntityCopyWith(SalesDashboardFiltersEntity value, $Res Function(SalesDashboardFiltersEntity) _then) = _$SalesDashboardFiltersEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sales_scope') String salesScope,@JsonKey(name: 'district_id') int districtId,@JsonKey(name: 'sales_metric') String salesMetric,@JsonKey(name: 'district_metric') String districtMetric,@JsonKey(name: 'merchant_metric') String merchantMetric
});




}
/// @nodoc
class _$SalesDashboardFiltersEntityCopyWithImpl<$Res>
    implements $SalesDashboardFiltersEntityCopyWith<$Res> {
  _$SalesDashboardFiltersEntityCopyWithImpl(this._self, this._then);

  final SalesDashboardFiltersEntity _self;
  final $Res Function(SalesDashboardFiltersEntity) _then;

/// Create a copy of SalesDashboardFiltersEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? salesScope = null,Object? districtId = null,Object? salesMetric = null,Object? districtMetric = null,Object? merchantMetric = null,}) {
  return _then(_self.copyWith(
salesScope: null == salesScope ? _self.salesScope : salesScope // ignore: cast_nullable_to_non_nullable
as String,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,salesMetric: null == salesMetric ? _self.salesMetric : salesMetric // ignore: cast_nullable_to_non_nullable
as String,districtMetric: null == districtMetric ? _self.districtMetric : districtMetric // ignore: cast_nullable_to_non_nullable
as String,merchantMetric: null == merchantMetric ? _self.merchantMetric : merchantMetric // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesDashboardFiltersEntity].
extension SalesDashboardFiltersEntityPatterns on SalesDashboardFiltersEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesDashboardFiltersEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesDashboardFiltersEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesDashboardFiltersEntity value)  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardFiltersEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesDashboardFiltersEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardFiltersEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sales_scope')  String salesScope, @JsonKey(name: 'district_id')  int districtId, @JsonKey(name: 'sales_metric')  String salesMetric, @JsonKey(name: 'district_metric')  String districtMetric, @JsonKey(name: 'merchant_metric')  String merchantMetric)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesDashboardFiltersEntity() when $default != null:
return $default(_that.salesScope,_that.districtId,_that.salesMetric,_that.districtMetric,_that.merchantMetric);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sales_scope')  String salesScope, @JsonKey(name: 'district_id')  int districtId, @JsonKey(name: 'sales_metric')  String salesMetric, @JsonKey(name: 'district_metric')  String districtMetric, @JsonKey(name: 'merchant_metric')  String merchantMetric)  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardFiltersEntity():
return $default(_that.salesScope,_that.districtId,_that.salesMetric,_that.districtMetric,_that.merchantMetric);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sales_scope')  String salesScope, @JsonKey(name: 'district_id')  int districtId, @JsonKey(name: 'sales_metric')  String salesMetric, @JsonKey(name: 'district_metric')  String districtMetric, @JsonKey(name: 'merchant_metric')  String merchantMetric)?  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardFiltersEntity() when $default != null:
return $default(_that.salesScope,_that.districtId,_that.salesMetric,_that.districtMetric,_that.merchantMetric);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesDashboardFiltersEntity implements SalesDashboardFiltersEntity {
  const _SalesDashboardFiltersEntity({@JsonKey(name: 'sales_scope') required this.salesScope, @JsonKey(name: 'district_id') required this.districtId, @JsonKey(name: 'sales_metric') required this.salesMetric, @JsonKey(name: 'district_metric') required this.districtMetric, @JsonKey(name: 'merchant_metric') required this.merchantMetric});
  factory _SalesDashboardFiltersEntity.fromJson(Map<String, dynamic> json) => _$SalesDashboardFiltersEntityFromJson(json);

@override@JsonKey(name: 'sales_scope') final  String salesScope;
@override@JsonKey(name: 'district_id') final  int districtId;
@override@JsonKey(name: 'sales_metric') final  String salesMetric;
@override@JsonKey(name: 'district_metric') final  String districtMetric;
@override@JsonKey(name: 'merchant_metric') final  String merchantMetric;

/// Create a copy of SalesDashboardFiltersEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesDashboardFiltersEntityCopyWith<_SalesDashboardFiltersEntity> get copyWith => __$SalesDashboardFiltersEntityCopyWithImpl<_SalesDashboardFiltersEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesDashboardFiltersEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesDashboardFiltersEntity&&(identical(other.salesScope, salesScope) || other.salesScope == salesScope)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.salesMetric, salesMetric) || other.salesMetric == salesMetric)&&(identical(other.districtMetric, districtMetric) || other.districtMetric == districtMetric)&&(identical(other.merchantMetric, merchantMetric) || other.merchantMetric == merchantMetric));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,salesScope,districtId,salesMetric,districtMetric,merchantMetric);

@override
String toString() {
  return 'SalesDashboardFiltersEntity(salesScope: $salesScope, districtId: $districtId, salesMetric: $salesMetric, districtMetric: $districtMetric, merchantMetric: $merchantMetric)';
}


}

/// @nodoc
abstract mixin class _$SalesDashboardFiltersEntityCopyWith<$Res> implements $SalesDashboardFiltersEntityCopyWith<$Res> {
  factory _$SalesDashboardFiltersEntityCopyWith(_SalesDashboardFiltersEntity value, $Res Function(_SalesDashboardFiltersEntity) _then) = __$SalesDashboardFiltersEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sales_scope') String salesScope,@JsonKey(name: 'district_id') int districtId,@JsonKey(name: 'sales_metric') String salesMetric,@JsonKey(name: 'district_metric') String districtMetric,@JsonKey(name: 'merchant_metric') String merchantMetric
});




}
/// @nodoc
class __$SalesDashboardFiltersEntityCopyWithImpl<$Res>
    implements _$SalesDashboardFiltersEntityCopyWith<$Res> {
  __$SalesDashboardFiltersEntityCopyWithImpl(this._self, this._then);

  final _SalesDashboardFiltersEntity _self;
  final $Res Function(_SalesDashboardFiltersEntity) _then;

/// Create a copy of SalesDashboardFiltersEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? salesScope = null,Object? districtId = null,Object? salesMetric = null,Object? districtMetric = null,Object? merchantMetric = null,}) {
  return _then(_SalesDashboardFiltersEntity(
salesScope: null == salesScope ? _self.salesScope : salesScope // ignore: cast_nullable_to_non_nullable
as String,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,salesMetric: null == salesMetric ? _self.salesMetric : salesMetric // ignore: cast_nullable_to_non_nullable
as String,districtMetric: null == districtMetric ? _self.districtMetric : districtMetric // ignore: cast_nullable_to_non_nullable
as String,merchantMetric: null == merchantMetric ? _self.merchantMetric : merchantMetric // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SalesDashboardDistrictEntity {

 int get id; String get name;@JsonKey(name: 'regency_name') String get regencyName;@JsonKey(name: 'province_name') String get provinceName;
/// Create a copy of SalesDashboardDistrictEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesDashboardDistrictEntityCopyWith<SalesDashboardDistrictEntity> get copyWith => _$SalesDashboardDistrictEntityCopyWithImpl<SalesDashboardDistrictEntity>(this as SalesDashboardDistrictEntity, _$identity);

  /// Serializes this SalesDashboardDistrictEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesDashboardDistrictEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.regencyName, regencyName) || other.regencyName == regencyName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,regencyName,provinceName);

@override
String toString() {
  return 'SalesDashboardDistrictEntity(id: $id, name: $name, regencyName: $regencyName, provinceName: $provinceName)';
}


}

/// @nodoc
abstract mixin class $SalesDashboardDistrictEntityCopyWith<$Res>  {
  factory $SalesDashboardDistrictEntityCopyWith(SalesDashboardDistrictEntity value, $Res Function(SalesDashboardDistrictEntity) _then) = _$SalesDashboardDistrictEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'regency_name') String regencyName,@JsonKey(name: 'province_name') String provinceName
});




}
/// @nodoc
class _$SalesDashboardDistrictEntityCopyWithImpl<$Res>
    implements $SalesDashboardDistrictEntityCopyWith<$Res> {
  _$SalesDashboardDistrictEntityCopyWithImpl(this._self, this._then);

  final SalesDashboardDistrictEntity _self;
  final $Res Function(SalesDashboardDistrictEntity) _then;

/// Create a copy of SalesDashboardDistrictEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? regencyName = null,Object? provinceName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,regencyName: null == regencyName ? _self.regencyName : regencyName // ignore: cast_nullable_to_non_nullable
as String,provinceName: null == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesDashboardDistrictEntity].
extension SalesDashboardDistrictEntityPatterns on SalesDashboardDistrictEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesDashboardDistrictEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesDashboardDistrictEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesDashboardDistrictEntity value)  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardDistrictEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesDashboardDistrictEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardDistrictEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'regency_name')  String regencyName, @JsonKey(name: 'province_name')  String provinceName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesDashboardDistrictEntity() when $default != null:
return $default(_that.id,_that.name,_that.regencyName,_that.provinceName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'regency_name')  String regencyName, @JsonKey(name: 'province_name')  String provinceName)  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardDistrictEntity():
return $default(_that.id,_that.name,_that.regencyName,_that.provinceName);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'regency_name')  String regencyName, @JsonKey(name: 'province_name')  String provinceName)?  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardDistrictEntity() when $default != null:
return $default(_that.id,_that.name,_that.regencyName,_that.provinceName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesDashboardDistrictEntity implements SalesDashboardDistrictEntity {
  const _SalesDashboardDistrictEntity({required this.id, required this.name, @JsonKey(name: 'regency_name') required this.regencyName, @JsonKey(name: 'province_name') required this.provinceName});
  factory _SalesDashboardDistrictEntity.fromJson(Map<String, dynamic> json) => _$SalesDashboardDistrictEntityFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'regency_name') final  String regencyName;
@override@JsonKey(name: 'province_name') final  String provinceName;

/// Create a copy of SalesDashboardDistrictEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesDashboardDistrictEntityCopyWith<_SalesDashboardDistrictEntity> get copyWith => __$SalesDashboardDistrictEntityCopyWithImpl<_SalesDashboardDistrictEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesDashboardDistrictEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesDashboardDistrictEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.regencyName, regencyName) || other.regencyName == regencyName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,regencyName,provinceName);

@override
String toString() {
  return 'SalesDashboardDistrictEntity(id: $id, name: $name, regencyName: $regencyName, provinceName: $provinceName)';
}


}

/// @nodoc
abstract mixin class _$SalesDashboardDistrictEntityCopyWith<$Res> implements $SalesDashboardDistrictEntityCopyWith<$Res> {
  factory _$SalesDashboardDistrictEntityCopyWith(_SalesDashboardDistrictEntity value, $Res Function(_SalesDashboardDistrictEntity) _then) = __$SalesDashboardDistrictEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'regency_name') String regencyName,@JsonKey(name: 'province_name') String provinceName
});




}
/// @nodoc
class __$SalesDashboardDistrictEntityCopyWithImpl<$Res>
    implements _$SalesDashboardDistrictEntityCopyWith<$Res> {
  __$SalesDashboardDistrictEntityCopyWithImpl(this._self, this._then);

  final _SalesDashboardDistrictEntity _self;
  final $Res Function(_SalesDashboardDistrictEntity) _then;

/// Create a copy of SalesDashboardDistrictEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? regencyName = null,Object? provinceName = null,}) {
  return _then(_SalesDashboardDistrictEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,regencyName: null == regencyName ? _self.regencyName : regencyName // ignore: cast_nullable_to_non_nullable
as String,provinceName: null == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SalesDashboardTopSalesEntity {

 int get rank;@JsonKey(name: 'sales_id') int get salesId; String get name;@JsonKey(name: 'district_id') int get districtId;@JsonKey(name: 'district_name') String get districtName;@JsonKey(name: 'regency_name') String get regencyName;@JsonKey(name: 'province_name') String get provinceName;@JsonKey(name: 'acquired_merchants_count') int get acquiredMerchantsCount;@JsonKey(name: 'transactions_count') int get transactionsCount; num get revenue; String get metric;@JsonKey(name: 'metric_value') num get metricValue;
/// Create a copy of SalesDashboardTopSalesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesDashboardTopSalesEntityCopyWith<SalesDashboardTopSalesEntity> get copyWith => _$SalesDashboardTopSalesEntityCopyWithImpl<SalesDashboardTopSalesEntity>(this as SalesDashboardTopSalesEntity, _$identity);

  /// Serializes this SalesDashboardTopSalesEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesDashboardTopSalesEntity&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.salesId, salesId) || other.salesId == salesId)&&(identical(other.name, name) || other.name == name)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.regencyName, regencyName) || other.regencyName == regencyName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.acquiredMerchantsCount, acquiredMerchantsCount) || other.acquiredMerchantsCount == acquiredMerchantsCount)&&(identical(other.transactionsCount, transactionsCount) || other.transactionsCount == transactionsCount)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.metric, metric) || other.metric == metric)&&(identical(other.metricValue, metricValue) || other.metricValue == metricValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,salesId,name,districtId,districtName,regencyName,provinceName,acquiredMerchantsCount,transactionsCount,revenue,metric,metricValue);

@override
String toString() {
  return 'SalesDashboardTopSalesEntity(rank: $rank, salesId: $salesId, name: $name, districtId: $districtId, districtName: $districtName, regencyName: $regencyName, provinceName: $provinceName, acquiredMerchantsCount: $acquiredMerchantsCount, transactionsCount: $transactionsCount, revenue: $revenue, metric: $metric, metricValue: $metricValue)';
}


}

/// @nodoc
abstract mixin class $SalesDashboardTopSalesEntityCopyWith<$Res>  {
  factory $SalesDashboardTopSalesEntityCopyWith(SalesDashboardTopSalesEntity value, $Res Function(SalesDashboardTopSalesEntity) _then) = _$SalesDashboardTopSalesEntityCopyWithImpl;
@useResult
$Res call({
 int rank,@JsonKey(name: 'sales_id') int salesId, String name,@JsonKey(name: 'district_id') int districtId,@JsonKey(name: 'district_name') String districtName,@JsonKey(name: 'regency_name') String regencyName,@JsonKey(name: 'province_name') String provinceName,@JsonKey(name: 'acquired_merchants_count') int acquiredMerchantsCount,@JsonKey(name: 'transactions_count') int transactionsCount, num revenue, String metric,@JsonKey(name: 'metric_value') num metricValue
});




}
/// @nodoc
class _$SalesDashboardTopSalesEntityCopyWithImpl<$Res>
    implements $SalesDashboardTopSalesEntityCopyWith<$Res> {
  _$SalesDashboardTopSalesEntityCopyWithImpl(this._self, this._then);

  final SalesDashboardTopSalesEntity _self;
  final $Res Function(SalesDashboardTopSalesEntity) _then;

/// Create a copy of SalesDashboardTopSalesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rank = null,Object? salesId = null,Object? name = null,Object? districtId = null,Object? districtName = null,Object? regencyName = null,Object? provinceName = null,Object? acquiredMerchantsCount = null,Object? transactionsCount = null,Object? revenue = null,Object? metric = null,Object? metricValue = null,}) {
  return _then(_self.copyWith(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,salesId: null == salesId ? _self.salesId : salesId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,districtName: null == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String,regencyName: null == regencyName ? _self.regencyName : regencyName // ignore: cast_nullable_to_non_nullable
as String,provinceName: null == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String,acquiredMerchantsCount: null == acquiredMerchantsCount ? _self.acquiredMerchantsCount : acquiredMerchantsCount // ignore: cast_nullable_to_non_nullable
as int,transactionsCount: null == transactionsCount ? _self.transactionsCount : transactionsCount // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as num,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as String,metricValue: null == metricValue ? _self.metricValue : metricValue // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesDashboardTopSalesEntity].
extension SalesDashboardTopSalesEntityPatterns on SalesDashboardTopSalesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesDashboardTopSalesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesDashboardTopSalesEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesDashboardTopSalesEntity value)  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardTopSalesEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesDashboardTopSalesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardTopSalesEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rank, @JsonKey(name: 'sales_id')  int salesId,  String name, @JsonKey(name: 'district_id')  int districtId, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'regency_name')  String regencyName, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'acquired_merchants_count')  int acquiredMerchantsCount, @JsonKey(name: 'transactions_count')  int transactionsCount,  num revenue,  String metric, @JsonKey(name: 'metric_value')  num metricValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesDashboardTopSalesEntity() when $default != null:
return $default(_that.rank,_that.salesId,_that.name,_that.districtId,_that.districtName,_that.regencyName,_that.provinceName,_that.acquiredMerchantsCount,_that.transactionsCount,_that.revenue,_that.metric,_that.metricValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rank, @JsonKey(name: 'sales_id')  int salesId,  String name, @JsonKey(name: 'district_id')  int districtId, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'regency_name')  String regencyName, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'acquired_merchants_count')  int acquiredMerchantsCount, @JsonKey(name: 'transactions_count')  int transactionsCount,  num revenue,  String metric, @JsonKey(name: 'metric_value')  num metricValue)  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardTopSalesEntity():
return $default(_that.rank,_that.salesId,_that.name,_that.districtId,_that.districtName,_that.regencyName,_that.provinceName,_that.acquiredMerchantsCount,_that.transactionsCount,_that.revenue,_that.metric,_that.metricValue);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rank, @JsonKey(name: 'sales_id')  int salesId,  String name, @JsonKey(name: 'district_id')  int districtId, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'regency_name')  String regencyName, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'acquired_merchants_count')  int acquiredMerchantsCount, @JsonKey(name: 'transactions_count')  int transactionsCount,  num revenue,  String metric, @JsonKey(name: 'metric_value')  num metricValue)?  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardTopSalesEntity() when $default != null:
return $default(_that.rank,_that.salesId,_that.name,_that.districtId,_that.districtName,_that.regencyName,_that.provinceName,_that.acquiredMerchantsCount,_that.transactionsCount,_that.revenue,_that.metric,_that.metricValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesDashboardTopSalesEntity implements SalesDashboardTopSalesEntity {
  const _SalesDashboardTopSalesEntity({required this.rank, @JsonKey(name: 'sales_id') required this.salesId, required this.name, @JsonKey(name: 'district_id') required this.districtId, @JsonKey(name: 'district_name') required this.districtName, @JsonKey(name: 'regency_name') required this.regencyName, @JsonKey(name: 'province_name') required this.provinceName, @JsonKey(name: 'acquired_merchants_count') required this.acquiredMerchantsCount, @JsonKey(name: 'transactions_count') required this.transactionsCount, required this.revenue, required this.metric, @JsonKey(name: 'metric_value') required this.metricValue});
  factory _SalesDashboardTopSalesEntity.fromJson(Map<String, dynamic> json) => _$SalesDashboardTopSalesEntityFromJson(json);

@override final  int rank;
@override@JsonKey(name: 'sales_id') final  int salesId;
@override final  String name;
@override@JsonKey(name: 'district_id') final  int districtId;
@override@JsonKey(name: 'district_name') final  String districtName;
@override@JsonKey(name: 'regency_name') final  String regencyName;
@override@JsonKey(name: 'province_name') final  String provinceName;
@override@JsonKey(name: 'acquired_merchants_count') final  int acquiredMerchantsCount;
@override@JsonKey(name: 'transactions_count') final  int transactionsCount;
@override final  num revenue;
@override final  String metric;
@override@JsonKey(name: 'metric_value') final  num metricValue;

/// Create a copy of SalesDashboardTopSalesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesDashboardTopSalesEntityCopyWith<_SalesDashboardTopSalesEntity> get copyWith => __$SalesDashboardTopSalesEntityCopyWithImpl<_SalesDashboardTopSalesEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesDashboardTopSalesEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesDashboardTopSalesEntity&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.salesId, salesId) || other.salesId == salesId)&&(identical(other.name, name) || other.name == name)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.regencyName, regencyName) || other.regencyName == regencyName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.acquiredMerchantsCount, acquiredMerchantsCount) || other.acquiredMerchantsCount == acquiredMerchantsCount)&&(identical(other.transactionsCount, transactionsCount) || other.transactionsCount == transactionsCount)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.metric, metric) || other.metric == metric)&&(identical(other.metricValue, metricValue) || other.metricValue == metricValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,salesId,name,districtId,districtName,regencyName,provinceName,acquiredMerchantsCount,transactionsCount,revenue,metric,metricValue);

@override
String toString() {
  return 'SalesDashboardTopSalesEntity(rank: $rank, salesId: $salesId, name: $name, districtId: $districtId, districtName: $districtName, regencyName: $regencyName, provinceName: $provinceName, acquiredMerchantsCount: $acquiredMerchantsCount, transactionsCount: $transactionsCount, revenue: $revenue, metric: $metric, metricValue: $metricValue)';
}


}

/// @nodoc
abstract mixin class _$SalesDashboardTopSalesEntityCopyWith<$Res> implements $SalesDashboardTopSalesEntityCopyWith<$Res> {
  factory _$SalesDashboardTopSalesEntityCopyWith(_SalesDashboardTopSalesEntity value, $Res Function(_SalesDashboardTopSalesEntity) _then) = __$SalesDashboardTopSalesEntityCopyWithImpl;
@override @useResult
$Res call({
 int rank,@JsonKey(name: 'sales_id') int salesId, String name,@JsonKey(name: 'district_id') int districtId,@JsonKey(name: 'district_name') String districtName,@JsonKey(name: 'regency_name') String regencyName,@JsonKey(name: 'province_name') String provinceName,@JsonKey(name: 'acquired_merchants_count') int acquiredMerchantsCount,@JsonKey(name: 'transactions_count') int transactionsCount, num revenue, String metric,@JsonKey(name: 'metric_value') num metricValue
});




}
/// @nodoc
class __$SalesDashboardTopSalesEntityCopyWithImpl<$Res>
    implements _$SalesDashboardTopSalesEntityCopyWith<$Res> {
  __$SalesDashboardTopSalesEntityCopyWithImpl(this._self, this._then);

  final _SalesDashboardTopSalesEntity _self;
  final $Res Function(_SalesDashboardTopSalesEntity) _then;

/// Create a copy of SalesDashboardTopSalesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rank = null,Object? salesId = null,Object? name = null,Object? districtId = null,Object? districtName = null,Object? regencyName = null,Object? provinceName = null,Object? acquiredMerchantsCount = null,Object? transactionsCount = null,Object? revenue = null,Object? metric = null,Object? metricValue = null,}) {
  return _then(_SalesDashboardTopSalesEntity(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,salesId: null == salesId ? _self.salesId : salesId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,districtName: null == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String,regencyName: null == regencyName ? _self.regencyName : regencyName // ignore: cast_nullable_to_non_nullable
as String,provinceName: null == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String,acquiredMerchantsCount: null == acquiredMerchantsCount ? _self.acquiredMerchantsCount : acquiredMerchantsCount // ignore: cast_nullable_to_non_nullable
as int,transactionsCount: null == transactionsCount ? _self.transactionsCount : transactionsCount // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as num,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as String,metricValue: null == metricValue ? _self.metricValue : metricValue // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$SalesDashboardTopDistrictEntity {

 int get rank;@JsonKey(name: 'district_id') int get districtId;@JsonKey(name: 'district_name') String get districtName;@JsonKey(name: 'regency_name') String get regencyName;@JsonKey(name: 'province_name') String get provinceName;@JsonKey(name: 'registered_merchants_count') int get registeredMerchantsCount;@JsonKey(name: 'acquired_merchants_count') int get acquiredMerchantsCount;@JsonKey(name: 'transactions_count') int get transactionsCount; num get revenue; String get metric;@JsonKey(name: 'metric_value') num get metricValue;
/// Create a copy of SalesDashboardTopDistrictEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesDashboardTopDistrictEntityCopyWith<SalesDashboardTopDistrictEntity> get copyWith => _$SalesDashboardTopDistrictEntityCopyWithImpl<SalesDashboardTopDistrictEntity>(this as SalesDashboardTopDistrictEntity, _$identity);

  /// Serializes this SalesDashboardTopDistrictEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesDashboardTopDistrictEntity&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.regencyName, regencyName) || other.regencyName == regencyName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.registeredMerchantsCount, registeredMerchantsCount) || other.registeredMerchantsCount == registeredMerchantsCount)&&(identical(other.acquiredMerchantsCount, acquiredMerchantsCount) || other.acquiredMerchantsCount == acquiredMerchantsCount)&&(identical(other.transactionsCount, transactionsCount) || other.transactionsCount == transactionsCount)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.metric, metric) || other.metric == metric)&&(identical(other.metricValue, metricValue) || other.metricValue == metricValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,districtId,districtName,regencyName,provinceName,registeredMerchantsCount,acquiredMerchantsCount,transactionsCount,revenue,metric,metricValue);

@override
String toString() {
  return 'SalesDashboardTopDistrictEntity(rank: $rank, districtId: $districtId, districtName: $districtName, regencyName: $regencyName, provinceName: $provinceName, registeredMerchantsCount: $registeredMerchantsCount, acquiredMerchantsCount: $acquiredMerchantsCount, transactionsCount: $transactionsCount, revenue: $revenue, metric: $metric, metricValue: $metricValue)';
}


}

/// @nodoc
abstract mixin class $SalesDashboardTopDistrictEntityCopyWith<$Res>  {
  factory $SalesDashboardTopDistrictEntityCopyWith(SalesDashboardTopDistrictEntity value, $Res Function(SalesDashboardTopDistrictEntity) _then) = _$SalesDashboardTopDistrictEntityCopyWithImpl;
@useResult
$Res call({
 int rank,@JsonKey(name: 'district_id') int districtId,@JsonKey(name: 'district_name') String districtName,@JsonKey(name: 'regency_name') String regencyName,@JsonKey(name: 'province_name') String provinceName,@JsonKey(name: 'registered_merchants_count') int registeredMerchantsCount,@JsonKey(name: 'acquired_merchants_count') int acquiredMerchantsCount,@JsonKey(name: 'transactions_count') int transactionsCount, num revenue, String metric,@JsonKey(name: 'metric_value') num metricValue
});




}
/// @nodoc
class _$SalesDashboardTopDistrictEntityCopyWithImpl<$Res>
    implements $SalesDashboardTopDistrictEntityCopyWith<$Res> {
  _$SalesDashboardTopDistrictEntityCopyWithImpl(this._self, this._then);

  final SalesDashboardTopDistrictEntity _self;
  final $Res Function(SalesDashboardTopDistrictEntity) _then;

/// Create a copy of SalesDashboardTopDistrictEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rank = null,Object? districtId = null,Object? districtName = null,Object? regencyName = null,Object? provinceName = null,Object? registeredMerchantsCount = null,Object? acquiredMerchantsCount = null,Object? transactionsCount = null,Object? revenue = null,Object? metric = null,Object? metricValue = null,}) {
  return _then(_self.copyWith(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,districtName: null == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String,regencyName: null == regencyName ? _self.regencyName : regencyName // ignore: cast_nullable_to_non_nullable
as String,provinceName: null == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String,registeredMerchantsCount: null == registeredMerchantsCount ? _self.registeredMerchantsCount : registeredMerchantsCount // ignore: cast_nullable_to_non_nullable
as int,acquiredMerchantsCount: null == acquiredMerchantsCount ? _self.acquiredMerchantsCount : acquiredMerchantsCount // ignore: cast_nullable_to_non_nullable
as int,transactionsCount: null == transactionsCount ? _self.transactionsCount : transactionsCount // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as num,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as String,metricValue: null == metricValue ? _self.metricValue : metricValue // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesDashboardTopDistrictEntity].
extension SalesDashboardTopDistrictEntityPatterns on SalesDashboardTopDistrictEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesDashboardTopDistrictEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesDashboardTopDistrictEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesDashboardTopDistrictEntity value)  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardTopDistrictEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesDashboardTopDistrictEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardTopDistrictEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rank, @JsonKey(name: 'district_id')  int districtId, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'regency_name')  String regencyName, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'registered_merchants_count')  int registeredMerchantsCount, @JsonKey(name: 'acquired_merchants_count')  int acquiredMerchantsCount, @JsonKey(name: 'transactions_count')  int transactionsCount,  num revenue,  String metric, @JsonKey(name: 'metric_value')  num metricValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesDashboardTopDistrictEntity() when $default != null:
return $default(_that.rank,_that.districtId,_that.districtName,_that.regencyName,_that.provinceName,_that.registeredMerchantsCount,_that.acquiredMerchantsCount,_that.transactionsCount,_that.revenue,_that.metric,_that.metricValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rank, @JsonKey(name: 'district_id')  int districtId, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'regency_name')  String regencyName, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'registered_merchants_count')  int registeredMerchantsCount, @JsonKey(name: 'acquired_merchants_count')  int acquiredMerchantsCount, @JsonKey(name: 'transactions_count')  int transactionsCount,  num revenue,  String metric, @JsonKey(name: 'metric_value')  num metricValue)  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardTopDistrictEntity():
return $default(_that.rank,_that.districtId,_that.districtName,_that.regencyName,_that.provinceName,_that.registeredMerchantsCount,_that.acquiredMerchantsCount,_that.transactionsCount,_that.revenue,_that.metric,_that.metricValue);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rank, @JsonKey(name: 'district_id')  int districtId, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'regency_name')  String regencyName, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'registered_merchants_count')  int registeredMerchantsCount, @JsonKey(name: 'acquired_merchants_count')  int acquiredMerchantsCount, @JsonKey(name: 'transactions_count')  int transactionsCount,  num revenue,  String metric, @JsonKey(name: 'metric_value')  num metricValue)?  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardTopDistrictEntity() when $default != null:
return $default(_that.rank,_that.districtId,_that.districtName,_that.regencyName,_that.provinceName,_that.registeredMerchantsCount,_that.acquiredMerchantsCount,_that.transactionsCount,_that.revenue,_that.metric,_that.metricValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesDashboardTopDistrictEntity implements SalesDashboardTopDistrictEntity {
  const _SalesDashboardTopDistrictEntity({required this.rank, @JsonKey(name: 'district_id') required this.districtId, @JsonKey(name: 'district_name') required this.districtName, @JsonKey(name: 'regency_name') required this.regencyName, @JsonKey(name: 'province_name') required this.provinceName, @JsonKey(name: 'registered_merchants_count') required this.registeredMerchantsCount, @JsonKey(name: 'acquired_merchants_count') required this.acquiredMerchantsCount, @JsonKey(name: 'transactions_count') required this.transactionsCount, required this.revenue, required this.metric, @JsonKey(name: 'metric_value') required this.metricValue});
  factory _SalesDashboardTopDistrictEntity.fromJson(Map<String, dynamic> json) => _$SalesDashboardTopDistrictEntityFromJson(json);

@override final  int rank;
@override@JsonKey(name: 'district_id') final  int districtId;
@override@JsonKey(name: 'district_name') final  String districtName;
@override@JsonKey(name: 'regency_name') final  String regencyName;
@override@JsonKey(name: 'province_name') final  String provinceName;
@override@JsonKey(name: 'registered_merchants_count') final  int registeredMerchantsCount;
@override@JsonKey(name: 'acquired_merchants_count') final  int acquiredMerchantsCount;
@override@JsonKey(name: 'transactions_count') final  int transactionsCount;
@override final  num revenue;
@override final  String metric;
@override@JsonKey(name: 'metric_value') final  num metricValue;

/// Create a copy of SalesDashboardTopDistrictEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesDashboardTopDistrictEntityCopyWith<_SalesDashboardTopDistrictEntity> get copyWith => __$SalesDashboardTopDistrictEntityCopyWithImpl<_SalesDashboardTopDistrictEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesDashboardTopDistrictEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesDashboardTopDistrictEntity&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.regencyName, regencyName) || other.regencyName == regencyName)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.registeredMerchantsCount, registeredMerchantsCount) || other.registeredMerchantsCount == registeredMerchantsCount)&&(identical(other.acquiredMerchantsCount, acquiredMerchantsCount) || other.acquiredMerchantsCount == acquiredMerchantsCount)&&(identical(other.transactionsCount, transactionsCount) || other.transactionsCount == transactionsCount)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.metric, metric) || other.metric == metric)&&(identical(other.metricValue, metricValue) || other.metricValue == metricValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,districtId,districtName,regencyName,provinceName,registeredMerchantsCount,acquiredMerchantsCount,transactionsCount,revenue,metric,metricValue);

@override
String toString() {
  return 'SalesDashboardTopDistrictEntity(rank: $rank, districtId: $districtId, districtName: $districtName, regencyName: $regencyName, provinceName: $provinceName, registeredMerchantsCount: $registeredMerchantsCount, acquiredMerchantsCount: $acquiredMerchantsCount, transactionsCount: $transactionsCount, revenue: $revenue, metric: $metric, metricValue: $metricValue)';
}


}

/// @nodoc
abstract mixin class _$SalesDashboardTopDistrictEntityCopyWith<$Res> implements $SalesDashboardTopDistrictEntityCopyWith<$Res> {
  factory _$SalesDashboardTopDistrictEntityCopyWith(_SalesDashboardTopDistrictEntity value, $Res Function(_SalesDashboardTopDistrictEntity) _then) = __$SalesDashboardTopDistrictEntityCopyWithImpl;
@override @useResult
$Res call({
 int rank,@JsonKey(name: 'district_id') int districtId,@JsonKey(name: 'district_name') String districtName,@JsonKey(name: 'regency_name') String regencyName,@JsonKey(name: 'province_name') String provinceName,@JsonKey(name: 'registered_merchants_count') int registeredMerchantsCount,@JsonKey(name: 'acquired_merchants_count') int acquiredMerchantsCount,@JsonKey(name: 'transactions_count') int transactionsCount, num revenue, String metric,@JsonKey(name: 'metric_value') num metricValue
});




}
/// @nodoc
class __$SalesDashboardTopDistrictEntityCopyWithImpl<$Res>
    implements _$SalesDashboardTopDistrictEntityCopyWith<$Res> {
  __$SalesDashboardTopDistrictEntityCopyWithImpl(this._self, this._then);

  final _SalesDashboardTopDistrictEntity _self;
  final $Res Function(_SalesDashboardTopDistrictEntity) _then;

/// Create a copy of SalesDashboardTopDistrictEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rank = null,Object? districtId = null,Object? districtName = null,Object? regencyName = null,Object? provinceName = null,Object? registeredMerchantsCount = null,Object? acquiredMerchantsCount = null,Object? transactionsCount = null,Object? revenue = null,Object? metric = null,Object? metricValue = null,}) {
  return _then(_SalesDashboardTopDistrictEntity(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,districtName: null == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String,regencyName: null == regencyName ? _self.regencyName : regencyName // ignore: cast_nullable_to_non_nullable
as String,provinceName: null == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String,registeredMerchantsCount: null == registeredMerchantsCount ? _self.registeredMerchantsCount : registeredMerchantsCount // ignore: cast_nullable_to_non_nullable
as int,acquiredMerchantsCount: null == acquiredMerchantsCount ? _self.acquiredMerchantsCount : acquiredMerchantsCount // ignore: cast_nullable_to_non_nullable
as int,transactionsCount: null == transactionsCount ? _self.transactionsCount : transactionsCount // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as num,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as String,metricValue: null == metricValue ? _self.metricValue : metricValue // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$SalesDashboardSummaryEntity {

@JsonKey(name: 'registered_merchants_count') int get registeredMerchantsCount;@JsonKey(name: 'acquired_merchants_count') int get acquiredMerchantsCount;@JsonKey(name: 'total_transactions') int get totalTransactions;@JsonKey(name: 'total_revenue') num get totalRevenue;@JsonKey(name: 'average_transaction_value') num get averageTransactionValue;
/// Create a copy of SalesDashboardSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesDashboardSummaryEntityCopyWith<SalesDashboardSummaryEntity> get copyWith => _$SalesDashboardSummaryEntityCopyWithImpl<SalesDashboardSummaryEntity>(this as SalesDashboardSummaryEntity, _$identity);

  /// Serializes this SalesDashboardSummaryEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesDashboardSummaryEntity&&(identical(other.registeredMerchantsCount, registeredMerchantsCount) || other.registeredMerchantsCount == registeredMerchantsCount)&&(identical(other.acquiredMerchantsCount, acquiredMerchantsCount) || other.acquiredMerchantsCount == acquiredMerchantsCount)&&(identical(other.totalTransactions, totalTransactions) || other.totalTransactions == totalTransactions)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.averageTransactionValue, averageTransactionValue) || other.averageTransactionValue == averageTransactionValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registeredMerchantsCount,acquiredMerchantsCount,totalTransactions,totalRevenue,averageTransactionValue);

@override
String toString() {
  return 'SalesDashboardSummaryEntity(registeredMerchantsCount: $registeredMerchantsCount, acquiredMerchantsCount: $acquiredMerchantsCount, totalTransactions: $totalTransactions, totalRevenue: $totalRevenue, averageTransactionValue: $averageTransactionValue)';
}


}

/// @nodoc
abstract mixin class $SalesDashboardSummaryEntityCopyWith<$Res>  {
  factory $SalesDashboardSummaryEntityCopyWith(SalesDashboardSummaryEntity value, $Res Function(SalesDashboardSummaryEntity) _then) = _$SalesDashboardSummaryEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'registered_merchants_count') int registeredMerchantsCount,@JsonKey(name: 'acquired_merchants_count') int acquiredMerchantsCount,@JsonKey(name: 'total_transactions') int totalTransactions,@JsonKey(name: 'total_revenue') num totalRevenue,@JsonKey(name: 'average_transaction_value') num averageTransactionValue
});




}
/// @nodoc
class _$SalesDashboardSummaryEntityCopyWithImpl<$Res>
    implements $SalesDashboardSummaryEntityCopyWith<$Res> {
  _$SalesDashboardSummaryEntityCopyWithImpl(this._self, this._then);

  final SalesDashboardSummaryEntity _self;
  final $Res Function(SalesDashboardSummaryEntity) _then;

/// Create a copy of SalesDashboardSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registeredMerchantsCount = null,Object? acquiredMerchantsCount = null,Object? totalTransactions = null,Object? totalRevenue = null,Object? averageTransactionValue = null,}) {
  return _then(_self.copyWith(
registeredMerchantsCount: null == registeredMerchantsCount ? _self.registeredMerchantsCount : registeredMerchantsCount // ignore: cast_nullable_to_non_nullable
as int,acquiredMerchantsCount: null == acquiredMerchantsCount ? _self.acquiredMerchantsCount : acquiredMerchantsCount // ignore: cast_nullable_to_non_nullable
as int,totalTransactions: null == totalTransactions ? _self.totalTransactions : totalTransactions // ignore: cast_nullable_to_non_nullable
as int,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as num,averageTransactionValue: null == averageTransactionValue ? _self.averageTransactionValue : averageTransactionValue // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesDashboardSummaryEntity].
extension SalesDashboardSummaryEntityPatterns on SalesDashboardSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesDashboardSummaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesDashboardSummaryEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesDashboardSummaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardSummaryEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesDashboardSummaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardSummaryEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'registered_merchants_count')  int registeredMerchantsCount, @JsonKey(name: 'acquired_merchants_count')  int acquiredMerchantsCount, @JsonKey(name: 'total_transactions')  int totalTransactions, @JsonKey(name: 'total_revenue')  num totalRevenue, @JsonKey(name: 'average_transaction_value')  num averageTransactionValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesDashboardSummaryEntity() when $default != null:
return $default(_that.registeredMerchantsCount,_that.acquiredMerchantsCount,_that.totalTransactions,_that.totalRevenue,_that.averageTransactionValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'registered_merchants_count')  int registeredMerchantsCount, @JsonKey(name: 'acquired_merchants_count')  int acquiredMerchantsCount, @JsonKey(name: 'total_transactions')  int totalTransactions, @JsonKey(name: 'total_revenue')  num totalRevenue, @JsonKey(name: 'average_transaction_value')  num averageTransactionValue)  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardSummaryEntity():
return $default(_that.registeredMerchantsCount,_that.acquiredMerchantsCount,_that.totalTransactions,_that.totalRevenue,_that.averageTransactionValue);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'registered_merchants_count')  int registeredMerchantsCount, @JsonKey(name: 'acquired_merchants_count')  int acquiredMerchantsCount, @JsonKey(name: 'total_transactions')  int totalTransactions, @JsonKey(name: 'total_revenue')  num totalRevenue, @JsonKey(name: 'average_transaction_value')  num averageTransactionValue)?  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardSummaryEntity() when $default != null:
return $default(_that.registeredMerchantsCount,_that.acquiredMerchantsCount,_that.totalTransactions,_that.totalRevenue,_that.averageTransactionValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesDashboardSummaryEntity implements SalesDashboardSummaryEntity {
  const _SalesDashboardSummaryEntity({@JsonKey(name: 'registered_merchants_count') required this.registeredMerchantsCount, @JsonKey(name: 'acquired_merchants_count') required this.acquiredMerchantsCount, @JsonKey(name: 'total_transactions') required this.totalTransactions, @JsonKey(name: 'total_revenue') required this.totalRevenue, @JsonKey(name: 'average_transaction_value') required this.averageTransactionValue});
  factory _SalesDashboardSummaryEntity.fromJson(Map<String, dynamic> json) => _$SalesDashboardSummaryEntityFromJson(json);

@override@JsonKey(name: 'registered_merchants_count') final  int registeredMerchantsCount;
@override@JsonKey(name: 'acquired_merchants_count') final  int acquiredMerchantsCount;
@override@JsonKey(name: 'total_transactions') final  int totalTransactions;
@override@JsonKey(name: 'total_revenue') final  num totalRevenue;
@override@JsonKey(name: 'average_transaction_value') final  num averageTransactionValue;

/// Create a copy of SalesDashboardSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesDashboardSummaryEntityCopyWith<_SalesDashboardSummaryEntity> get copyWith => __$SalesDashboardSummaryEntityCopyWithImpl<_SalesDashboardSummaryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesDashboardSummaryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesDashboardSummaryEntity&&(identical(other.registeredMerchantsCount, registeredMerchantsCount) || other.registeredMerchantsCount == registeredMerchantsCount)&&(identical(other.acquiredMerchantsCount, acquiredMerchantsCount) || other.acquiredMerchantsCount == acquiredMerchantsCount)&&(identical(other.totalTransactions, totalTransactions) || other.totalTransactions == totalTransactions)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.averageTransactionValue, averageTransactionValue) || other.averageTransactionValue == averageTransactionValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registeredMerchantsCount,acquiredMerchantsCount,totalTransactions,totalRevenue,averageTransactionValue);

@override
String toString() {
  return 'SalesDashboardSummaryEntity(registeredMerchantsCount: $registeredMerchantsCount, acquiredMerchantsCount: $acquiredMerchantsCount, totalTransactions: $totalTransactions, totalRevenue: $totalRevenue, averageTransactionValue: $averageTransactionValue)';
}


}

/// @nodoc
abstract mixin class _$SalesDashboardSummaryEntityCopyWith<$Res> implements $SalesDashboardSummaryEntityCopyWith<$Res> {
  factory _$SalesDashboardSummaryEntityCopyWith(_SalesDashboardSummaryEntity value, $Res Function(_SalesDashboardSummaryEntity) _then) = __$SalesDashboardSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'registered_merchants_count') int registeredMerchantsCount,@JsonKey(name: 'acquired_merchants_count') int acquiredMerchantsCount,@JsonKey(name: 'total_transactions') int totalTransactions,@JsonKey(name: 'total_revenue') num totalRevenue,@JsonKey(name: 'average_transaction_value') num averageTransactionValue
});




}
/// @nodoc
class __$SalesDashboardSummaryEntityCopyWithImpl<$Res>
    implements _$SalesDashboardSummaryEntityCopyWith<$Res> {
  __$SalesDashboardSummaryEntityCopyWithImpl(this._self, this._then);

  final _SalesDashboardSummaryEntity _self;
  final $Res Function(_SalesDashboardSummaryEntity) _then;

/// Create a copy of SalesDashboardSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registeredMerchantsCount = null,Object? acquiredMerchantsCount = null,Object? totalTransactions = null,Object? totalRevenue = null,Object? averageTransactionValue = null,}) {
  return _then(_SalesDashboardSummaryEntity(
registeredMerchantsCount: null == registeredMerchantsCount ? _self.registeredMerchantsCount : registeredMerchantsCount // ignore: cast_nullable_to_non_nullable
as int,acquiredMerchantsCount: null == acquiredMerchantsCount ? _self.acquiredMerchantsCount : acquiredMerchantsCount // ignore: cast_nullable_to_non_nullable
as int,totalTransactions: null == totalTransactions ? _self.totalTransactions : totalTransactions // ignore: cast_nullable_to_non_nullable
as int,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as num,averageTransactionValue: null == averageTransactionValue ? _self.averageTransactionValue : averageTransactionValue // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$SalesDashboardMerchantEntity {

 int get rank;@JsonKey(name: 'merchant_id') String get merchantId; String get name;@JsonKey(name: 'sales_id') int? get salesId;@JsonKey(name: 'sales_name') String? get salesName;@JsonKey(name: 'is_acquired') bool get isAcquired;@JsonKey(name: 'transactions_count') int get transactionsCount; num get revenue; String get metric;@JsonKey(name: 'metric_value') num get metricValue;
/// Create a copy of SalesDashboardMerchantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesDashboardMerchantEntityCopyWith<SalesDashboardMerchantEntity> get copyWith => _$SalesDashboardMerchantEntityCopyWithImpl<SalesDashboardMerchantEntity>(this as SalesDashboardMerchantEntity, _$identity);

  /// Serializes this SalesDashboardMerchantEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesDashboardMerchantEntity&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.name, name) || other.name == name)&&(identical(other.salesId, salesId) || other.salesId == salesId)&&(identical(other.salesName, salesName) || other.salesName == salesName)&&(identical(other.isAcquired, isAcquired) || other.isAcquired == isAcquired)&&(identical(other.transactionsCount, transactionsCount) || other.transactionsCount == transactionsCount)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.metric, metric) || other.metric == metric)&&(identical(other.metricValue, metricValue) || other.metricValue == metricValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,merchantId,name,salesId,salesName,isAcquired,transactionsCount,revenue,metric,metricValue);

@override
String toString() {
  return 'SalesDashboardMerchantEntity(rank: $rank, merchantId: $merchantId, name: $name, salesId: $salesId, salesName: $salesName, isAcquired: $isAcquired, transactionsCount: $transactionsCount, revenue: $revenue, metric: $metric, metricValue: $metricValue)';
}


}

/// @nodoc
abstract mixin class $SalesDashboardMerchantEntityCopyWith<$Res>  {
  factory $SalesDashboardMerchantEntityCopyWith(SalesDashboardMerchantEntity value, $Res Function(SalesDashboardMerchantEntity) _then) = _$SalesDashboardMerchantEntityCopyWithImpl;
@useResult
$Res call({
 int rank,@JsonKey(name: 'merchant_id') String merchantId, String name,@JsonKey(name: 'sales_id') int? salesId,@JsonKey(name: 'sales_name') String? salesName,@JsonKey(name: 'is_acquired') bool isAcquired,@JsonKey(name: 'transactions_count') int transactionsCount, num revenue, String metric,@JsonKey(name: 'metric_value') num metricValue
});




}
/// @nodoc
class _$SalesDashboardMerchantEntityCopyWithImpl<$Res>
    implements $SalesDashboardMerchantEntityCopyWith<$Res> {
  _$SalesDashboardMerchantEntityCopyWithImpl(this._self, this._then);

  final SalesDashboardMerchantEntity _self;
  final $Res Function(SalesDashboardMerchantEntity) _then;

/// Create a copy of SalesDashboardMerchantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rank = null,Object? merchantId = null,Object? name = null,Object? salesId = freezed,Object? salesName = freezed,Object? isAcquired = null,Object? transactionsCount = null,Object? revenue = null,Object? metric = null,Object? metricValue = null,}) {
  return _then(_self.copyWith(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,salesId: freezed == salesId ? _self.salesId : salesId // ignore: cast_nullable_to_non_nullable
as int?,salesName: freezed == salesName ? _self.salesName : salesName // ignore: cast_nullable_to_non_nullable
as String?,isAcquired: null == isAcquired ? _self.isAcquired : isAcquired // ignore: cast_nullable_to_non_nullable
as bool,transactionsCount: null == transactionsCount ? _self.transactionsCount : transactionsCount // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as num,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as String,metricValue: null == metricValue ? _self.metricValue : metricValue // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesDashboardMerchantEntity].
extension SalesDashboardMerchantEntityPatterns on SalesDashboardMerchantEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesDashboardMerchantEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesDashboardMerchantEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesDashboardMerchantEntity value)  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardMerchantEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesDashboardMerchantEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SalesDashboardMerchantEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rank, @JsonKey(name: 'merchant_id')  String merchantId,  String name, @JsonKey(name: 'sales_id')  int? salesId, @JsonKey(name: 'sales_name')  String? salesName, @JsonKey(name: 'is_acquired')  bool isAcquired, @JsonKey(name: 'transactions_count')  int transactionsCount,  num revenue,  String metric, @JsonKey(name: 'metric_value')  num metricValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesDashboardMerchantEntity() when $default != null:
return $default(_that.rank,_that.merchantId,_that.name,_that.salesId,_that.salesName,_that.isAcquired,_that.transactionsCount,_that.revenue,_that.metric,_that.metricValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rank, @JsonKey(name: 'merchant_id')  String merchantId,  String name, @JsonKey(name: 'sales_id')  int? salesId, @JsonKey(name: 'sales_name')  String? salesName, @JsonKey(name: 'is_acquired')  bool isAcquired, @JsonKey(name: 'transactions_count')  int transactionsCount,  num revenue,  String metric, @JsonKey(name: 'metric_value')  num metricValue)  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardMerchantEntity():
return $default(_that.rank,_that.merchantId,_that.name,_that.salesId,_that.salesName,_that.isAcquired,_that.transactionsCount,_that.revenue,_that.metric,_that.metricValue);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rank, @JsonKey(name: 'merchant_id')  String merchantId,  String name, @JsonKey(name: 'sales_id')  int? salesId, @JsonKey(name: 'sales_name')  String? salesName, @JsonKey(name: 'is_acquired')  bool isAcquired, @JsonKey(name: 'transactions_count')  int transactionsCount,  num revenue,  String metric, @JsonKey(name: 'metric_value')  num metricValue)?  $default,) {final _that = this;
switch (_that) {
case _SalesDashboardMerchantEntity() when $default != null:
return $default(_that.rank,_that.merchantId,_that.name,_that.salesId,_that.salesName,_that.isAcquired,_that.transactionsCount,_that.revenue,_that.metric,_that.metricValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesDashboardMerchantEntity implements SalesDashboardMerchantEntity {
  const _SalesDashboardMerchantEntity({required this.rank, @JsonKey(name: 'merchant_id') required this.merchantId, required this.name, @JsonKey(name: 'sales_id') this.salesId, @JsonKey(name: 'sales_name') this.salesName, @JsonKey(name: 'is_acquired') required this.isAcquired, @JsonKey(name: 'transactions_count') required this.transactionsCount, required this.revenue, required this.metric, @JsonKey(name: 'metric_value') required this.metricValue});
  factory _SalesDashboardMerchantEntity.fromJson(Map<String, dynamic> json) => _$SalesDashboardMerchantEntityFromJson(json);

@override final  int rank;
@override@JsonKey(name: 'merchant_id') final  String merchantId;
@override final  String name;
@override@JsonKey(name: 'sales_id') final  int? salesId;
@override@JsonKey(name: 'sales_name') final  String? salesName;
@override@JsonKey(name: 'is_acquired') final  bool isAcquired;
@override@JsonKey(name: 'transactions_count') final  int transactionsCount;
@override final  num revenue;
@override final  String metric;
@override@JsonKey(name: 'metric_value') final  num metricValue;

/// Create a copy of SalesDashboardMerchantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesDashboardMerchantEntityCopyWith<_SalesDashboardMerchantEntity> get copyWith => __$SalesDashboardMerchantEntityCopyWithImpl<_SalesDashboardMerchantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesDashboardMerchantEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesDashboardMerchantEntity&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.name, name) || other.name == name)&&(identical(other.salesId, salesId) || other.salesId == salesId)&&(identical(other.salesName, salesName) || other.salesName == salesName)&&(identical(other.isAcquired, isAcquired) || other.isAcquired == isAcquired)&&(identical(other.transactionsCount, transactionsCount) || other.transactionsCount == transactionsCount)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.metric, metric) || other.metric == metric)&&(identical(other.metricValue, metricValue) || other.metricValue == metricValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,merchantId,name,salesId,salesName,isAcquired,transactionsCount,revenue,metric,metricValue);

@override
String toString() {
  return 'SalesDashboardMerchantEntity(rank: $rank, merchantId: $merchantId, name: $name, salesId: $salesId, salesName: $salesName, isAcquired: $isAcquired, transactionsCount: $transactionsCount, revenue: $revenue, metric: $metric, metricValue: $metricValue)';
}


}

/// @nodoc
abstract mixin class _$SalesDashboardMerchantEntityCopyWith<$Res> implements $SalesDashboardMerchantEntityCopyWith<$Res> {
  factory _$SalesDashboardMerchantEntityCopyWith(_SalesDashboardMerchantEntity value, $Res Function(_SalesDashboardMerchantEntity) _then) = __$SalesDashboardMerchantEntityCopyWithImpl;
@override @useResult
$Res call({
 int rank,@JsonKey(name: 'merchant_id') String merchantId, String name,@JsonKey(name: 'sales_id') int? salesId,@JsonKey(name: 'sales_name') String? salesName,@JsonKey(name: 'is_acquired') bool isAcquired,@JsonKey(name: 'transactions_count') int transactionsCount, num revenue, String metric,@JsonKey(name: 'metric_value') num metricValue
});




}
/// @nodoc
class __$SalesDashboardMerchantEntityCopyWithImpl<$Res>
    implements _$SalesDashboardMerchantEntityCopyWith<$Res> {
  __$SalesDashboardMerchantEntityCopyWithImpl(this._self, this._then);

  final _SalesDashboardMerchantEntity _self;
  final $Res Function(_SalesDashboardMerchantEntity) _then;

/// Create a copy of SalesDashboardMerchantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rank = null,Object? merchantId = null,Object? name = null,Object? salesId = freezed,Object? salesName = freezed,Object? isAcquired = null,Object? transactionsCount = null,Object? revenue = null,Object? metric = null,Object? metricValue = null,}) {
  return _then(_SalesDashboardMerchantEntity(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,salesId: freezed == salesId ? _self.salesId : salesId // ignore: cast_nullable_to_non_nullable
as int?,salesName: freezed == salesName ? _self.salesName : salesName // ignore: cast_nullable_to_non_nullable
as String?,isAcquired: null == isAcquired ? _self.isAcquired : isAcquired // ignore: cast_nullable_to_non_nullable
as bool,transactionsCount: null == transactionsCount ? _self.transactionsCount : transactionsCount // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as num,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as String,metricValue: null == metricValue ? _self.metricValue : metricValue // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
