// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_cart_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerCartItemEntity {

 String get name; String get subtitle; int get unitPrice; IconData get icon; Color get color; int get qty;
/// Create a copy of CustomerCartItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCartItemEntityCopyWith<CustomerCartItemEntity> get copyWith => _$CustomerCartItemEntityCopyWithImpl<CustomerCartItemEntity>(this as CustomerCartItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCartItemEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.color, color) || other.color == color)&&(identical(other.qty, qty) || other.qty == qty));
}


@override
int get hashCode => Object.hash(runtimeType,name,subtitle,unitPrice,icon,color,qty);

@override
String toString() {
  return 'CustomerCartItemEntity(name: $name, subtitle: $subtitle, unitPrice: $unitPrice, icon: $icon, color: $color, qty: $qty)';
}


}

/// @nodoc
abstract mixin class $CustomerCartItemEntityCopyWith<$Res>  {
  factory $CustomerCartItemEntityCopyWith(CustomerCartItemEntity value, $Res Function(CustomerCartItemEntity) _then) = _$CustomerCartItemEntityCopyWithImpl;
@useResult
$Res call({
 String name, String subtitle, int unitPrice, IconData icon, Color color, int qty
});




}
/// @nodoc
class _$CustomerCartItemEntityCopyWithImpl<$Res>
    implements $CustomerCartItemEntityCopyWith<$Res> {
  _$CustomerCartItemEntityCopyWithImpl(this._self, this._then);

  final CustomerCartItemEntity _self;
  final $Res Function(CustomerCartItemEntity) _then;

/// Create a copy of CustomerCartItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? subtitle = null,Object? unitPrice = null,Object? icon = null,Object? color = null,Object? qty = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerCartItemEntity].
extension CustomerCartItemEntityPatterns on CustomerCartItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerCartItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerCartItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerCartItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _CustomerCartItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerCartItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerCartItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String subtitle,  int unitPrice,  IconData icon,  Color color,  int qty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerCartItemEntity() when $default != null:
return $default(_that.name,_that.subtitle,_that.unitPrice,_that.icon,_that.color,_that.qty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String subtitle,  int unitPrice,  IconData icon,  Color color,  int qty)  $default,) {final _that = this;
switch (_that) {
case _CustomerCartItemEntity():
return $default(_that.name,_that.subtitle,_that.unitPrice,_that.icon,_that.color,_that.qty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String subtitle,  int unitPrice,  IconData icon,  Color color,  int qty)?  $default,) {final _that = this;
switch (_that) {
case _CustomerCartItemEntity() when $default != null:
return $default(_that.name,_that.subtitle,_that.unitPrice,_that.icon,_that.color,_that.qty);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerCartItemEntity implements CustomerCartItemEntity {
  const _CustomerCartItemEntity({required this.name, required this.subtitle, required this.unitPrice, required this.icon, required this.color, required this.qty});
  

@override final  String name;
@override final  String subtitle;
@override final  int unitPrice;
@override final  IconData icon;
@override final  Color color;
@override final  int qty;

/// Create a copy of CustomerCartItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerCartItemEntityCopyWith<_CustomerCartItemEntity> get copyWith => __$CustomerCartItemEntityCopyWithImpl<_CustomerCartItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerCartItemEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.color, color) || other.color == color)&&(identical(other.qty, qty) || other.qty == qty));
}


@override
int get hashCode => Object.hash(runtimeType,name,subtitle,unitPrice,icon,color,qty);

@override
String toString() {
  return 'CustomerCartItemEntity(name: $name, subtitle: $subtitle, unitPrice: $unitPrice, icon: $icon, color: $color, qty: $qty)';
}


}

/// @nodoc
abstract mixin class _$CustomerCartItemEntityCopyWith<$Res> implements $CustomerCartItemEntityCopyWith<$Res> {
  factory _$CustomerCartItemEntityCopyWith(_CustomerCartItemEntity value, $Res Function(_CustomerCartItemEntity) _then) = __$CustomerCartItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String subtitle, int unitPrice, IconData icon, Color color, int qty
});




}
/// @nodoc
class __$CustomerCartItemEntityCopyWithImpl<$Res>
    implements _$CustomerCartItemEntityCopyWith<$Res> {
  __$CustomerCartItemEntityCopyWithImpl(this._self, this._then);

  final _CustomerCartItemEntity _self;
  final $Res Function(_CustomerCartItemEntity) _then;

/// Create a copy of CustomerCartItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? subtitle = null,Object? unitPrice = null,Object? icon = null,Object? color = null,Object? qty = null,}) {
  return _then(_CustomerCartItemEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
