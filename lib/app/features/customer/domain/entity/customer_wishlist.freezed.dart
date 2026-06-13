// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_wishlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerWishlist _$CustomerWishlistFromJson(
  Map<String, dynamic> json
) {
    return CustomerWishlistAddParam.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerWishlist {

 String get productId;
/// Create a copy of CustomerWishlist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerWishlistCopyWith<CustomerWishlist> get copyWith => _$CustomerWishlistCopyWithImpl<CustomerWishlist>(this as CustomerWishlist, _$identity);

  /// Serializes this CustomerWishlist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerWishlist&&(identical(other.productId, productId) || other.productId == productId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'CustomerWishlist(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $CustomerWishlistCopyWith<$Res>  {
  factory $CustomerWishlistCopyWith(CustomerWishlist value, $Res Function(CustomerWishlist) _then) = _$CustomerWishlistCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$CustomerWishlistCopyWithImpl<$Res>
    implements $CustomerWishlistCopyWith<$Res> {
  _$CustomerWishlistCopyWithImpl(this._self, this._then);

  final CustomerWishlist _self;
  final $Res Function(CustomerWishlist) _then;

/// Create a copy of CustomerWishlist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerWishlist].
extension CustomerWishlistPatterns on CustomerWishlist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerWishlistAddParam value)?  addParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerWishlistAddParam() when addParam != null:
return addParam(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerWishlistAddParam value)  addParam,}){
final _that = this;
switch (_that) {
case CustomerWishlistAddParam():
return addParam(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerWishlistAddParam value)?  addParam,}){
final _that = this;
switch (_that) {
case CustomerWishlistAddParam() when addParam != null:
return addParam(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String productId)?  addParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerWishlistAddParam() when addParam != null:
return addParam(_that.productId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String productId)  addParam,}) {final _that = this;
switch (_that) {
case CustomerWishlistAddParam():
return addParam(_that.productId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String productId)?  addParam,}) {final _that = this;
switch (_that) {
case CustomerWishlistAddParam() when addParam != null:
return addParam(_that.productId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerWishlistAddParam implements CustomerWishlist {
  const CustomerWishlistAddParam({required this.productId});
  factory CustomerWishlistAddParam.fromJson(Map<String, dynamic> json) => _$CustomerWishlistAddParamFromJson(json);

@override final  String productId;

/// Create a copy of CustomerWishlist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerWishlistAddParamCopyWith<CustomerWishlistAddParam> get copyWith => _$CustomerWishlistAddParamCopyWithImpl<CustomerWishlistAddParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerWishlistAddParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerWishlistAddParam&&(identical(other.productId, productId) || other.productId == productId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'CustomerWishlist.addParam(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $CustomerWishlistAddParamCopyWith<$Res> implements $CustomerWishlistCopyWith<$Res> {
  factory $CustomerWishlistAddParamCopyWith(CustomerWishlistAddParam value, $Res Function(CustomerWishlistAddParam) _then) = _$CustomerWishlistAddParamCopyWithImpl;
@override @useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$CustomerWishlistAddParamCopyWithImpl<$Res>
    implements $CustomerWishlistAddParamCopyWith<$Res> {
  _$CustomerWishlistAddParamCopyWithImpl(this._self, this._then);

  final CustomerWishlistAddParam _self;
  final $Res Function(CustomerWishlistAddParam) _then;

/// Create a copy of CustomerWishlist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(CustomerWishlistAddParam(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
