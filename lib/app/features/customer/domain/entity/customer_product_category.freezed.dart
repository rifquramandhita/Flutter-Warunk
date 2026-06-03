// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_product_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerProductCategory _$CustomerProductCategoryFromJson(
  Map<String, dynamic> json
) {
    return CustomerProductCategoryEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerProductCategory {

 String get id; String get name; String get slug;
/// Create a copy of CustomerProductCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductCategoryCopyWith<CustomerProductCategory> get copyWith => _$CustomerProductCategoryCopyWithImpl<CustomerProductCategory>(this as CustomerProductCategory, _$identity);

  /// Serializes this CustomerProductCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'CustomerProductCategory(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $CustomerProductCategoryCopyWith<$Res>  {
  factory $CustomerProductCategoryCopyWith(CustomerProductCategory value, $Res Function(CustomerProductCategory) _then) = _$CustomerProductCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug
});




}
/// @nodoc
class _$CustomerProductCategoryCopyWithImpl<$Res>
    implements $CustomerProductCategoryCopyWith<$Res> {
  _$CustomerProductCategoryCopyWithImpl(this._self, this._then);

  final CustomerProductCategory _self;
  final $Res Function(CustomerProductCategory) _then;

/// Create a copy of CustomerProductCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerProductCategory].
extension CustomerProductCategoryPatterns on CustomerProductCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerProductCategoryEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerProductCategoryEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerProductCategoryEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerProductCategoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerProductCategoryEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerProductCategoryEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String slug)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerProductCategoryEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String slug)  entity,}) {final _that = this;
switch (_that) {
case CustomerProductCategoryEntity():
return entity(_that.id,_that.name,_that.slug);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String slug)?  entity,}) {final _that = this;
switch (_that) {
case CustomerProductCategoryEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerProductCategoryEntity implements CustomerProductCategory {
  const CustomerProductCategoryEntity({required this.id, required this.name, required this.slug});
  factory CustomerProductCategoryEntity.fromJson(Map<String, dynamic> json) => _$CustomerProductCategoryEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;

/// Create a copy of CustomerProductCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductCategoryEntityCopyWith<CustomerProductCategoryEntity> get copyWith => _$CustomerProductCategoryEntityCopyWithImpl<CustomerProductCategoryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerProductCategoryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductCategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'CustomerProductCategory.entity(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $CustomerProductCategoryEntityCopyWith<$Res> implements $CustomerProductCategoryCopyWith<$Res> {
  factory $CustomerProductCategoryEntityCopyWith(CustomerProductCategoryEntity value, $Res Function(CustomerProductCategoryEntity) _then) = _$CustomerProductCategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug
});




}
/// @nodoc
class _$CustomerProductCategoryEntityCopyWithImpl<$Res>
    implements $CustomerProductCategoryEntityCopyWith<$Res> {
  _$CustomerProductCategoryEntityCopyWithImpl(this._self, this._then);

  final CustomerProductCategoryEntity _self;
  final $Res Function(CustomerProductCategoryEntity) _then;

/// Create a copy of CustomerProductCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,}) {
  return _then(CustomerProductCategoryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
