// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_regency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantRegency _$MerchantRegencyFromJson(
  Map<String, dynamic> json
) {
    return MerchantRegencyEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantRegency {

 int get id; int get provinceId; String get code; String get name; String? get type;
/// Create a copy of MerchantRegency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantRegencyCopyWith<MerchantRegency> get copyWith => _$MerchantRegencyCopyWithImpl<MerchantRegency>(this as MerchantRegency, _$identity);

  /// Serializes this MerchantRegency to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantRegency&&(identical(other.id, id) || other.id == id)&&(identical(other.provinceId, provinceId) || other.provinceId == provinceId)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,provinceId,code,name,type);

@override
String toString() {
  return 'MerchantRegency(id: $id, provinceId: $provinceId, code: $code, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $MerchantRegencyCopyWith<$Res>  {
  factory $MerchantRegencyCopyWith(MerchantRegency value, $Res Function(MerchantRegency) _then) = _$MerchantRegencyCopyWithImpl;
@useResult
$Res call({
 int id, int provinceId, String code, String name, String? type
});




}
/// @nodoc
class _$MerchantRegencyCopyWithImpl<$Res>
    implements $MerchantRegencyCopyWith<$Res> {
  _$MerchantRegencyCopyWithImpl(this._self, this._then);

  final MerchantRegency _self;
  final $Res Function(MerchantRegency) _then;

/// Create a copy of MerchantRegency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? provinceId = null,Object? code = null,Object? name = null,Object? type = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,provinceId: null == provinceId ? _self.provinceId : provinceId // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantRegency].
extension MerchantRegencyPatterns on MerchantRegency {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantRegencyEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantRegencyEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantRegencyEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantRegencyEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantRegencyEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantRegencyEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  int provinceId,  String code,  String name,  String? type)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantRegencyEntity() when entity != null:
return entity(_that.id,_that.provinceId,_that.code,_that.name,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  int provinceId,  String code,  String name,  String? type)  entity,}) {final _that = this;
switch (_that) {
case MerchantRegencyEntity():
return entity(_that.id,_that.provinceId,_that.code,_that.name,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  int provinceId,  String code,  String name,  String? type)?  entity,}) {final _that = this;
switch (_that) {
case MerchantRegencyEntity() when entity != null:
return entity(_that.id,_that.provinceId,_that.code,_that.name,_that.type);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantRegencyEntity implements MerchantRegency {
  const MerchantRegencyEntity({required this.id, required this.provinceId, required this.code, required this.name, this.type});
  factory MerchantRegencyEntity.fromJson(Map<String, dynamic> json) => _$MerchantRegencyEntityFromJson(json);

@override final  int id;
@override final  int provinceId;
@override final  String code;
@override final  String name;
@override final  String? type;

/// Create a copy of MerchantRegency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantRegencyEntityCopyWith<MerchantRegencyEntity> get copyWith => _$MerchantRegencyEntityCopyWithImpl<MerchantRegencyEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantRegencyEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantRegencyEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.provinceId, provinceId) || other.provinceId == provinceId)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,provinceId,code,name,type);

@override
String toString() {
  return 'MerchantRegency.entity(id: $id, provinceId: $provinceId, code: $code, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $MerchantRegencyEntityCopyWith<$Res> implements $MerchantRegencyCopyWith<$Res> {
  factory $MerchantRegencyEntityCopyWith(MerchantRegencyEntity value, $Res Function(MerchantRegencyEntity) _then) = _$MerchantRegencyEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int provinceId, String code, String name, String? type
});




}
/// @nodoc
class _$MerchantRegencyEntityCopyWithImpl<$Res>
    implements $MerchantRegencyEntityCopyWith<$Res> {
  _$MerchantRegencyEntityCopyWithImpl(this._self, this._then);

  final MerchantRegencyEntity _self;
  final $Res Function(MerchantRegencyEntity) _then;

/// Create a copy of MerchantRegency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? provinceId = null,Object? code = null,Object? name = null,Object? type = freezed,}) {
  return _then(MerchantRegencyEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,provinceId: null == provinceId ? _self.provinceId : provinceId // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
