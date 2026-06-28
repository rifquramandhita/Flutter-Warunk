// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_merchant_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerMerchantCategory _$CustomerMerchantCategoryFromJson(
  Map<String, dynamic> json
) {
    return CustomerMerchantCategoryEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerMerchantCategory {

 String get id; String get name; String get slug; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of CustomerMerchantCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantCategoryCopyWith<CustomerMerchantCategory> get copyWith => _$CustomerMerchantCategoryCopyWithImpl<CustomerMerchantCategory>(this as CustomerMerchantCategory, _$identity);

  /// Serializes this CustomerMerchantCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,createdAt,updatedAt);

@override
String toString() {
  return 'CustomerMerchantCategory(id: $id, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantCategoryCopyWith<$Res>  {
  factory $CustomerMerchantCategoryCopyWith(CustomerMerchantCategory value, $Res Function(CustomerMerchantCategory) _then) = _$CustomerMerchantCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CustomerMerchantCategoryCopyWithImpl<$Res>
    implements $CustomerMerchantCategoryCopyWith<$Res> {
  _$CustomerMerchantCategoryCopyWithImpl(this._self, this._then);

  final CustomerMerchantCategory _self;
  final $Res Function(CustomerMerchantCategory) _then;

/// Create a copy of CustomerMerchantCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerMerchantCategory].
extension CustomerMerchantCategoryPatterns on CustomerMerchantCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerMerchantCategoryEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerMerchantCategoryEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerMerchantCategoryEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantCategoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerMerchantCategoryEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantCategoryEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String slug,  DateTime? createdAt,  DateTime? updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerMerchantCategoryEntity() when entity != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String slug,  DateTime? createdAt,  DateTime? updatedAt)  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantCategoryEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String slug,  DateTime? createdAt,  DateTime? updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantCategoryEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerMerchantCategoryEntity implements CustomerMerchantCategory {
  const CustomerMerchantCategoryEntity({required this.id, required this.name, required this.slug, this.createdAt, this.updatedAt});
  factory CustomerMerchantCategoryEntity.fromJson(Map<String, dynamic> json) => _$CustomerMerchantCategoryEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of CustomerMerchantCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantCategoryEntityCopyWith<CustomerMerchantCategoryEntity> get copyWith => _$CustomerMerchantCategoryEntityCopyWithImpl<CustomerMerchantCategoryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerMerchantCategoryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantCategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,createdAt,updatedAt);

@override
String toString() {
  return 'CustomerMerchantCategory.entity(id: $id, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantCategoryEntityCopyWith<$Res> implements $CustomerMerchantCategoryCopyWith<$Res> {
  factory $CustomerMerchantCategoryEntityCopyWith(CustomerMerchantCategoryEntity value, $Res Function(CustomerMerchantCategoryEntity) _then) = _$CustomerMerchantCategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CustomerMerchantCategoryEntityCopyWithImpl<$Res>
    implements $CustomerMerchantCategoryEntityCopyWith<$Res> {
  _$CustomerMerchantCategoryEntityCopyWithImpl(this._self, this._then);

  final CustomerMerchantCategoryEntity _self;
  final $Res Function(CustomerMerchantCategoryEntity) _then;

/// Create a copy of CustomerMerchantCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(CustomerMerchantCategoryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
