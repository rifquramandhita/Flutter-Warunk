// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_merchant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerMerchant _$CustomerMerchantFromJson(
  Map<String, dynamic> json
) {
    return CustomerMerchantEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerMerchant {

 String get id; String get name; String get slug; String get photo; bool get isActive; bool get isOpen;
/// Create a copy of CustomerMerchant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantCopyWith<CustomerMerchant> get copyWith => _$CustomerMerchantCopyWithImpl<CustomerMerchant>(this as CustomerMerchant, _$identity);

  /// Serializes this CustomerMerchant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,photo,isActive,isOpen);

@override
String toString() {
  return 'CustomerMerchant(id: $id, name: $name, slug: $slug, photo: $photo, isActive: $isActive, isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantCopyWith<$Res>  {
  factory $CustomerMerchantCopyWith(CustomerMerchant value, $Res Function(CustomerMerchant) _then) = _$CustomerMerchantCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String photo, bool isActive, bool isOpen
});




}
/// @nodoc
class _$CustomerMerchantCopyWithImpl<$Res>
    implements $CustomerMerchantCopyWith<$Res> {
  _$CustomerMerchantCopyWithImpl(this._self, this._then);

  final CustomerMerchant _self;
  final $Res Function(CustomerMerchant) _then;

/// Create a copy of CustomerMerchant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? photo = null,Object? isActive = null,Object? isOpen = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerMerchant].
extension CustomerMerchantPatterns on CustomerMerchant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerMerchantEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerMerchantEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerMerchantEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerMerchantEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String slug,  String photo,  bool isActive,  bool isOpen)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerMerchantEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.photo,_that.isActive,_that.isOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String slug,  String photo,  bool isActive,  bool isOpen)  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantEntity():
return entity(_that.id,_that.name,_that.slug,_that.photo,_that.isActive,_that.isOpen);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String slug,  String photo,  bool isActive,  bool isOpen)?  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.photo,_that.isActive,_that.isOpen);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerMerchantEntity implements CustomerMerchant {
  const CustomerMerchantEntity({required this.id, required this.name, required this.slug, required this.photo, required this.isActive, required this.isOpen});
  factory CustomerMerchantEntity.fromJson(Map<String, dynamic> json) => _$CustomerMerchantEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String photo;
@override final  bool isActive;
@override final  bool isOpen;

/// Create a copy of CustomerMerchant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantEntityCopyWith<CustomerMerchantEntity> get copyWith => _$CustomerMerchantEntityCopyWithImpl<CustomerMerchantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerMerchantEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,photo,isActive,isOpen);

@override
String toString() {
  return 'CustomerMerchant.entity(id: $id, name: $name, slug: $slug, photo: $photo, isActive: $isActive, isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantEntityCopyWith<$Res> implements $CustomerMerchantCopyWith<$Res> {
  factory $CustomerMerchantEntityCopyWith(CustomerMerchantEntity value, $Res Function(CustomerMerchantEntity) _then) = _$CustomerMerchantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String photo, bool isActive, bool isOpen
});




}
/// @nodoc
class _$CustomerMerchantEntityCopyWithImpl<$Res>
    implements $CustomerMerchantEntityCopyWith<$Res> {
  _$CustomerMerchantEntityCopyWithImpl(this._self, this._then);

  final CustomerMerchantEntity _self;
  final $Res Function(CustomerMerchantEntity) _then;

/// Create a copy of CustomerMerchant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? photo = null,Object? isActive = null,Object? isOpen = null,}) {
  return _then(CustomerMerchantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
