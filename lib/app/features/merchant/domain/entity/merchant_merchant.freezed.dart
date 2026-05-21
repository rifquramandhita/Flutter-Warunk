// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_merchant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantMerchant _$MerchantMerchantFromJson(
  Map<String, dynamic> json
) {
    return MerchantMerchantEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantMerchant {

 String get id; String get name; String get slug; String? get photo; bool get isOpen;
/// Create a copy of MerchantMerchant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantMerchantCopyWith<MerchantMerchant> get copyWith => _$MerchantMerchantCopyWithImpl<MerchantMerchant>(this as MerchantMerchant, _$identity);

  /// Serializes this MerchantMerchant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantMerchant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,photo,isOpen);

@override
String toString() {
  return 'MerchantMerchant(id: $id, name: $name, slug: $slug, photo: $photo, isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class $MerchantMerchantCopyWith<$Res>  {
  factory $MerchantMerchantCopyWith(MerchantMerchant value, $Res Function(MerchantMerchant) _then) = _$MerchantMerchantCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? photo, bool isOpen
});




}
/// @nodoc
class _$MerchantMerchantCopyWithImpl<$Res>
    implements $MerchantMerchantCopyWith<$Res> {
  _$MerchantMerchantCopyWithImpl(this._self, this._then);

  final MerchantMerchant _self;
  final $Res Function(MerchantMerchant) _then;

/// Create a copy of MerchantMerchant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? photo = freezed,Object? isOpen = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantMerchant].
extension MerchantMerchantPatterns on MerchantMerchant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantMerchantEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantMerchantEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantMerchantEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantMerchantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantMerchantEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantMerchantEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String slug,  String? photo,  bool isOpen)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantMerchantEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.photo,_that.isOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String slug,  String? photo,  bool isOpen)  entity,}) {final _that = this;
switch (_that) {
case MerchantMerchantEntity():
return entity(_that.id,_that.name,_that.slug,_that.photo,_that.isOpen);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String slug,  String? photo,  bool isOpen)?  entity,}) {final _that = this;
switch (_that) {
case MerchantMerchantEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.photo,_that.isOpen);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class MerchantMerchantEntity implements MerchantMerchant {
  const MerchantMerchantEntity({required this.id, required this.name, required this.slug, this.photo, required this.isOpen});
  factory MerchantMerchantEntity.fromJson(Map<String, dynamic> json) => _$MerchantMerchantEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String? photo;
@override final  bool isOpen;

/// Create a copy of MerchantMerchant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantMerchantEntityCopyWith<MerchantMerchantEntity> get copyWith => _$MerchantMerchantEntityCopyWithImpl<MerchantMerchantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantMerchantEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantMerchantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,photo,isOpen);

@override
String toString() {
  return 'MerchantMerchant.entity(id: $id, name: $name, slug: $slug, photo: $photo, isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class $MerchantMerchantEntityCopyWith<$Res> implements $MerchantMerchantCopyWith<$Res> {
  factory $MerchantMerchantEntityCopyWith(MerchantMerchantEntity value, $Res Function(MerchantMerchantEntity) _then) = _$MerchantMerchantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? photo, bool isOpen
});




}
/// @nodoc
class _$MerchantMerchantEntityCopyWithImpl<$Res>
    implements $MerchantMerchantEntityCopyWith<$Res> {
  _$MerchantMerchantEntityCopyWithImpl(this._self, this._then);

  final MerchantMerchantEntity _self;
  final $Res Function(MerchantMerchantEntity) _then;

/// Create a copy of MerchantMerchant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? photo = freezed,Object? isOpen = null,}) {
  return _then(MerchantMerchantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
