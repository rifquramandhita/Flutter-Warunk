// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantCategory _$MerchantCategoryFromJson(
  Map<String, dynamic> json
) {
    return MerchantCategoryEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantCategory {

 String get id; String get name; String get slug; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of MerchantCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantCategoryCopyWith<MerchantCategory> get copyWith => _$MerchantCategoryCopyWithImpl<MerchantCategory>(this as MerchantCategory, _$identity);

  /// Serializes this MerchantCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,createdAt,updatedAt);

@override
String toString() {
  return 'MerchantCategory(id: $id, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantCategoryCopyWith<$Res>  {
  factory $MerchantCategoryCopyWith(MerchantCategory value, $Res Function(MerchantCategory) _then) = _$MerchantCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$MerchantCategoryCopyWithImpl<$Res>
    implements $MerchantCategoryCopyWith<$Res> {
  _$MerchantCategoryCopyWithImpl(this._self, this._then);

  final MerchantCategory _self;
  final $Res Function(MerchantCategory) _then;

/// Create a copy of MerchantCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantCategory].
extension MerchantCategoryPatterns on MerchantCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantCategoryEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantCategoryEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantCategoryEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantCategoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantCategoryEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantCategoryEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String slug,  DateTime createdAt,  DateTime updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantCategoryEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String slug,  DateTime createdAt,  DateTime updatedAt)  entity,}) {final _that = this;
switch (_that) {
case MerchantCategoryEntity():
return entity(_that.id,_that.name,_that.slug,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String slug,  DateTime createdAt,  DateTime updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case MerchantCategoryEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class MerchantCategoryEntity implements MerchantCategory {
  const MerchantCategoryEntity({required this.id, required this.name, required this.slug, required this.createdAt, required this.updatedAt});
  factory MerchantCategoryEntity.fromJson(Map<String, dynamic> json) => _$MerchantCategoryEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of MerchantCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantCategoryEntityCopyWith<MerchantCategoryEntity> get copyWith => _$MerchantCategoryEntityCopyWithImpl<MerchantCategoryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantCategoryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantCategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,createdAt,updatedAt);

@override
String toString() {
  return 'MerchantCategory.entity(id: $id, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantCategoryEntityCopyWith<$Res> implements $MerchantCategoryCopyWith<$Res> {
  factory $MerchantCategoryEntityCopyWith(MerchantCategoryEntity value, $Res Function(MerchantCategoryEntity) _then) = _$MerchantCategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$MerchantCategoryEntityCopyWithImpl<$Res>
    implements $MerchantCategoryEntityCopyWith<$Res> {
  _$MerchantCategoryEntityCopyWithImpl(this._self, this._then);

  final MerchantCategoryEntity _self;
  final $Res Function(MerchantCategoryEntity) _then;

/// Create a copy of MerchantCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(MerchantCategoryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
