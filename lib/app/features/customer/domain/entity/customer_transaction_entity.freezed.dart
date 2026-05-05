// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_transaction_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerTransactionEntity {

 String get id; String get storeName; Color get storeColor1; Color get storeColor2; int get itemCount; int get total; TxStatus get status; String get dateLabel; String? get orderId;
/// Create a copy of CustomerTransactionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerTransactionEntityCopyWith<CustomerTransactionEntity> get copyWith => _$CustomerTransactionEntityCopyWithImpl<CustomerTransactionEntity>(this as CustomerTransactionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerTransactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.storeColor1, storeColor1) || other.storeColor1 == storeColor1)&&(identical(other.storeColor2, storeColor2) || other.storeColor2 == storeColor2)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,id,storeName,storeColor1,storeColor2,itemCount,total,status,dateLabel,orderId);

@override
String toString() {
  return 'CustomerTransactionEntity(id: $id, storeName: $storeName, storeColor1: $storeColor1, storeColor2: $storeColor2, itemCount: $itemCount, total: $total, status: $status, dateLabel: $dateLabel, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $CustomerTransactionEntityCopyWith<$Res>  {
  factory $CustomerTransactionEntityCopyWith(CustomerTransactionEntity value, $Res Function(CustomerTransactionEntity) _then) = _$CustomerTransactionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String storeName, Color storeColor1, Color storeColor2, int itemCount, int total, TxStatus status, String dateLabel, String? orderId
});




}
/// @nodoc
class _$CustomerTransactionEntityCopyWithImpl<$Res>
    implements $CustomerTransactionEntityCopyWith<$Res> {
  _$CustomerTransactionEntityCopyWithImpl(this._self, this._then);

  final CustomerTransactionEntity _self;
  final $Res Function(CustomerTransactionEntity) _then;

/// Create a copy of CustomerTransactionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? storeName = null,Object? storeColor1 = null,Object? storeColor2 = null,Object? itemCount = null,Object? total = null,Object? status = null,Object? dateLabel = null,Object? orderId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,storeColor1: null == storeColor1 ? _self.storeColor1 : storeColor1 // ignore: cast_nullable_to_non_nullable
as Color,storeColor2: null == storeColor2 ? _self.storeColor2 : storeColor2 // ignore: cast_nullable_to_non_nullable
as Color,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TxStatus,dateLabel: null == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
as String,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerTransactionEntity].
extension CustomerTransactionEntityPatterns on CustomerTransactionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerTransactionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerTransactionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerTransactionEntity value)  $default,){
final _that = this;
switch (_that) {
case _CustomerTransactionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerTransactionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerTransactionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String storeName,  Color storeColor1,  Color storeColor2,  int itemCount,  int total,  TxStatus status,  String dateLabel,  String? orderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerTransactionEntity() when $default != null:
return $default(_that.id,_that.storeName,_that.storeColor1,_that.storeColor2,_that.itemCount,_that.total,_that.status,_that.dateLabel,_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String storeName,  Color storeColor1,  Color storeColor2,  int itemCount,  int total,  TxStatus status,  String dateLabel,  String? orderId)  $default,) {final _that = this;
switch (_that) {
case _CustomerTransactionEntity():
return $default(_that.id,_that.storeName,_that.storeColor1,_that.storeColor2,_that.itemCount,_that.total,_that.status,_that.dateLabel,_that.orderId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String storeName,  Color storeColor1,  Color storeColor2,  int itemCount,  int total,  TxStatus status,  String dateLabel,  String? orderId)?  $default,) {final _that = this;
switch (_that) {
case _CustomerTransactionEntity() when $default != null:
return $default(_that.id,_that.storeName,_that.storeColor1,_that.storeColor2,_that.itemCount,_that.total,_that.status,_that.dateLabel,_that.orderId);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerTransactionEntity implements CustomerTransactionEntity {
  const _CustomerTransactionEntity({required this.id, required this.storeName, required this.storeColor1, required this.storeColor2, required this.itemCount, required this.total, required this.status, required this.dateLabel, this.orderId});
  

@override final  String id;
@override final  String storeName;
@override final  Color storeColor1;
@override final  Color storeColor2;
@override final  int itemCount;
@override final  int total;
@override final  TxStatus status;
@override final  String dateLabel;
@override final  String? orderId;

/// Create a copy of CustomerTransactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerTransactionEntityCopyWith<_CustomerTransactionEntity> get copyWith => __$CustomerTransactionEntityCopyWithImpl<_CustomerTransactionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerTransactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.storeColor1, storeColor1) || other.storeColor1 == storeColor1)&&(identical(other.storeColor2, storeColor2) || other.storeColor2 == storeColor2)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,id,storeName,storeColor1,storeColor2,itemCount,total,status,dateLabel,orderId);

@override
String toString() {
  return 'CustomerTransactionEntity(id: $id, storeName: $storeName, storeColor1: $storeColor1, storeColor2: $storeColor2, itemCount: $itemCount, total: $total, status: $status, dateLabel: $dateLabel, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$CustomerTransactionEntityCopyWith<$Res> implements $CustomerTransactionEntityCopyWith<$Res> {
  factory _$CustomerTransactionEntityCopyWith(_CustomerTransactionEntity value, $Res Function(_CustomerTransactionEntity) _then) = __$CustomerTransactionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String storeName, Color storeColor1, Color storeColor2, int itemCount, int total, TxStatus status, String dateLabel, String? orderId
});




}
/// @nodoc
class __$CustomerTransactionEntityCopyWithImpl<$Res>
    implements _$CustomerTransactionEntityCopyWith<$Res> {
  __$CustomerTransactionEntityCopyWithImpl(this._self, this._then);

  final _CustomerTransactionEntity _self;
  final $Res Function(_CustomerTransactionEntity) _then;

/// Create a copy of CustomerTransactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? storeName = null,Object? storeColor1 = null,Object? storeColor2 = null,Object? itemCount = null,Object? total = null,Object? status = null,Object? dateLabel = null,Object? orderId = freezed,}) {
  return _then(_CustomerTransactionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,storeColor1: null == storeColor1 ? _self.storeColor1 : storeColor1 // ignore: cast_nullable_to_non_nullable
as Color,storeColor2: null == storeColor2 ? _self.storeColor2 : storeColor2 // ignore: cast_nullable_to_non_nullable
as Color,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TxStatus,dateLabel: null == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
as String,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
