// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_promotion_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantPromotionAssignment _$MerchantPromotionAssignmentFromJson(
  Map<String, dynamic> json
) {
    return MerchantPromotionAssignmentEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantPromotionAssignment {

 String get id; String get merchantId; String get merchantName; DateTime get datetimeStart; DateTime get datetimeEnd;
/// Create a copy of MerchantPromotionAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantPromotionAssignmentCopyWith<MerchantPromotionAssignment> get copyWith => _$MerchantPromotionAssignmentCopyWithImpl<MerchantPromotionAssignment>(this as MerchantPromotionAssignment, _$identity);

  /// Serializes this MerchantPromotionAssignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.merchantName, merchantName) || other.merchantName == merchantName)&&(identical(other.datetimeStart, datetimeStart) || other.datetimeStart == datetimeStart)&&(identical(other.datetimeEnd, datetimeEnd) || other.datetimeEnd == datetimeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,merchantId,merchantName,datetimeStart,datetimeEnd);

@override
String toString() {
  return 'MerchantPromotionAssignment(id: $id, merchantId: $merchantId, merchantName: $merchantName, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd)';
}


}

/// @nodoc
abstract mixin class $MerchantPromotionAssignmentCopyWith<$Res>  {
  factory $MerchantPromotionAssignmentCopyWith(MerchantPromotionAssignment value, $Res Function(MerchantPromotionAssignment) _then) = _$MerchantPromotionAssignmentCopyWithImpl;
@useResult
$Res call({
 String id, String merchantId, String merchantName, DateTime datetimeStart, DateTime datetimeEnd
});




}
/// @nodoc
class _$MerchantPromotionAssignmentCopyWithImpl<$Res>
    implements $MerchantPromotionAssignmentCopyWith<$Res> {
  _$MerchantPromotionAssignmentCopyWithImpl(this._self, this._then);

  final MerchantPromotionAssignment _self;
  final $Res Function(MerchantPromotionAssignment) _then;

/// Create a copy of MerchantPromotionAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? merchantId = null,Object? merchantName = null,Object? datetimeStart = null,Object? datetimeEnd = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,merchantName: null == merchantName ? _self.merchantName : merchantName // ignore: cast_nullable_to_non_nullable
as String,datetimeStart: null == datetimeStart ? _self.datetimeStart : datetimeStart // ignore: cast_nullable_to_non_nullable
as DateTime,datetimeEnd: null == datetimeEnd ? _self.datetimeEnd : datetimeEnd // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantPromotionAssignment].
extension MerchantPromotionAssignmentPatterns on MerchantPromotionAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantPromotionAssignmentEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantPromotionAssignmentEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantPromotionAssignmentEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String merchantId,  String merchantName,  DateTime datetimeStart,  DateTime datetimeEnd)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity() when entity != null:
return entity(_that.id,_that.merchantId,_that.merchantName,_that.datetimeStart,_that.datetimeEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String merchantId,  String merchantName,  DateTime datetimeStart,  DateTime datetimeEnd)  entity,}) {final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity():
return entity(_that.id,_that.merchantId,_that.merchantName,_that.datetimeStart,_that.datetimeEnd);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String merchantId,  String merchantName,  DateTime datetimeStart,  DateTime datetimeEnd)?  entity,}) {final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity() when entity != null:
return entity(_that.id,_that.merchantId,_that.merchantName,_that.datetimeStart,_that.datetimeEnd);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantPromotionAssignmentEntity implements MerchantPromotionAssignment {
  const MerchantPromotionAssignmentEntity({required this.id, required this.merchantId, required this.merchantName, required this.datetimeStart, required this.datetimeEnd});
  factory MerchantPromotionAssignmentEntity.fromJson(Map<String, dynamic> json) => _$MerchantPromotionAssignmentEntityFromJson(json);

@override final  String id;
@override final  String merchantId;
@override final  String merchantName;
@override final  DateTime datetimeStart;
@override final  DateTime datetimeEnd;

/// Create a copy of MerchantPromotionAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantPromotionAssignmentEntityCopyWith<MerchantPromotionAssignmentEntity> get copyWith => _$MerchantPromotionAssignmentEntityCopyWithImpl<MerchantPromotionAssignmentEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantPromotionAssignmentEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionAssignmentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.merchantName, merchantName) || other.merchantName == merchantName)&&(identical(other.datetimeStart, datetimeStart) || other.datetimeStart == datetimeStart)&&(identical(other.datetimeEnd, datetimeEnd) || other.datetimeEnd == datetimeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,merchantId,merchantName,datetimeStart,datetimeEnd);

@override
String toString() {
  return 'MerchantPromotionAssignment.entity(id: $id, merchantId: $merchantId, merchantName: $merchantName, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd)';
}


}

/// @nodoc
abstract mixin class $MerchantPromotionAssignmentEntityCopyWith<$Res> implements $MerchantPromotionAssignmentCopyWith<$Res> {
  factory $MerchantPromotionAssignmentEntityCopyWith(MerchantPromotionAssignmentEntity value, $Res Function(MerchantPromotionAssignmentEntity) _then) = _$MerchantPromotionAssignmentEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String merchantId, String merchantName, DateTime datetimeStart, DateTime datetimeEnd
});




}
/// @nodoc
class _$MerchantPromotionAssignmentEntityCopyWithImpl<$Res>
    implements $MerchantPromotionAssignmentEntityCopyWith<$Res> {
  _$MerchantPromotionAssignmentEntityCopyWithImpl(this._self, this._then);

  final MerchantPromotionAssignmentEntity _self;
  final $Res Function(MerchantPromotionAssignmentEntity) _then;

/// Create a copy of MerchantPromotionAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? merchantId = null,Object? merchantName = null,Object? datetimeStart = null,Object? datetimeEnd = null,}) {
  return _then(MerchantPromotionAssignmentEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,merchantName: null == merchantName ? _self.merchantName : merchantName // ignore: cast_nullable_to_non_nullable
as String,datetimeStart: null == datetimeStart ? _self.datetimeStart : datetimeStart // ignore: cast_nullable_to_non_nullable
as DateTime,datetimeEnd: null == datetimeEnd ? _self.datetimeEnd : datetimeEnd // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
