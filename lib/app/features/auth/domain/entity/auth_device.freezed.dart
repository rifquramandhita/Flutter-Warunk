// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AuthDevice _$AuthDeviceFromJson(
  Map<String, dynamic> json
) {
    return AuthDeviceEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$AuthDevice {

 String get brand; String get model; String get os;
/// Create a copy of AuthDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthDeviceCopyWith<AuthDevice> get copyWith => _$AuthDeviceCopyWithImpl<AuthDevice>(this as AuthDevice, _$identity);

  /// Serializes this AuthDevice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthDevice&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.os, os) || other.os == os));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brand,model,os);

@override
String toString() {
  return 'AuthDevice(brand: $brand, model: $model, os: $os)';
}


}

/// @nodoc
abstract mixin class $AuthDeviceCopyWith<$Res>  {
  factory $AuthDeviceCopyWith(AuthDevice value, $Res Function(AuthDevice) _then) = _$AuthDeviceCopyWithImpl;
@useResult
$Res call({
 String brand, String model, String os
});




}
/// @nodoc
class _$AuthDeviceCopyWithImpl<$Res>
    implements $AuthDeviceCopyWith<$Res> {
  _$AuthDeviceCopyWithImpl(this._self, this._then);

  final AuthDevice _self;
  final $Res Function(AuthDevice) _then;

/// Create a copy of AuthDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brand = null,Object? model = null,Object? os = null,}) {
  return _then(_self.copyWith(
brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,os: null == os ? _self.os : os // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthDevice].
extension AuthDevicePatterns on AuthDevice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthDeviceEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthDeviceEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthDeviceEntity value)  entity,}){
final _that = this;
switch (_that) {
case AuthDeviceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthDeviceEntity value)?  entity,}){
final _that = this;
switch (_that) {
case AuthDeviceEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String brand,  String model,  String os)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthDeviceEntity() when entity != null:
return entity(_that.brand,_that.model,_that.os);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String brand,  String model,  String os)  entity,}) {final _that = this;
switch (_that) {
case AuthDeviceEntity():
return entity(_that.brand,_that.model,_that.os);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String brand,  String model,  String os)?  entity,}) {final _that = this;
switch (_that) {
case AuthDeviceEntity() when entity != null:
return entity(_that.brand,_that.model,_that.os);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthDeviceEntity implements AuthDevice {
  const AuthDeviceEntity({required this.brand, required this.model, required this.os});
  factory AuthDeviceEntity.fromJson(Map<String, dynamic> json) => _$AuthDeviceEntityFromJson(json);

@override final  String brand;
@override final  String model;
@override final  String os;

/// Create a copy of AuthDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthDeviceEntityCopyWith<AuthDeviceEntity> get copyWith => _$AuthDeviceEntityCopyWithImpl<AuthDeviceEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthDeviceEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthDeviceEntity&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.os, os) || other.os == os));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brand,model,os);

@override
String toString() {
  return 'AuthDevice.entity(brand: $brand, model: $model, os: $os)';
}


}

/// @nodoc
abstract mixin class $AuthDeviceEntityCopyWith<$Res> implements $AuthDeviceCopyWith<$Res> {
  factory $AuthDeviceEntityCopyWith(AuthDeviceEntity value, $Res Function(AuthDeviceEntity) _then) = _$AuthDeviceEntityCopyWithImpl;
@override @useResult
$Res call({
 String brand, String model, String os
});




}
/// @nodoc
class _$AuthDeviceEntityCopyWithImpl<$Res>
    implements $AuthDeviceEntityCopyWith<$Res> {
  _$AuthDeviceEntityCopyWithImpl(this._self, this._then);

  final AuthDeviceEntity _self;
  final $Res Function(AuthDeviceEntity) _then;

/// Create a copy of AuthDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? brand = null,Object? model = null,Object? os = null,}) {
  return _then(AuthDeviceEntity(
brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,os: null == os ? _self.os : os // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
