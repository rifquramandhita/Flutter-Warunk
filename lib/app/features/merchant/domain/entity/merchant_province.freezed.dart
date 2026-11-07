// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_province.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantProvince _$MerchantProvinceFromJson(
  Map<String, dynamic> json
) {
    return MerchantProvinceEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantProvince {

 int get id; String get code; String get name;
/// Create a copy of MerchantProvince
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantProvinceCopyWith<MerchantProvince> get copyWith => _$MerchantProvinceCopyWithImpl<MerchantProvince>(this as MerchantProvince, _$identity);

  /// Serializes this MerchantProvince to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantProvince&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name);

@override
String toString() {
  return 'MerchantProvince(id: $id, code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class $MerchantProvinceCopyWith<$Res>  {
  factory $MerchantProvinceCopyWith(MerchantProvince value, $Res Function(MerchantProvince) _then) = _$MerchantProvinceCopyWithImpl;
@useResult
$Res call({
 int id, String code, String name
});




}
/// @nodoc
class _$MerchantProvinceCopyWithImpl<$Res>
    implements $MerchantProvinceCopyWith<$Res> {
  _$MerchantProvinceCopyWithImpl(this._self, this._then);

  final MerchantProvince _self;
  final $Res Function(MerchantProvince) _then;

/// Create a copy of MerchantProvince
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantProvince].
extension MerchantProvincePatterns on MerchantProvince {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantProvinceEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantProvinceEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantProvinceEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantProvinceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantProvinceEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantProvinceEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String code,  String name)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantProvinceEntity() when entity != null:
return entity(_that.id,_that.code,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String code,  String name)  entity,}) {final _that = this;
switch (_that) {
case MerchantProvinceEntity():
return entity(_that.id,_that.code,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String code,  String name)?  entity,}) {final _that = this;
switch (_that) {
case MerchantProvinceEntity() when entity != null:
return entity(_that.id,_that.code,_that.name);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantProvinceEntity implements MerchantProvince {
  const MerchantProvinceEntity({required this.id, required this.code, required this.name});
  factory MerchantProvinceEntity.fromJson(Map<String, dynamic> json) => _$MerchantProvinceEntityFromJson(json);

@override final  int id;
@override final  String code;
@override final  String name;

/// Create a copy of MerchantProvince
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantProvinceEntityCopyWith<MerchantProvinceEntity> get copyWith => _$MerchantProvinceEntityCopyWithImpl<MerchantProvinceEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantProvinceEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantProvinceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name);

@override
String toString() {
  return 'MerchantProvince.entity(id: $id, code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class $MerchantProvinceEntityCopyWith<$Res> implements $MerchantProvinceCopyWith<$Res> {
  factory $MerchantProvinceEntityCopyWith(MerchantProvinceEntity value, $Res Function(MerchantProvinceEntity) _then) = _$MerchantProvinceEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String name
});




}
/// @nodoc
class _$MerchantProvinceEntityCopyWithImpl<$Res>
    implements $MerchantProvinceEntityCopyWith<$Res> {
  _$MerchantProvinceEntityCopyWithImpl(this._self, this._then);

  final MerchantProvinceEntity _self;
  final $Res Function(MerchantProvinceEntity) _then;

/// Create a copy of MerchantProvince
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,}) {
  return _then(MerchantProvinceEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
