// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_location_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerLocationPosition {

 double get latitude; double get longitude;
/// Create a copy of CustomerLocationPosition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerLocationPositionCopyWith<CustomerLocationPosition> get copyWith => _$CustomerLocationPositionCopyWithImpl<CustomerLocationPosition>(this as CustomerLocationPosition, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerLocationPosition&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'CustomerLocationPosition(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $CustomerLocationPositionCopyWith<$Res>  {
  factory $CustomerLocationPositionCopyWith(CustomerLocationPosition value, $Res Function(CustomerLocationPosition) _then) = _$CustomerLocationPositionCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class _$CustomerLocationPositionCopyWithImpl<$Res>
    implements $CustomerLocationPositionCopyWith<$Res> {
  _$CustomerLocationPositionCopyWithImpl(this._self, this._then);

  final CustomerLocationPosition _self;
  final $Res Function(CustomerLocationPosition) _then;

/// Create a copy of CustomerLocationPosition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerLocationPosition].
extension CustomerLocationPositionPatterns on CustomerLocationPosition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerLocationPositionEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerLocationPositionEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerLocationPositionEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerLocationPositionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerLocationPositionEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerLocationPositionEntity() when entity != null:
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
case CustomerLocationPositionEntity() when entity != null:
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
case CustomerLocationPositionEntity():
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
case CustomerLocationPositionEntity() when entity != null:
return entity(_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class CustomerLocationPositionEntity implements CustomerLocationPosition {
  const CustomerLocationPositionEntity({required this.latitude, required this.longitude});
  

@override final  double latitude;
@override final  double longitude;

/// Create a copy of CustomerLocationPosition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerLocationPositionEntityCopyWith<CustomerLocationPositionEntity> get copyWith => _$CustomerLocationPositionEntityCopyWithImpl<CustomerLocationPositionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerLocationPositionEntity&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'CustomerLocationPosition.entity(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $CustomerLocationPositionEntityCopyWith<$Res> implements $CustomerLocationPositionCopyWith<$Res> {
  factory $CustomerLocationPositionEntityCopyWith(CustomerLocationPositionEntity value, $Res Function(CustomerLocationPositionEntity) _then) = _$CustomerLocationPositionEntityCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class _$CustomerLocationPositionEntityCopyWithImpl<$Res>
    implements $CustomerLocationPositionEntityCopyWith<$Res> {
  _$CustomerLocationPositionEntityCopyWithImpl(this._self, this._then);

  final CustomerLocationPositionEntity _self;
  final $Res Function(CustomerLocationPositionEntity) _then;

/// Create a copy of CustomerLocationPosition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(CustomerLocationPositionEntity(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
