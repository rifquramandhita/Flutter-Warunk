// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_merchant_quick_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerMerchantQuickCategory _$CustomerMerchantQuickCategoryFromJson(
  Map<String, dynamic> json
) {
    return CustomerMerchantQuickCategoryEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerMerchantQuickCategory {

 String get key; String get name; String get imageUrl;
/// Create a copy of CustomerMerchantQuickCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantQuickCategoryCopyWith<CustomerMerchantQuickCategory> get copyWith => _$CustomerMerchantQuickCategoryCopyWithImpl<CustomerMerchantQuickCategory>(this as CustomerMerchantQuickCategory, _$identity);

  /// Serializes this CustomerMerchantQuickCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantQuickCategory&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,imageUrl);

@override
String toString() {
  return 'CustomerMerchantQuickCategory(key: $key, name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantQuickCategoryCopyWith<$Res>  {
  factory $CustomerMerchantQuickCategoryCopyWith(CustomerMerchantQuickCategory value, $Res Function(CustomerMerchantQuickCategory) _then) = _$CustomerMerchantQuickCategoryCopyWithImpl;
@useResult
$Res call({
 String key, String name, String imageUrl
});




}
/// @nodoc
class _$CustomerMerchantQuickCategoryCopyWithImpl<$Res>
    implements $CustomerMerchantQuickCategoryCopyWith<$Res> {
  _$CustomerMerchantQuickCategoryCopyWithImpl(this._self, this._then);

  final CustomerMerchantQuickCategory _self;
  final $Res Function(CustomerMerchantQuickCategory) _then;

/// Create a copy of CustomerMerchantQuickCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerMerchantQuickCategory].
extension CustomerMerchantQuickCategoryPatterns on CustomerMerchantQuickCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerMerchantQuickCategoryEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerMerchantQuickCategoryEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerMerchantQuickCategoryEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantQuickCategoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerMerchantQuickCategoryEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantQuickCategoryEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String key,  String name,  String imageUrl)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerMerchantQuickCategoryEntity() when entity != null:
return entity(_that.key,_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String key,  String name,  String imageUrl)  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantQuickCategoryEntity():
return entity(_that.key,_that.name,_that.imageUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String key,  String name,  String imageUrl)?  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantQuickCategoryEntity() when entity != null:
return entity(_that.key,_that.name,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerMerchantQuickCategoryEntity implements CustomerMerchantQuickCategory {
  const CustomerMerchantQuickCategoryEntity({required this.key, required this.name, required this.imageUrl});
  factory CustomerMerchantQuickCategoryEntity.fromJson(Map<String, dynamic> json) => _$CustomerMerchantQuickCategoryEntityFromJson(json);

@override final  String key;
@override final  String name;
@override final  String imageUrl;

/// Create a copy of CustomerMerchantQuickCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantQuickCategoryEntityCopyWith<CustomerMerchantQuickCategoryEntity> get copyWith => _$CustomerMerchantQuickCategoryEntityCopyWithImpl<CustomerMerchantQuickCategoryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerMerchantQuickCategoryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantQuickCategoryEntity&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,imageUrl);

@override
String toString() {
  return 'CustomerMerchantQuickCategory.entity(key: $key, name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantQuickCategoryEntityCopyWith<$Res> implements $CustomerMerchantQuickCategoryCopyWith<$Res> {
  factory $CustomerMerchantQuickCategoryEntityCopyWith(CustomerMerchantQuickCategoryEntity value, $Res Function(CustomerMerchantQuickCategoryEntity) _then) = _$CustomerMerchantQuickCategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String key, String name, String imageUrl
});




}
/// @nodoc
class _$CustomerMerchantQuickCategoryEntityCopyWithImpl<$Res>
    implements $CustomerMerchantQuickCategoryEntityCopyWith<$Res> {
  _$CustomerMerchantQuickCategoryEntityCopyWithImpl(this._self, this._then);

  final CustomerMerchantQuickCategoryEntity _self;
  final $Res Function(CustomerMerchantQuickCategoryEntity) _then;

/// Create a copy of CustomerMerchantQuickCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? imageUrl = null,}) {
  return _then(CustomerMerchantQuickCategoryEntity(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
