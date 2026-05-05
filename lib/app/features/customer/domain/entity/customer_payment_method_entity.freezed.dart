// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_payment_method_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerPaymentMethodEntity {

 String get name; String get subtitle; int get colorValue; int get iconCodePoint;
/// Create a copy of CustomerPaymentMethodEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerPaymentMethodEntityCopyWith<CustomerPaymentMethodEntity> get copyWith => _$CustomerPaymentMethodEntityCopyWithImpl<CustomerPaymentMethodEntity>(this as CustomerPaymentMethodEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerPaymentMethodEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint));
}


@override
int get hashCode => Object.hash(runtimeType,name,subtitle,colorValue,iconCodePoint);

@override
String toString() {
  return 'CustomerPaymentMethodEntity(name: $name, subtitle: $subtitle, colorValue: $colorValue, iconCodePoint: $iconCodePoint)';
}


}

/// @nodoc
abstract mixin class $CustomerPaymentMethodEntityCopyWith<$Res>  {
  factory $CustomerPaymentMethodEntityCopyWith(CustomerPaymentMethodEntity value, $Res Function(CustomerPaymentMethodEntity) _then) = _$CustomerPaymentMethodEntityCopyWithImpl;
@useResult
$Res call({
 String name, String subtitle, int colorValue, int iconCodePoint
});




}
/// @nodoc
class _$CustomerPaymentMethodEntityCopyWithImpl<$Res>
    implements $CustomerPaymentMethodEntityCopyWith<$Res> {
  _$CustomerPaymentMethodEntityCopyWithImpl(this._self, this._then);

  final CustomerPaymentMethodEntity _self;
  final $Res Function(CustomerPaymentMethodEntity) _then;

/// Create a copy of CustomerPaymentMethodEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? subtitle = null,Object? colorValue = null,Object? iconCodePoint = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,iconCodePoint: null == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerPaymentMethodEntity].
extension CustomerPaymentMethodEntityPatterns on CustomerPaymentMethodEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerPaymentMethodEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerPaymentMethodEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerPaymentMethodEntity value)  $default,){
final _that = this;
switch (_that) {
case _CustomerPaymentMethodEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerPaymentMethodEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerPaymentMethodEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String subtitle,  int colorValue,  int iconCodePoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerPaymentMethodEntity() when $default != null:
return $default(_that.name,_that.subtitle,_that.colorValue,_that.iconCodePoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String subtitle,  int colorValue,  int iconCodePoint)  $default,) {final _that = this;
switch (_that) {
case _CustomerPaymentMethodEntity():
return $default(_that.name,_that.subtitle,_that.colorValue,_that.iconCodePoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String subtitle,  int colorValue,  int iconCodePoint)?  $default,) {final _that = this;
switch (_that) {
case _CustomerPaymentMethodEntity() when $default != null:
return $default(_that.name,_that.subtitle,_that.colorValue,_that.iconCodePoint);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerPaymentMethodEntity implements CustomerPaymentMethodEntity {
  const _CustomerPaymentMethodEntity({required this.name, required this.subtitle, required this.colorValue, required this.iconCodePoint});
  

@override final  String name;
@override final  String subtitle;
@override final  int colorValue;
@override final  int iconCodePoint;

/// Create a copy of CustomerPaymentMethodEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerPaymentMethodEntityCopyWith<_CustomerPaymentMethodEntity> get copyWith => __$CustomerPaymentMethodEntityCopyWithImpl<_CustomerPaymentMethodEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerPaymentMethodEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint));
}


@override
int get hashCode => Object.hash(runtimeType,name,subtitle,colorValue,iconCodePoint);

@override
String toString() {
  return 'CustomerPaymentMethodEntity(name: $name, subtitle: $subtitle, colorValue: $colorValue, iconCodePoint: $iconCodePoint)';
}


}

/// @nodoc
abstract mixin class _$CustomerPaymentMethodEntityCopyWith<$Res> implements $CustomerPaymentMethodEntityCopyWith<$Res> {
  factory _$CustomerPaymentMethodEntityCopyWith(_CustomerPaymentMethodEntity value, $Res Function(_CustomerPaymentMethodEntity) _then) = __$CustomerPaymentMethodEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String subtitle, int colorValue, int iconCodePoint
});




}
/// @nodoc
class __$CustomerPaymentMethodEntityCopyWithImpl<$Res>
    implements _$CustomerPaymentMethodEntityCopyWith<$Res> {
  __$CustomerPaymentMethodEntityCopyWithImpl(this._self, this._then);

  final _CustomerPaymentMethodEntity _self;
  final $Res Function(_CustomerPaymentMethodEntity) _then;

/// Create a copy of CustomerPaymentMethodEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? subtitle = null,Object? colorValue = null,Object? iconCodePoint = null,}) {
  return _then(_CustomerPaymentMethodEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,iconCodePoint: null == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
