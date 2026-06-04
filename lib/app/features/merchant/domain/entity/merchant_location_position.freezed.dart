// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_location_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MerchantLocationPosition {

 double get latitude; double get longitude;
/// Create a copy of MerchantLocationPosition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantLocationPositionCopyWith<MerchantLocationPosition> get copyWith => _$MerchantLocationPositionCopyWithImpl<MerchantLocationPosition>(this as MerchantLocationPosition, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantLocationPosition&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'MerchantLocationPosition(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $MerchantLocationPositionCopyWith<$Res>  {
  factory $MerchantLocationPositionCopyWith(MerchantLocationPosition value, $Res Function(MerchantLocationPosition) _then) = _$MerchantLocationPositionCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class _$MerchantLocationPositionCopyWithImpl<$Res>
    implements $MerchantLocationPositionCopyWith<$Res> {
  _$MerchantLocationPositionCopyWithImpl(this._self, this._then);

  final MerchantLocationPosition _self;
  final $Res Function(MerchantLocationPosition) _then;

/// Create a copy of MerchantLocationPosition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantLocationPosition].
extension MerchantLocationPositionPatterns on MerchantLocationPosition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantLocationPositionEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantLocationPositionEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantLocationPositionEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantLocationPositionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantLocationPositionEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantLocationPositionEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( double latitude,  double longitude)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantLocationPositionEntity() when entity != null:
return entity(_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( double latitude,  double longitude)  entity,}) {final _that = this;
switch (_that) {
case MerchantLocationPositionEntity():
return entity(_that.latitude,_that.longitude);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( double latitude,  double longitude)?  entity,}) {final _that = this;
switch (_that) {
case MerchantLocationPositionEntity() when entity != null:
return entity(_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class MerchantLocationPositionEntity implements MerchantLocationPosition {
  const MerchantLocationPositionEntity({required this.latitude, required this.longitude});
  

@override final  double latitude;
@override final  double longitude;

/// Create a copy of MerchantLocationPosition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantLocationPositionEntityCopyWith<MerchantLocationPositionEntity> get copyWith => _$MerchantLocationPositionEntityCopyWithImpl<MerchantLocationPositionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantLocationPositionEntity&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'MerchantLocationPosition.entity(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $MerchantLocationPositionEntityCopyWith<$Res> implements $MerchantLocationPositionCopyWith<$Res> {
  factory $MerchantLocationPositionEntityCopyWith(MerchantLocationPositionEntity value, $Res Function(MerchantLocationPositionEntity) _then) = _$MerchantLocationPositionEntityCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class _$MerchantLocationPositionEntityCopyWithImpl<$Res>
    implements $MerchantLocationPositionEntityCopyWith<$Res> {
  _$MerchantLocationPositionEntityCopyWithImpl(this._self, this._then);

  final MerchantLocationPositionEntity _self;
  final $Res Function(MerchantLocationPositionEntity) _then;

/// Create a copy of MerchantLocationPosition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(MerchantLocationPositionEntity(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
