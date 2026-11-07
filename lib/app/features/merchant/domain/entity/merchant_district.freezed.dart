// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantDistrict _$MerchantDistrictFromJson(
  Map<String, dynamic> json
) {
    return MerchantDistrictEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantDistrict {

 int get id; int get regencyId; String get code; String get name;
/// Create a copy of MerchantDistrict
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDistrictCopyWith<MerchantDistrict> get copyWith => _$MerchantDistrictCopyWithImpl<MerchantDistrict>(this as MerchantDistrict, _$identity);

  /// Serializes this MerchantDistrict to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDistrict&&(identical(other.id, id) || other.id == id)&&(identical(other.regencyId, regencyId) || other.regencyId == regencyId)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,regencyId,code,name);

@override
String toString() {
  return 'MerchantDistrict(id: $id, regencyId: $regencyId, code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class $MerchantDistrictCopyWith<$Res>  {
  factory $MerchantDistrictCopyWith(MerchantDistrict value, $Res Function(MerchantDistrict) _then) = _$MerchantDistrictCopyWithImpl;
@useResult
$Res call({
 int id, int regencyId, String code, String name
});




}
/// @nodoc
class _$MerchantDistrictCopyWithImpl<$Res>
    implements $MerchantDistrictCopyWith<$Res> {
  _$MerchantDistrictCopyWithImpl(this._self, this._then);

  final MerchantDistrict _self;
  final $Res Function(MerchantDistrict) _then;

/// Create a copy of MerchantDistrict
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? regencyId = null,Object? code = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,regencyId: null == regencyId ? _self.regencyId : regencyId // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantDistrict].
extension MerchantDistrictPatterns on MerchantDistrict {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantDistrictEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantDistrictEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantDistrictEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantDistrictEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantDistrictEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantDistrictEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  int regencyId,  String code,  String name)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantDistrictEntity() when entity != null:
return entity(_that.id,_that.regencyId,_that.code,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  int regencyId,  String code,  String name)  entity,}) {final _that = this;
switch (_that) {
case MerchantDistrictEntity():
return entity(_that.id,_that.regencyId,_that.code,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  int regencyId,  String code,  String name)?  entity,}) {final _that = this;
switch (_that) {
case MerchantDistrictEntity() when entity != null:
return entity(_that.id,_that.regencyId,_that.code,_that.name);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantDistrictEntity implements MerchantDistrict {
  const MerchantDistrictEntity({required this.id, required this.regencyId, required this.code, required this.name});
  factory MerchantDistrictEntity.fromJson(Map<String, dynamic> json) => _$MerchantDistrictEntityFromJson(json);

@override final  int id;
@override final  int regencyId;
@override final  String code;
@override final  String name;

/// Create a copy of MerchantDistrict
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDistrictEntityCopyWith<MerchantDistrictEntity> get copyWith => _$MerchantDistrictEntityCopyWithImpl<MerchantDistrictEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantDistrictEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDistrictEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.regencyId, regencyId) || other.regencyId == regencyId)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,regencyId,code,name);

@override
String toString() {
  return 'MerchantDistrict.entity(id: $id, regencyId: $regencyId, code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class $MerchantDistrictEntityCopyWith<$Res> implements $MerchantDistrictCopyWith<$Res> {
  factory $MerchantDistrictEntityCopyWith(MerchantDistrictEntity value, $Res Function(MerchantDistrictEntity) _then) = _$MerchantDistrictEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int regencyId, String code, String name
});




}
/// @nodoc
class _$MerchantDistrictEntityCopyWithImpl<$Res>
    implements $MerchantDistrictEntityCopyWith<$Res> {
  _$MerchantDistrictEntityCopyWithImpl(this._self, this._then);

  final MerchantDistrictEntity _self;
  final $Res Function(MerchantDistrictEntity) _then;

/// Create a copy of MerchantDistrict
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? regencyId = null,Object? code = null,Object? name = null,}) {
  return _then(MerchantDistrictEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,regencyId: null == regencyId ? _self.regencyId : regencyId // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
